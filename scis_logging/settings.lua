local once = require("once")

local settings = once.settings

table.insert(settings,
    {
        type = "bool-setting",
        name = "scis-logging-file",
        setting_type = "runtime-global",
        default_value = false,
        order = "01"
    }
)
table.insert(settings,
    {
        type = "string-setting",
        name = "scis-logging-file-name",
        setting_type = "runtime-global",
        default_value = "scis_logging.log",
        order = "11"
    }
)
table.insert(settings,
    {
        type = "bool-setting",
        name = "scis-logging-rcon-save",
        setting_type = "runtime-global",
        default_value = true,
        order = "21"
    }
)
table.insert(settings,
    {
        type = "int-setting",
        name = "scis-logging-rcon-save-timeout",
        setting_type = "runtime-global",
        default_value = 60,
        min = 1,
        order = "22"
    }
)
table.insert(settings,
    {
        type = "int-setting",
        name = "scis-logging-alarm-ticks",
        setting_type = "runtime-global",
        default_value = 60,
        min = 1,
        order = "41"
    }
)
table.insert(settings,
    {
        type = "bool-setting",
        name = "scis-logging-only-active-alarms",
        setting_type = "runtime-global",
        default_value = true,
        order = "42"
    }
)
table.insert(settings,
    {
        type = "int-setting",
        name = "scis-logging-electricity-ticks",
        setting_type = "runtime-global",
        default_value = 60,
        min = 1,
        order = "51"
    }
)
table.insert(settings,
    {
        type = "bool-setting",
        name = "scis-logging-ignore-own-commands",
        setting_type = "runtime-global",
        default_value = true,
        order = "52"
    }
)

data:extend(settings)
