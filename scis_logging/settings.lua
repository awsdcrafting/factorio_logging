local once = require("once")

local settings = once.settings

table.insert(settings,
    {
        type = "bool-setting",
        name = "scis-logging-file",
        setting_type = "runtime-global",
        default_value = false,
        order = "0"
    }
)
table.insert(settings,
    {
        type = "string-setting",
        name = "scis-logging-file-name",
        setting_type = "runtime-global",
        default_value = "scis_logging.log",
        order = "1"
    }
)
table.insert(settings,
    {
        type = "bool-setting",
        name = "scis-logging-rcon",
        setting_type = "runtime-global",
        default_value = false,
        order = "2"
    }
)
table.insert(settings,
    {
        type = "bool-setting",
        name = "scis-logging-rcon-save",
        setting_type = "runtime-global",
        default_value = true,
        order = "3"
    }
)
table.insert(settings,
    {
        type = "int-setting",
        name = "scis-logging-rcon-save-timeout",
        setting_type = "runtime-global",
        default_value = 60,
        min = 1,
        order = "4"
    }
)
table.insert(settings,
    {
        type = "int-setting",
        name = "scis-logging-alarm-ticks",
        setting_type = "runtime-global",
        default_value = 60,
        min = 1,
        order = "5"
    }
)
table.insert(settings,
    {
        type = "bool-setting",
        name = "scis-logging-only-active-alarms",
        setting_type = "runtime-global",
        default_value = true,
        order = "6"
    }
)
table.insert(settings,
    {
        type = "int-setting",
        name = "scis-logging-electricity-ticks",
        setting_type = "runtime-global",
        default_value = 60,
        min = 1,
        order = "7"
    }
)
table.insert(settings,
    {
        type = "bool-setting",
        name = "scis-logging-ignore-own-commands",
        setting_type = "runtime-global",
        default_value = true,
        order = "8"
    }
)

data:extend(settings)
