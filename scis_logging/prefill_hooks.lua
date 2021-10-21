local prefill_hooks = {}

prefill_hooks["on_console_command"] = function(event)
    return not (settings.global["scis-logging-ignore-own-commands"] and tostring(event.command):find('^scis_logging.') ~= nil)
end

return prefill_hooks