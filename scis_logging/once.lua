local event_ids = {

}

local events = {

}

local settings = {

}

table.insert(settings,
    {
        type = "bool-setting",
        name ="scis-logging-file",
        setting_type = "runtime-global",
        default_value = false,
        order="0"
    }
)
table.insert(settings,
    {
        type= "string-setting",
        name="scis-logging-file-name",
        setting_type = "runtime-global",
        default_value = "scis_logging.log",
        order="1"
    }
)
table.insert(settings,
    {
        type= "bool-setting",
        name="scis-logging-rcon",
        setting_type = "runtime-global",
        default_value = false,
        order="2"
    }
)
table.insert(settings,
    {
        type= "bool-setting",
        name="scis-logging-rcon-save",
        setting_type = "runtime-global",
        default_value = true,
        order="3"
    }
)
table.insert(settings,
    {
        type= "int-setting",
        name="scis-logging-rcon-save-timeout",
        setting_type = "runtime-global",
        default_value = 60,
        order="4"
    }
)




for name, id in pairs(defines.events) do
    table.insert(event_ids, id)
    events[id] = name
    local value = true
    if name == "on_tick" then value = false end
    local setting_name = "scis-logging-" .. name
    table.insert(settings,
        {
            type = "bool-setting",
            name = setting_name,
            setting_type = "runtime-global",
            default_value = value,
            order="5"
        }
    )
end



return {
    event_ids = event_ids,
    events = events,
    settings = settings
} 