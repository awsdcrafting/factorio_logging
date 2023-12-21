#!/usr/bin/python
import json
import re

import os
import urllib.request

# file location of latest factorio api in json format as can be found here: https://lua-api.factorio.com/latest/runtime-api.json
factorio_api_file_location = "./factorio-api.json"
data_filler_location = "./scis_logging/data_filler.lua"
relative_data_filler_location = "data_filler"
possible_data_fillers = "./data_fillers.lua"
event_filler_location = "./scis_logging/event_filler.lua"

pattern = re.compile(r'(?<!^)(?=[A-Z])')

builtin = []
concepts = []
defines = []


def parse_builtin(api):
    global builtin
    for builtin_type in api["builtin_types"]:
        builtin += [builtin_type["name"]]
    # print(builtin)


def parse_concepts(api):
    global concepts
    for concept in api["concepts"]:
        concepts += [concept["name"]]
    # print(concepts)


def parse_defines(api):
    global defines
    for define in api["defines"]:
        defines += [f'defines.{define["name"]}']


def camel_to_snake(string):
    snake = pattern.sub("_", string).lower().removeprefix("lua_").strip()
    if snake == "r_c_o_n":
        return "rcon"
    elif snake == "a_i_settings":
        return "ai_settings"
    else:
        return snake


def is_basic(data_type):
    global builtin
    global concepts
    global defines
    return data_type in builtin or data_type in concepts or data_type in defines


def resolve_base_classes(classes):
    resolved = {}
    unresolved = classes
    max_steps = 10
    steps = 0
    while len(unresolved) > 0:
        steps += 1
        if steps > max_steps:
            print(f"ERROR: could not resolve all classes after {max_steps} steps!")
            break
        # stage 1
        new_resolved = []
        for lua_class in unresolved:
            if "base_classes" in lua_class:
                continue
            resolved[lua_class["name"]] = lua_class
            new_resolved += [lua_class]
        unresolved = list(filter(lambda v: v not in new_resolved, unresolved))
        # stage 2
        for lua_class in unresolved:
            resolved_classes = []
            for base_class in lua_class["base_classes"]:
                if base_class not in resolved:
                    continue
                for attribute in resolved[base_class]["attributes"]:
                    lua_class["attributes"][attribute] = True
                resolved_classes += [base_class]
            lua_class["base_classes"] = list(filter(lambda v: v not in resolved_classes, lua_class["base_classes"]))
            if len(lua_class["base_classes"]) == 0:
                del lua_class["base_classes"]
    return resolved.values()


def generate_data_filler(api):
    data = []
    for lua_class in api["classes"]:
        class_data = {}
        class_data["name"] = camel_to_snake(lua_class["name"])
        class_data["lua_name"] = lua_class["name"]
        class_data["attributes"] = {}
        # print(lua_class)
        # print(lua_class["attributes"])
        for attribute in lua_class["attributes"]:
            name = attribute["name"]
            data_type = attribute["type"]
            if is_basic(data_type):
                class_data["attributes"][name] = True
        if "base_classes" in lua_class:
            class_data["base_classes"] = [camel_to_snake(x) for x in lua_class["base_classes"]]
        data += [class_data]
        # print(class_data)
    resolved_classes = resolve_base_classes(data)
    return resolved_classes


def write_data_filler(data_fillers):
    with open(possible_data_fillers, "w") as data_filler_file:
        data_filler_file.write("local data_fillers = {}\n")
        for data_filler in data_fillers:
            data_filler_file.write(f'\ndata_fillers["{data_filler["name"]}"] = function(obj)\n')
            data_filler_file.write("    local data = {}\n")

            for attribute in data_filler["attributes"]:
                data_filler_file.write(f'    data["{attribute}"] = obj["{attribute}"]\n')

            data_filler_file.write("    return data\n")
            data_filler_file.write("end\n")

        data_filler_file.write("\nreturn data_fillers\n")
    with open(data_filler_location, "w") as data_filler_file:
        data_filler_file.write("local data_fillers = {}\n")
        for data_filler in data_fillers:
            data_filler_file.write(f'\ndata_fillers["{data_filler["name"]}"] = function(obj)\n')
            data_filler_file.write("    local data = {}\n")
            data_filler_file.write("    \n")
            data_filler_file.write("    return data\n")
            data_filler_file.write("end\n")

        data_filler_file.write("\nreturn data_fillers\n")


def check_used_data(event_fillers, data_fillers):
    used = []
    for event_filler in event_fillers:
        for data in event_filler["data"]:
            if is_basic(data["type"]):
                continue
            if data["type"] in used:
                continue
            used += [data["type"]]
    used_data_fillers = [x for x in data_fillers if x["lua_name"] in used or f'{x["name"]}_index' in used]
    return used_data_fillers


def generate_event_filler(api):
    event_fillers = []
    for event in api["events"]:
        event_filler = {}
        event_filler["name"] = event["name"]
        event_filler["data"] = [{"name": data["name"], "type": data["type"], "optional": data["optional"]} for data in event["data"]]
        event_fillers += [event_filler]
    # print(event_fillers)
    return event_fillers


def write_event_filler(event_fillers, data_filler_names):
    with open(event_filler_location, "w") as event_filler_file:
        event_filler_file.write("-- THIS FILE IS AUTOGENERATED DO NOT EDIT! --\n")
        event_filler_file.write(f'local data_fillers = require("{relative_data_filler_location}")\n')
        event_filler_file.write("\nlocal event_fillers = {}\n")
        for event_filler in event_fillers:
            event_filler_file.write(f'\nevent_fillers["{event_filler["name"]}"] = function(event)\n')

            for event_data in event_filler["data"]:
                wrapcount = 0
                to_write = []
                prefix = f'event["{event_data["name"]}"] = '
                if is_basic(event_data["type"]):
                    if event_data["name"].endswith("_index") and event_data["name"][:-6] in data_filler_names:
                        name = event_data["name"][:-6]
                        to_write += [f'local {name} = game.get_{name}(event["{event_data["name"]}"])\n']
                        to_write += [f'if {name} ~= nil then\n']
                        to_write += [f'    event["{name}"] = data_fillers["{name}"]({name})\n']
                        to_write += [f'end\n']
                    pass
                elif type(event_data["type"]) == str and camel_to_snake(event_data["type"]) in data_filler_names:
                    to_write += [f'{prefix}data_fillers["{camel_to_snake(event_data["type"])}"](event["{event_data["name"]}"])\n']
                else:
                    print(f'unknown event_data: {event_filler["name"]}: {event_data}')
                if event_data["optional"] and to_write:
                    event_filler_file.write(f'{" " * (4 + wrapcount * 4)}if event["{event_data["name"]}"] ~= nil then\n')
                    wrapcount += 1
                    event_filler_file.write(" " * (4 + wrapcount * 4))
                    event_filler_file.write(f'{" " * (4 + wrapcount * 4)}'.join(to_write))
                elif to_write:
                    event_filler_file.write(" " * (4 + wrapcount * 4))
                    event_filler_file.write(f'{" " * (4 + wrapcount * 4)}'.join(to_write))
                
                while wrapcount > 0:
                    wrapcount -= 1
                    event_filler_file.write(f'{" " * (4 + wrapcount * 4)}end\n')

            event_filler_file.write("    return event\n")
            event_filler_file.write("end\n")
        event_filler_file.write("\nreturn event_fillers\n")


def main():
    if not os.path.isfile(factorio_api_file_location):
        urllib.request.urlretrieve("https://lua-api.factorio.com/latest/runtime-api.json", "factorio-api.json")
    
    with open(factorio_api_file_location, "r") as factorio_api_file:
        factorio_api = json.load(factorio_api_file)
        # print(factorio_api)
        parse_builtin(factorio_api)
        parse_concepts(factorio_api)
        parse_defines(factorio_api)
        data_fillers = generate_data_filler(factorio_api)
        event_fillers = generate_event_filler(factorio_api)
        data_fillers = check_used_data(event_fillers, data_fillers)
        data_filler_names = [x["name"] for x in data_fillers]
        write_event_filler(event_fillers, data_filler_names)

        # write_data_filler(data_fillers)


if __name__ == "__main__":
    main()
