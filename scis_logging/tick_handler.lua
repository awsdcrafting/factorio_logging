local timed_functions = {}


local function add_function(tick, func)
    if timed_functions[tick] == nil then
        timed_functions[tick] = {}
    end
    table.insert(timed_functions[tick], func)
    script.on_nth_tick(tick, function(event_data)
        for index, func in pairs(timed_functions[tick]) do
            func(event_data)
        end
    end)
end

return {
    add_function = add_function,
}