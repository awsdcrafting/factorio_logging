local data_fillers = {}

data_fillers["custom_chart_tag"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["damage_prototype"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["entity_prototype"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["equipment"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["equipment_grid"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["force"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["gui_element"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["inventory"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["item_prototype"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["item_stack"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["permission_group"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["recipe"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["surface"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["technology"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["tile_prototype"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["train"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["unit_group"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["entity"] = function(obj)
    local data = {}
    
    return data
end

data_fillers["player"] = function(obj)
    local data = {}
    data.id = obj.index
    data.name = obj.name
    data.position = obj.position
    data.admin = obj.admin
    data.color = obj.color
    data.connected = obj.connected
    data.online_time = obj.online_time
    data.afk_time = obj.afk_time
    data.last_online = obj.last_online
    return data
end

return data_fillers
