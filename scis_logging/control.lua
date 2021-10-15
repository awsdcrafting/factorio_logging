local once = require("once")

local prefix = "[scis-logging]> "
local data = {}
local last_tick = 0

local function alarm_check()
    for name, surface in pairs(game.surfaces) do
        local speakers = surface.find_entities_filtered{name = "programmable-speaker" }
        for speaker_id, speaker_entity in pairs(speakers) do
            local speaker = {}
            speaker.params = speaker_entity.parameters
            speaker.alarm_params = speaker_entity.alert_parameters
            local control_behavior = speaker_entity.get_control_behavior()
            if control_behavior ~= nil and control_behavior.valid then 
                if control_behavior.circuit_condition.condition.constant == nil then
                    control_behavior.circuit_condition.condition.constant = 0
                end
                speaker.condition = control_behavior.circuit_condition
            end
            if not settings.global["scis-logging-only-active-alarms"].value or (speaker.condition ~= nil and speaker.condition.fullfilled) then
                table.insert(data, speaker)
            end
        end
    end
end

local function electricity_check()
--todo
end

local function init()
    script.on_event(defines.events, function(event)
        local name = once.events[event.name]
        if name == nil then
            return
        -- unknown event
        end
        local setting_name = "scis-logging-" .. name
        if not settings.global[setting_name].value then
            return
        end
        event.event_id = event.name
        event.event_name = name
        if settings.global["scis-logging-file"].value then
            local file_name = settings.global["scis-logging-file-name"].value
            if file_name == nil or file_name == "" then
                file_name = "scis_logging.log"
            end
            game.write_file(file_name, prefix .. game.table_to_json(event) .. "\n", true, 0)
        end
        if settings.global["scis-logging-rcon"].value then
            rcon.print(prefix .. game.table_to_json(event) .. "\n")
        end
        if settings.global["scis-logging-rcon-save"].value then
            table.insert(data, event)
        end
    end)
    
    local timeout = settings.global["scis-logging-rcon-save-timeout"].value
    script.on_nth_tick(60 * timeout, function()
        if last_tick + (60 * timeout) <= game.tick then
            last_tick = game.tick
            data = {}
        end
    end)
    
    local alarm_ticks = settings.global["scis-logging-alarm-ticks"].value
    local electricity_ticks = settings.global["scis-logging-electricity-ticks"].value
    if alarm_ticks == electricity_ticks then
        script.on_nth_tick(alarm_ticks, function()
            alarm_check()
            electricity_check()
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

--every minute
commands.add_command('scis_logging.get', 'Returns events since last time', function(command)
        
        if not command.player_index then
            last_tick = command.tick
            rcon.print(prefix .. game.table_to_json(data))
            data = {}
        end
end)

commands.add_command('scis_logging.clear', 'Clears all saved events', function(command)
    if not command.player_index then
        rcon.print(prefix .. "cleared " .. #data .. " events")
        data = {}
    end
end)
