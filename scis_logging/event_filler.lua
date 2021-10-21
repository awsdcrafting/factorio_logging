local data_fillers = require("data_filler")

local event_fillers = {}

event_fillers["CustomInputEvent"] = function(event)
    local event_data = {}

    event_data["cursor_position"] = event["cursor_position"]
    event_data["input_name"] = event["input_name"]
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    if event["selected_prototype"] ~= nil then
        event_data["selected_prototype"] = event["selected_prototype"]
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_ai_command_completed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["result"] = event["result"]
    event_data["tick"] = event["tick"]
    event_data["unit_number"] = event["unit_number"]
    event_data["was_distracted"] = event["was_distracted"]

    return event_data
end

event_fillers["on_area_cloned"] = function(event)
    local event_data = {}

    event_data["clear_destination_decoratives"] = event["clear_destination_decoratives"]
    event_data["clear_destination_entities"] = event["clear_destination_entities"]
    event_data["clone_decoratives"] = event["clone_decoratives"]
    event_data["clone_entities"] = event["clone_entities"]
    event_data["clone_tiles"] = event["clone_tiles"]
    event_data["destination_area"] = event["destination_area"]
    if event["destination_force"] ~= nil then
        event_data["destination_force"] = data_fillers["force"](event["destination_force"])
    end
    event_data["destination_surface"] = data_fillers["surface"](event["destination_surface"])
    event_data["name"] = event["name"]
    event_data["source_area"] = event["source_area"]
    event_data["source_surface"] = data_fillers["surface"](event["source_surface"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_biter_base_built"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_brush_cloned"] = function(event)
    local event_data = {}

    event_data["clear_destination_decoratives"] = event["clear_destination_decoratives"]
    event_data["clear_destination_entities"] = event["clear_destination_entities"]
    event_data["clone_decoratives"] = event["clone_decoratives"]
    event_data["clone_entities"] = event["clone_entities"]
    event_data["clone_tiles"] = event["clone_tiles"]
    if event["destination_force"] ~= nil then
        event_data["destination_force"] = data_fillers["force"](event["destination_force"])
    end
    event_data["destination_offset"] = event["destination_offset"]
    event_data["destination_surface"] = data_fillers["surface"](event["destination_surface"])
    event_data["name"] = event["name"]
    event_data["source_offset"] = event["source_offset"]
    event_data["source_surface"] = data_fillers["surface"](event["source_surface"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_build_base_arrived"] = function(event)
    local event_data = {}

    if event["group"] ~= nil then
        event_data["group"] = data_fillers["unit_group"](event["group"])
    end
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]
    if event["unit"] ~= nil then
        event_data["unit"] = data_fillers["entity"](event["unit"])
    end

    return event_data
end

event_fillers["on_built_entity"] = function(event)
    local event_data = {}

    event_data["created_entity"] = data_fillers["entity"](event["created_entity"])
    if event["item"] ~= nil then
        event_data["item"] = data_fillers["item_prototype"](event["item"])
    end
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["stack"] = data_fillers["item_stack"](event["stack"])
    if event["tags"] ~= nil then
        event_data["tags"] = event["tags"]
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_cancelled_deconstruction"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_cancelled_upgrade"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_character_corpse_expired"] = function(event)
    local event_data = {}

    event_data["corpse"] = data_fillers["entity"](event["corpse"])
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_chart_tag_added"] = function(event)
    local event_data = {}

    event_data["force"] = data_fillers["force"](event["force"])
    event_data["name"] = event["name"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["tag"] = data_fillers["custom_chart_tag"](event["tag"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_chart_tag_modified"] = function(event)
    local event_data = {}

    event_data["force"] = data_fillers["force"](event["force"])
    event_data["name"] = event["name"]
    if event["old_icon"] ~= nil then
        event_data["old_icon"] = event["old_icon"]
    end
    if event["old_player"] ~= nil then
        event_data["old_player"] = event["old_player"]
    end
    event_data["old_text"] = event["old_text"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["tag"] = data_fillers["custom_chart_tag"](event["tag"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_chart_tag_removed"] = function(event)
    local event_data = {}

    event_data["force"] = data_fillers["force"](event["force"])
    event_data["name"] = event["name"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["tag"] = data_fillers["custom_chart_tag"](event["tag"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_chunk_charted"] = function(event)
    local event_data = {}

    event_data["area"] = event["area"]
    event_data["force"] = data_fillers["force"](event["force"])
    event_data["name"] = event["name"]
    event_data["position"] = event["position"]
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_chunk_deleted"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_chunk_generated"] = function(event)
    local event_data = {}

    event_data["area"] = event["area"]
    event_data["name"] = event["name"]
    event_data["position"] = event["position"]
    event_data["surface"] = data_fillers["surface"](event["surface"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_combat_robot_expired"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    if event["owner"] ~= nil then
        event_data["owner"] = data_fillers["entity"](event["owner"])
    end
    event_data["robot"] = data_fillers["entity"](event["robot"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_console_chat"] = function(event)
    local event_data = {}

    event_data["message"] = event["message"]
    event_data["name"] = event["name"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_console_command"] = function(event)
    local event_data = {}

    event_data["command"] = event["command"]
    event_data["name"] = event["name"]
    event_data["parameters"] = event["parameters"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_cutscene_cancelled"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_cutscene_waypoint_reached"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]
    event_data["waypoint_index"] = event["waypoint_index"]

    return event_data
end

event_fillers["on_difficulty_settings_changed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["old_recipe_difficulty"] = event["old_recipe_difficulty"]
    event_data["old_technology_difficulty"] = event["old_technology_difficulty"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_entity_cloned"] = function(event)
    local event_data = {}

    event_data["destination"] = data_fillers["entity"](event["destination"])
    event_data["name"] = event["name"]
    event_data["source"] = data_fillers["entity"](event["source"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_entity_damaged"] = function(event)
    local event_data = {}

    if event["cause"] ~= nil then
        event_data["cause"] = data_fillers["entity"](event["cause"])
    end
    event_data["damage_type"] = data_fillers["damage_prototype"](event["damage_type"])
    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["final_damage_amount"] = event["final_damage_amount"]
    event_data["final_health"] = event["final_health"]
    if event["force"] ~= nil then
        event_data["force"] = data_fillers["force"](event["force"])
    end
    event_data["name"] = event["name"]
    event_data["original_damage_amount"] = event["original_damage_amount"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_entity_destroyed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["registration_number"] = event["registration_number"]
    event_data["tick"] = event["tick"]
    if event["unit_number"] ~= nil then
        event_data["unit_number"] = event["unit_number"]
    end

    return event_data
end

event_fillers["on_entity_died"] = function(event)
    local event_data = {}

    if event["cause"] ~= nil then
        event_data["cause"] = data_fillers["entity"](event["cause"])
    end
    if event["damage_type"] ~= nil then
        event_data["damage_type"] = data_fillers["damage_prototype"](event["damage_type"])
    end
    event_data["entity"] = data_fillers["entity"](event["entity"])
    if event["force"] ~= nil then
        event_data["force"] = data_fillers["force"](event["force"])
    end
    event_data["loot"] = data_fillers["inventory"](event["loot"])
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_entity_logistic_slot_changed"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["slot_index"] = event["slot_index"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_entity_renamed"] = function(event)
    local event_data = {}

    event_data["by_script"] = event["by_script"]
    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    event_data["old_name"] = event["old_name"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_entity_settings_pasted"] = function(event)
    local event_data = {}

    event_data["destination"] = data_fillers["entity"](event["destination"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["source"] = data_fillers["entity"](event["source"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_entity_spawned"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    event_data["spawner"] = data_fillers["entity"](event["spawner"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_equipment_inserted"] = function(event)
    local event_data = {}

    event_data["equipment"] = data_fillers["equipment"](event["equipment"])
    event_data["grid"] = data_fillers["equipment_grid"](event["grid"])
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_equipment_removed"] = function(event)
    local event_data = {}

    event_data["count"] = event["count"]
    event_data["equipment"] = event["equipment"]
    event_data["grid"] = data_fillers["equipment_grid"](event["grid"])
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_force_cease_fire_changed"] = function(event)
    local event_data = {}

    event_data["added"] = event["added"]
    event_data["force"] = data_fillers["force"](event["force"])
    event_data["name"] = event["name"]
    event_data["other_force"] = data_fillers["force"](event["other_force"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_force_created"] = function(event)
    local event_data = {}

    event_data["force"] = data_fillers["force"](event["force"])
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_force_friends_changed"] = function(event)
    local event_data = {}

    event_data["added"] = event["added"]
    event_data["force"] = data_fillers["force"](event["force"])
    event_data["name"] = event["name"]
    event_data["other_force"] = data_fillers["force"](event["other_force"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_force_reset"] = function(event)
    local event_data = {}

    event_data["force"] = data_fillers["force"](event["force"])
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_forces_merged"] = function(event)
    local event_data = {}

    event_data["destination"] = data_fillers["force"](event["destination"])
    event_data["name"] = event["name"]
    event_data["source_index"] = event["source_index"]
    event_data["source_name"] = event["source_name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_forces_merging"] = function(event)
    local event_data = {}

    event_data["destination"] = data_fillers["force"](event["destination"])
    event_data["name"] = event["name"]
    event_data["source"] = data_fillers["force"](event["source"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_game_created_from_scenario"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_gui_checked_state_changed"] = function(event)
    local event_data = {}

    event_data["element"] = data_fillers["gui_element"](event["element"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_gui_click"] = function(event)
    local event_data = {}

    event_data["alt"] = event["alt"]
    event_data["button"] = event["button"]
    event_data["control"] = event["control"]
    event_data["element"] = data_fillers["gui_element"](event["element"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["shift"] = event["shift"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_gui_closed"] = function(event)
    local event_data = {}

    if event["element"] ~= nil then
        event_data["element"] = data_fillers["gui_element"](event["element"])
    end
    if event["entity"] ~= nil then
        event_data["entity"] = data_fillers["entity"](event["entity"])
    end
    if event["equipment"] ~= nil then
        event_data["equipment"] = data_fillers["equipment"](event["equipment"])
    end
    event_data["gui_type"] = event["gui_type"]
    if event["item"] ~= nil then
        event_data["item"] = data_fillers["item_stack"](event["item"])
    end
    event_data["name"] = event["name"]
    if event["other_player"] ~= nil then
        event_data["other_player"] = data_fillers["player"](event["other_player"])
    end
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    if event["technology"] ~= nil then
        event_data["technology"] = data_fillers["technology"](event["technology"])
    end
    event_data["tick"] = event["tick"]
    if event["tile_position"] ~= nil then
        event_data["tile_position"] = event["tile_position"]
    end

    return event_data
end

event_fillers["on_gui_confirmed"] = function(event)
    local event_data = {}

    event_data["alt"] = event["alt"]
    event_data["control"] = event["control"]
    event_data["element"] = data_fillers["gui_element"](event["element"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["shift"] = event["shift"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_gui_elem_changed"] = function(event)
    local event_data = {}

    event_data["element"] = data_fillers["gui_element"](event["element"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_gui_location_changed"] = function(event)
    local event_data = {}

    event_data["element"] = data_fillers["gui_element"](event["element"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_gui_opened"] = function(event)
    local event_data = {}

    if event["element"] ~= nil then
        event_data["element"] = data_fillers["gui_element"](event["element"])
    end
    if event["entity"] ~= nil then
        event_data["entity"] = data_fillers["entity"](event["entity"])
    end
    if event["equipment"] ~= nil then
        event_data["equipment"] = data_fillers["equipment"](event["equipment"])
    end
    event_data["gui_type"] = event["gui_type"]
    if event["item"] ~= nil then
        event_data["item"] = data_fillers["item_stack"](event["item"])
    end
    event_data["name"] = event["name"]
    if event["other_player"] ~= nil then
        event_data["other_player"] = data_fillers["player"](event["other_player"])
    end
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_gui_selected_tab_changed"] = function(event)
    local event_data = {}

    event_data["element"] = data_fillers["gui_element"](event["element"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_gui_selection_state_changed"] = function(event)
    local event_data = {}

    event_data["element"] = data_fillers["gui_element"](event["element"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_gui_switch_state_changed"] = function(event)
    local event_data = {}

    event_data["element"] = data_fillers["gui_element"](event["element"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_gui_text_changed"] = function(event)
    local event_data = {}

    event_data["element"] = data_fillers["gui_element"](event["element"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["text"] = event["text"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_gui_value_changed"] = function(event)
    local event_data = {}

    event_data["element"] = data_fillers["gui_element"](event["element"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_land_mine_armed"] = function(event)
    local event_data = {}

    event_data["mine"] = data_fillers["entity"](event["mine"])
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_lua_shortcut"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["prototype_name"] = event["prototype_name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_marked_for_deconstruction"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_marked_for_upgrade"] = function(event)
    local event_data = {}

    if event["direction"] ~= nil then
        event_data["direction"] = event["direction"]
    end
    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["target"] = data_fillers["entity_prototype"](event["target"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_market_item_purchased"] = function(event)
    local event_data = {}

    event_data["count"] = event["count"]
    event_data["market"] = data_fillers["entity"](event["market"])
    event_data["name"] = event["name"]
    event_data["offer_index"] = event["offer_index"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_mod_item_opened"] = function(event)
    local event_data = {}

    event_data["item"] = data_fillers["item_prototype"](event["item"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_permission_group_added"] = function(event)
    local event_data = {}

    event_data["group"] = data_fillers["permission_group"](event["group"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_permission_group_deleted"] = function(event)
    local event_data = {}

    event_data["group_name"] = event["group_name"]
    event_data["id"] = event["id"]
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_permission_group_edited"] = function(event)
    local event_data = {}

    event_data["action"] = event["action"]
    event_data["group"] = data_fillers["permission_group"](event["group"])
    event_data["name"] = event["name"]
    event_data["new_name"] = event["new_name"]
    event_data["old_name"] = event["old_name"]
    event_data["other_player_index"] = event["other_player_index"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]
    event_data["type"] = event["type"]

    return event_data
end

event_fillers["on_permission_string_imported"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_picked_up_item"] = function(event)
    local event_data = {}

    event_data["item_stack"] = event["item_stack"]
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_alt_selected_area"] = function(event)
    local event_data = {}

    event_data["area"] = event["area"]
    event_data["item"] = event["item"]
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["surface"] = data_fillers["surface"](event["surface"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_ammo_inventory_changed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_armor_inventory_changed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_banned"] = function(event)
    local event_data = {}

    if event["by_player"] ~= nil then
        event_data["by_player"] = event["by_player"]
    end
    event_data["name"] = event["name"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["player_name"] = event["player_name"]
    if event["reason"] ~= nil then
        event_data["reason"] = event["reason"]
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_built_tile"] = function(event)
    local event_data = {}

    if event["item"] ~= nil then
        event_data["item"] = data_fillers["item_prototype"](event["item"])
    end
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    if event["stack"] ~= nil then
        event_data["stack"] = data_fillers["item_stack"](event["stack"])
    end
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]
    event_data["tile"] = data_fillers["tile_prototype"](event["tile"])

    return event_data
end

event_fillers["on_player_cancelled_crafting"] = function(event)
    local event_data = {}

    event_data["cancel_count"] = event["cancel_count"]
    event_data["items"] = data_fillers["inventory"](event["items"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["recipe"] = data_fillers["recipe"](event["recipe"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_changed_force"] = function(event)
    local event_data = {}

    event_data["force"] = data_fillers["force"](event["force"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_changed_position"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_changed_surface"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_cheat_mode_disabled"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_cheat_mode_enabled"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_clicked_gps_tag"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["position"] = event["position"]
    event_data["surface"] = event["surface"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_configured_blueprint"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_configured_spider_remote"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]
    event_data["vehicle"] = data_fillers["entity"](event["vehicle"])

    return event_data
end

event_fillers["on_player_crafted_item"] = function(event)
    local event_data = {}

    event_data["item_stack"] = data_fillers["item_stack"](event["item_stack"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["recipe"] = data_fillers["recipe"](event["recipe"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_created"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_cursor_stack_changed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_deconstructed_area"] = function(event)
    local event_data = {}

    event_data["alt"] = event["alt"]
    event_data["area"] = event["area"]
    event_data["item"] = event["item"]
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["surface"] = data_fillers["surface"](event["surface"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_demoted"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_died"] = function(event)
    local event_data = {}

    if event["cause"] ~= nil then
        event_data["cause"] = data_fillers["entity"](event["cause"])
    end
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_display_resolution_changed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["old_resolution"] = event["old_resolution"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_display_scale_changed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["old_scale"] = event["old_scale"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_driving_changed_state"] = function(event)
    local event_data = {}

    if event["entity"] ~= nil then
        event_data["entity"] = data_fillers["entity"](event["entity"])
    end
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_dropped_item"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_fast_transferred"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["from_player"] = event["from_player"]
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_flushed_fluid"] = function(event)
    local event_data = {}

    event_data["amount"] = event["amount"]
    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["fluid"] = event["fluid"]
    event_data["name"] = event["name"]
    event_data["only_this_entity"] = event["only_this_entity"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_gun_inventory_changed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_joined_game"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_kicked"] = function(event)
    local event_data = {}

    if event["by_player"] ~= nil then
        event_data["by_player"] = event["by_player"]
    end
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    if event["reason"] ~= nil then
        event_data["reason"] = event["reason"]
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_left_game"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["reason"] = event["reason"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_main_inventory_changed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_mined_entity"] = function(event)
    local event_data = {}

    event_data["buffer"] = data_fillers["inventory"](event["buffer"])
    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_mined_item"] = function(event)
    local event_data = {}

    event_data["item_stack"] = event["item_stack"]
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_mined_tile"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_muted"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_pipette"] = function(event)
    local event_data = {}

    event_data["item"] = data_fillers["item_prototype"](event["item"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]
    event_data["used_cheat_mode"] = event["used_cheat_mode"]

    return event_data
end

event_fillers["on_player_placed_equipment"] = function(event)
    local event_data = {}

    event_data["equipment"] = data_fillers["equipment"](event["equipment"])
    event_data["grid"] = data_fillers["equipment_grid"](event["grid"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_promoted"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_removed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_removed_equipment"] = function(event)
    local event_data = {}

    event_data["count"] = event["count"]
    event_data["equipment"] = event["equipment"]
    event_data["grid"] = data_fillers["equipment_grid"](event["grid"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_repaired_entity"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_respawned"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    if event["player_port"] ~= nil then
        event_data["player_port"] = data_fillers["entity"](event["player_port"])
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_rotated_entity"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["previous_direction"] = event["previous_direction"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_selected_area"] = function(event)
    local event_data = {}

    event_data["area"] = event["area"]
    event_data["item"] = event["item"]
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["surface"] = data_fillers["surface"](event["surface"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_set_quick_bar_slot"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_setup_blueprint"] = function(event)
    local event_data = {}

    event_data["alt"] = event["alt"]
    event_data["area"] = event["area"]
    event_data["item"] = event["item"]
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["surface"] = data_fillers["surface"](event["surface"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_toggled_alt_mode"] = function(event)
    local event_data = {}

    event_data["alt_mode"] = event["alt_mode"]
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_toggled_map_editor"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_trash_inventory_changed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_unbanned"] = function(event)
    local event_data = {}

    if event["by_player"] ~= nil then
        event_data["by_player"] = event["by_player"]
    end
    event_data["name"] = event["name"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["player_name"] = event["player_name"]
    if event["reason"] ~= nil then
        event_data["reason"] = event["reason"]
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_unmuted"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_used_capsule"] = function(event)
    local event_data = {}

    event_data["item"] = data_fillers["item_prototype"](event["item"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["position"] = event["position"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_player_used_spider_remote"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["position"] = event["position"]
    event_data["success"] = event["success"]
    event_data["tick"] = event["tick"]
    event_data["vehicle"] = data_fillers["entity"](event["vehicle"])

    return event_data
end

event_fillers["on_post_entity_died"] = function(event)
    local event_data = {}

    if event["damage_type"] ~= nil then
        event_data["damage_type"] = data_fillers["damage_prototype"](event["damage_type"])
    end
    if event["force"] ~= nil then
        event_data["force"] = data_fillers["force"](event["force"])
    end
    if event["ghost"] ~= nil then
        event_data["ghost"] = data_fillers["entity"](event["ghost"])
    end
    event_data["name"] = event["name"]
    event_data["position"] = event["position"]
    event_data["prototype"] = data_fillers["entity_prototype"](event["prototype"])
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]
    if event["unit_number"] ~= nil then
        event_data["unit_number"] = event["unit_number"]
    end

    return event_data
end

event_fillers["on_pre_build"] = function(event)
    local event_data = {}

    event_data["created_by_moving"] = event["created_by_moving"]
    event_data["direction"] = event["direction"]
    event_data["flip_horizontal"] = event["flip_horizontal"]
    event_data["flip_vertical"] = event["flip_vertical"]
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["position"] = event["position"]
    event_data["shift_build"] = event["shift_build"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_pre_chunk_deleted"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_pre_entity_settings_pasted"] = function(event)
    local event_data = {}

    event_data["destination"] = data_fillers["entity"](event["destination"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["source"] = data_fillers["entity"](event["source"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_pre_ghost_deconstructed"] = function(event)
    local event_data = {}

    event_data["ghost"] = data_fillers["entity"](event["ghost"])
    event_data["name"] = event["name"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_pre_permission_group_deleted"] = function(event)
    local event_data = {}

    event_data["group"] = data_fillers["permission_group"](event["group"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_pre_permission_string_imported"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_pre_player_crafted_item"] = function(event)
    local event_data = {}

    event_data["items"] = data_fillers["inventory"](event["items"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["queued_count"] = event["queued_count"]
    event_data["recipe"] = data_fillers["recipe"](event["recipe"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_pre_player_died"] = function(event)
    local event_data = {}

    if event["cause"] ~= nil then
        event_data["cause"] = data_fillers["entity"](event["cause"])
    end
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_pre_player_left_game"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["reason"] = event["reason"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_pre_player_mined_item"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_pre_player_removed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_pre_player_toggled_map_editor"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_pre_robot_exploded_cliff"] = function(event)
    local event_data = {}

    event_data["cliff"] = data_fillers["entity"](event["cliff"])
    event_data["item"] = data_fillers["item_prototype"](event["item"])
    event_data["name"] = event["name"]
    event_data["robot"] = data_fillers["entity"](event["robot"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_pre_script_inventory_resized"] = function(event)
    local event_data = {}

    event_data["inventory"] = data_fillers["inventory"](event["inventory"])
    event_data["mod"] = event["mod"]
    event_data["name"] = event["name"]
    event_data["new_size"] = event["new_size"]
    event_data["old_size"] = event["old_size"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_pre_surface_cleared"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_pre_surface_deleted"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_research_finished"] = function(event)
    local event_data = {}

    event_data["by_script"] = event["by_script"]
    event_data["name"] = event["name"]
    event_data["research"] = data_fillers["technology"](event["research"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_research_reversed"] = function(event)
    local event_data = {}

    event_data["by_script"] = event["by_script"]
    event_data["name"] = event["name"]
    event_data["research"] = data_fillers["technology"](event["research"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_research_started"] = function(event)
    local event_data = {}

    if event["last_research"] ~= nil then
        event_data["last_research"] = data_fillers["technology"](event["last_research"])
    end
    event_data["name"] = event["name"]
    event_data["research"] = data_fillers["technology"](event["research"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_resource_depleted"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_robot_built_entity"] = function(event)
    local event_data = {}

    event_data["created_entity"] = data_fillers["entity"](event["created_entity"])
    event_data["name"] = event["name"]
    event_data["robot"] = data_fillers["entity"](event["robot"])
    event_data["stack"] = data_fillers["item_stack"](event["stack"])
    if event["tags"] ~= nil then
        event_data["tags"] = event["tags"]
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_robot_built_tile"] = function(event)
    local event_data = {}

    event_data["item"] = data_fillers["item_prototype"](event["item"])
    event_data["name"] = event["name"]
    event_data["robot"] = data_fillers["entity"](event["robot"])
    event_data["stack"] = data_fillers["item_stack"](event["stack"])
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]
    event_data["tile"] = data_fillers["tile_prototype"](event["tile"])

    return event_data
end

event_fillers["on_robot_exploded_cliff"] = function(event)
    local event_data = {}

    event_data["item"] = data_fillers["item_prototype"](event["item"])
    event_data["name"] = event["name"]
    event_data["robot"] = data_fillers["entity"](event["robot"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_robot_mined"] = function(event)
    local event_data = {}

    event_data["item_stack"] = event["item_stack"]
    event_data["name"] = event["name"]
    event_data["robot"] = data_fillers["entity"](event["robot"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_robot_mined_entity"] = function(event)
    local event_data = {}

    event_data["buffer"] = data_fillers["inventory"](event["buffer"])
    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    event_data["robot"] = data_fillers["entity"](event["robot"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_robot_mined_tile"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["robot"] = data_fillers["entity"](event["robot"])
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_robot_pre_mined"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    event_data["robot"] = data_fillers["entity"](event["robot"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_rocket_launch_ordered"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["rocket"] = data_fillers["entity"](event["rocket"])
    event_data["rocket_silo"] = data_fillers["entity"](event["rocket_silo"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_rocket_launched"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["rocket"] = data_fillers["entity"](event["rocket"])
    if event["rocket_silo"] ~= nil then
        event_data["rocket_silo"] = data_fillers["entity"](event["rocket_silo"])
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_runtime_mod_setting_changed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["setting"] = event["setting"]
    event_data["setting_type"] = event["setting_type"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_script_inventory_resized"] = function(event)
    local event_data = {}

    event_data["inventory"] = data_fillers["inventory"](event["inventory"])
    event_data["mod"] = event["mod"]
    event_data["name"] = event["name"]
    event_data["new_size"] = event["new_size"]
    event_data["old_size"] = event["old_size"]
    event_data["overflow_inventory"] = data_fillers["inventory"](event["overflow_inventory"])
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_script_path_request_finished"] = function(event)
    local event_data = {}

    event_data["id"] = event["id"]
    event_data["name"] = event["name"]
    if event["path"] ~= nil then
    end
    event_data["tick"] = event["tick"]
    event_data["try_again_later"] = event["try_again_later"]

    return event_data
end

event_fillers["on_script_trigger_effect"] = function(event)
    local event_data = {}

    event_data["effect_id"] = event["effect_id"]
    event_data["name"] = event["name"]
    if event["source_entity"] ~= nil then
        event_data["source_entity"] = data_fillers["entity"](event["source_entity"])
    end
    if event["source_position"] ~= nil then
        event_data["source_position"] = event["source_position"]
    end
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    if event["target_entity"] ~= nil then
        event_data["target_entity"] = data_fillers["entity"](event["target_entity"])
    end
    if event["target_position"] ~= nil then
        event_data["target_position"] = event["target_position"]
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_sector_scanned"] = function(event)
    local event_data = {}

    event_data["area"] = event["area"]
    event_data["chunk_position"] = event["chunk_position"]
    event_data["name"] = event["name"]
    event_data["radar"] = data_fillers["entity"](event["radar"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_selected_entity_changed"] = function(event)
    local event_data = {}

    if event["last_entity"] ~= nil then
        event_data["last_entity"] = data_fillers["entity"](event["last_entity"])
    end
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_spider_command_completed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]
    event_data["vehicle"] = data_fillers["entity"](event["vehicle"])

    return event_data
end

event_fillers["on_string_translated"] = function(event)
    local event_data = {}

    event_data["localised_string"] = event["localised_string"]
    event_data["name"] = event["name"]
    event_data["player_index"] = event["player_index"]
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event_data["player"] = data_fillers["player"](player)
    end
    event_data["result"] = event["result"]
    event_data["tick"] = event["tick"]
    event_data["translated"] = event["translated"]

    return event_data
end

event_fillers["on_surface_cleared"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_surface_created"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_surface_deleted"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_surface_imported"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["original_name"] = event["original_name"]
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_surface_renamed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["new_name"] = event["new_name"]
    event_data["old_name"] = event["old_name"]
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_technology_effects_reset"] = function(event)
    local event_data = {}

    event_data["force"] = data_fillers["force"](event["force"])
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_tick"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_train_changed_state"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["old_state"] = event["old_state"]
    event_data["tick"] = event["tick"]
    event_data["train"] = data_fillers["train"](event["train"])

    return event_data
end

event_fillers["on_train_created"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    if event["old_train_id_1"] ~= nil then
        event_data["old_train_id_1"] = event["old_train_id_1"]
    end
    if event["old_train_id_2"] ~= nil then
        event_data["old_train_id_2"] = event["old_train_id_2"]
    end
    event_data["tick"] = event["tick"]
    event_data["train"] = data_fillers["train"](event["train"])

    return event_data
end

event_fillers["on_train_schedule_changed"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    if event["player_index"] ~= nil then
        event_data["player_index"] = event["player_index"]
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event_data["player"] = data_fillers["player"](player)
        end
    end
    event_data["tick"] = event["tick"]
    event_data["train"] = data_fillers["train"](event["train"])

    return event_data
end

event_fillers["on_trigger_created_entity"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    if event["source"] ~= nil then
        event_data["source"] = data_fillers["entity"](event["source"])
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_trigger_fired_artillery"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    if event["source"] ~= nil then
        event_data["source"] = data_fillers["entity"](event["source"])
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_unit_added_to_group"] = function(event)
    local event_data = {}

    event_data["group"] = data_fillers["unit_group"](event["group"])
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]
    event_data["unit"] = data_fillers["entity"](event["unit"])

    return event_data
end

event_fillers["on_unit_group_created"] = function(event)
    local event_data = {}

    event_data["group"] = data_fillers["unit_group"](event["group"])
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_unit_group_finished_gathering"] = function(event)
    local event_data = {}

    event_data["group"] = data_fillers["unit_group"](event["group"])
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["on_unit_removed_from_group"] = function(event)
    local event_data = {}

    event_data["group"] = data_fillers["unit_group"](event["group"])
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]
    event_data["unit"] = data_fillers["entity"](event["unit"])

    return event_data
end

event_fillers["on_worker_robot_expired"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["robot"] = data_fillers["entity"](event["robot"])
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["script_raised_built"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["script_raised_destroy"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["script_raised_revive"] = function(event)
    local event_data = {}

    event_data["entity"] = data_fillers["entity"](event["entity"])
    event_data["name"] = event["name"]
    if event["tags"] ~= nil then
        event_data["tags"] = event["tags"]
    end
    event_data["tick"] = event["tick"]

    return event_data
end

event_fillers["script_raised_set_tiles"] = function(event)
    local event_data = {}

    event_data["name"] = event["name"]
    event_data["surface_index"] = event["surface_index"]
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event_data["surface"] = data_fillers["surface"](surface)
    end
    event_data["tick"] = event["tick"]

    return event_data
end

return event_fillers
