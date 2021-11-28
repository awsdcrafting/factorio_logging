local prefix = "[scis-logging]> "

local rcon_data = {}
local last_rcon_tick = 0
local rcon_timeout = 60
local log_file = false
local log_file_location = ""
local log_rcon = false


local function clear_data(force)
    if force == true then
        last_rcon_tick = game.tick
        rcon_data = {}
    else
        if last_rcon_tick + (60 * rcon_timeout) <= game.tick then
            last_rcon_tick = game.tick
            rcon_data = {}
        end
    end
end

local function init()
    print(prefix .. "log init")
    local global_settings = settings.global
    log_file = global_settings["scis-logging-file"].value
    local file_name = global_settings["scis-logging-file-name"].value
    if file_name == nil or file_name == "" then
        file_name = "scis_logging.log"
    end
    
    log_rcon = global_settings["scis-logging-rcon-save"].value
    rcon_timeout = global_settings["scis-logging-rcon-save-timeout"].value
end

local function log(data)
    if log_file == true then
        game.write_file(log_file_location, prefix .. data .. "\n", true, 0)
    end
    if log_rcon == true then
        table.insert(rcon_data, data)
    end
end

local function get_rcon_data()
    return rcon_data
end



return {
    clear_data = clear_data,
    log = log,
    get_rcon_data = get_rcon_data,
    init = init
}