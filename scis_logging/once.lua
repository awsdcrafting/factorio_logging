local event_ids = {

}

local events = {

}

local settings = {

}


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
            order="z"
        }
    )
end



return {
    event_ids = event_ids,
    events = events,
    settings = settings
} 