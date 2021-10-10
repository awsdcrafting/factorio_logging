once = require("once")

local prefix = "[scis-logging]> "
local data = {}
local last_tick = 0

function init()
    script.on_event(defines.events, function(event)
        name = once.events[event.name]
        if name == nil then
            return
            -- unknown event
        end
        setting_name = "scis-logging-" .. name
        if not settings.global[setting_name].value then
            return
        end
        event.event_id = event.name
        event.event_name = name
        if settings.global["scis-logging-file"] == true then
            local file_name = settings.global["scis-logging-file-name"]
            if file_name == nil or file_name == "" then
                file_name = "scis_logging.log"
            end
            game.write_file(file_name, prefix ..  game.table_to_json(event).."\n", true, 0)
        end
        table.insert(data, event)
    end)
end

script.on_load(function() 
    init()
end)

script.on_init(function()
    game.write_file("scis_logging.log", "", false, 0)
    init()
end)

--every minute
script.on_nth_tick(60*60, function() 
    if last_tick + (60*60) <= game.tick then
        last_tick = game.tick
        data = {}
    end
end)

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
