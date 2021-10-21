local function fill_player(event, data, player_index)
    local game_player = game.get_player(event[player_index])
    if game_player == nil then
        return
    end
    
    local player_data = {}
    player_data.id = game_player.index
    player_data.name = game_player.name
    player_data.position = game_player.position
    player_data.admin = game_player.admin
    player_data.color = game_player.color
    player_data.connected = game_player.connected
    player_data.online_time = game_player.online_time
    player_data.afk_time = game_player.afk_time
    player_data.last_online = game_player.last_online
    data.player = player
end

--todo
local function fill_surface(event, data, surface)
    local game_surface = event[surface]
    
    local surface_data = {}


    data[surface] = surface_data
end

--todo
local function fill_force(event, data, force)
    local game_force = event[force]

    local force_data = {}

    data[force] = force_data
end

--todo
local function fill_entity(event, data, entity)
    local game_entity = event[entity]

    local entity_data = {}

    data[entity] = entity_data
end

--todo
local function fill_unit_group(event, data, unit_group)
    local game_unit_group = event[unit_group]

    local unit_group_data = {}

    data[unit_group] = unit_group_data
end

--todo
local function fill_item_stack(event, data, item_stack)
    local game_item_stack = event[item_stack]

    local item_stack_data = {}

    data[item_stack] = item_stack_data
end


function fill_event(event)
    event_data = {}
    --quick fix, todo
    event_data.event = game.json_to_table(game.table_to_json(event))
    if event.player_index ~= nil then
        fill_player(event, event_data, "player_index")
    end

    if event["source_surface"] ~= nil then
        fill_surface(event, data, "source_surface")
    end
    if event["destination_surface"] ~= nil then
        fill_surface(event, data, "destination_surface")
    end

    if event["destination_force"] ~= nil then
        fill_force(event, data, "destination_force")
    end

    if event["entity"] ~= nil then
        fill_entity(event, data, "entity")
    end
    if event["unit"] ~= nil then
        fill_entity(event, data, "unit")
    end
    if event["created_entity"] ~= nil then
        fill_entity(event, data, "created_entity")
    end

    if event["group"] ~= nil then
        fill_unit_group(event, data, "group")
    end

    if event["stack"] ~= nil then
        fill_item_stack(event, data "stack")
    end

    if event[""]

    

    return event_data
end