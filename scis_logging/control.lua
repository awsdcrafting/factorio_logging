local once = require("once")
local pre_hooks = require("pre_hooks")
local prefill_hooks = require("prefill_hooks")
local post_hooks = require("post_hooks")
event_fillers = require("event_filler")

local scis_prefix = "[scis-logging]> "
scis_event_data = {}
scis_last_tick = 0

local function alarm_check(tick_data)
    for name, surface in pairs(game.surfaces) do
        local speakers = surface.find_entities_filtered{name = "programmable-speaker"}
        for speaker_id, speaker_entity in pairs(speakers) do
            local speaker = {}
            local speaker_data = {}
            speaker_data.params = speaker_entity.parameters
            speaker_data.alarm_params = speaker_entity.alert_parameters
            local control_behavior = speaker_entity.get_control_behavior()
            if control_behavior ~= nil and control_behavior.valid then
                if control_behavior.circuit_condition.condition.constant == nil then
                    control_behavior.circuit_condition.condition.constant = 0
                end
                speaker_data.condition = control_behavior.circuit_condition
            end
            speaker.name = "scis_speaker_readout"
            speaker.id = "scis_speaker_readout"
            speaker.event_data = speaker_data
            if (not settings.global["scis-logging-only-active-alarms"].value) or (speaker.event_data.condition ~= nil and speaker.condition.fullfilled) then
                table.insert(scis_event_data, game.table_to_json(speaker))
            end
        end
    end
end

local function electricity_check(tick_data)
--todo
end

local function init()
    script.on_event(defines.events, function(event)
        local name = once.events[event.name]
        if name == nil then
            return
        -- unknown event
        end
        if pre_hooks[name] ~= nil then
            local ret = pre_hooks[name](event)
            if not ret then
                return
            end
        end
        local setting_name = "scis-logging-" .. name
        if not settings.global[setting_name].value then
            return
        end
        
        local event_data = {}
        
        event_data.id = event.name
        event_data.name = name
        
        if prefill_hooks[name] ~= nil then
            local ret = prefill_hooks[name](event)
            if not ret then
                return
            end
        end
        
        if event_fillers[name] ~= nil then
            event_data.event_data = event_fillers[name](event)
        end
        
        
        if post_hooks[name] ~= nil then
            local ret = post_hooks[name](event_data)
            if not ret then
                return
            end
        end
        
        if settings.global["scis-logging-file"].value then
            local file_name = settings.global["scis-logging-file-name"].value
            if file_name == nil or file_name == "" then
                file_name = "scis_logging.log"
            end
            game.write_file(file_name, scis_prefix .. game.table_to_json(event_data) .. "\n", true, 0)
        end
        if settings.global["scis-logging-rcon"].value then
            rcon.print(scis_prefix .. game.table_to_json(event_data) .. "\n")
        end
        if settings.global["scis-logging-rcon-save"].value then
            table.insert(scis_event_data, game.table_to_json(event_data))
        end
    end)
    
    local timeout = settings.global["scis-logging-rcon-save-timeout"].value
    script.on_nth_tick(60 * timeout, function(tick_data)
        if scis_last_tick + (60 * timeout) <= game.tick then
            scis_last_tick = game.tick
            scis_event_data = {}
        end
    end)
    
    local alarm_ticks = settings.global["scis-logging-alarm-ticks"].value
    local electricity_ticks = settings.global["scis-logging-electricity-ticks"].value
    if alarm_ticks == electricity_ticks then
        script.on_nth_tick(alarm_ticks, function(tick_data)
            alarm_check(tick_data)
            electricity_check(tick_data)
        end)
    else
        script.on_nth_tick(alarm_ticks, alarm_check)
        script.on_nth_tick(electricity_ticks, electricity_check)
    end

end

script.on_load(function()
    init()
end)

script.on_init(function()
    game.write_file("scis_logging.log", "", false, 0)
    init()
end)

local function array_to_json(array)
    return "[" .. table.concat(array, ",") .. "]"
end

--every minute
commands.add_command('scis_logging.get', 'Returns events since last time', function(command)
        
        if not command.player_index then
            scis_last_tick = command.tick
            rcon.print(scis_prefix .. array_to_json(scis_event_data))
            scis_event_data = {}
        end
end)

commands.add_command('scis_logging.clear', 'Clears all saved events', function(command)
    if not command.player_index then
        rcon.print(scis_prefix .. "cleared " .. #scis_event_data .. " events")
        scis_event_data = {}
    end
end)

commands.add_command('scis_logging.players', 'Gets all players', function(command)
    if command.player_index then
        return
    end
    local detailed = command.parameter == "detailed"
    local players = {}
    players.event_name = "scis_player_readout"
    players.online = 0
    players.offline = 0
    local online_players = {}
    local offline_players = {}
    for id, game_player in pairs(game.players) do
        local player = {}
        player.id = game_player.index
        player.name = game_player.name
        if detailed then
            player.position = game_player.position
            player.admin = game_player.admin
            player.color = game_player.color
            player.connected = game_player.connected
            player.online_time = game_player.online_time
            player.afk_time = game_player.afk_time
            player.last_online = game_player.last_online
        end
        if player.connected then
            table.insert(online_players, player)
            players.online = players.online + 1
        else
            table.insert(offline_players, player)
            players.offline = players.offline + 1
        end
    end
    players.online_players = online_players
    players.offline_players = offline_players
    rcon.print(scis_prefix .. game.table_to_json(players))
end)
