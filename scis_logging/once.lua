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
        default_value = false
    }
)
table.insert(settings,
    {
        type= "string-setting",
        name="scis-logging-file-name",
        setting_type = "runtime-global",
        default_value = "scis_logging.log"
    }
)


for name, id in pairs(defines.events) do
    table.insert(event_ids, id)
    events[id] = name
    value = true
    if name == "on_tick" then value = false end
    setting_name = "scis-logging-" .. name
    table.insert(settings,
        {
            type = "bool-setting",
            name = setting_name,
            setting_type = "runtime-global",
            default_value = value
        }
    )
end



return {
    event_ids = event_ids,
    events = events,
    settings = settings
} 