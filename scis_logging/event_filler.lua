local data_fillers = require("data_filler")

local event_fillers = {}

event_fillers["CustomInputEvent"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_ai_command_completed"] = function(event)
    return event
end

event_fillers["on_area_cloned"] = function(event)
    if event["destination_force"] ~= nil then
        event["destination_force"] = data_fillers["force"](event["destination_force"])
    end
    event["destination_surface"] = data_fillers["surface"](event["destination_surface"])
    event["source_surface"] = data_fillers["surface"](event["source_surface"])
    return event
end

event_fillers["on_biter_base_built"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    return event
end

event_fillers["on_brush_cloned"] = function(event)
    if event["destination_force"] ~= nil then
        event["destination_force"] = data_fillers["force"](event["destination_force"])
    end
    event["destination_surface"] = data_fillers["surface"](event["destination_surface"])
    event["source_surface"] = data_fillers["surface"](event["source_surface"])
    return event
end

event_fillers["on_build_base_arrived"] = function(event)
    if event["group"] ~= nil then
        event["group"] = data_fillers["unit_group"](event["group"])
    end
    if event["unit"] ~= nil then
        event["unit"] = data_fillers["entity"](event["unit"])
    end
    return event
end

event_fillers["on_built_entity"] = function(event)
    event["created_entity"] = data_fillers["entity"](event["created_entity"])
    if event["item"] ~= nil then
        event["item"] = data_fillers["item_prototype"](event["item"])
    end
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    event["stack"] = data_fillers["item_stack"](event["stack"])
    return event
end

event_fillers["on_cancelled_deconstruction"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    return event
end

event_fillers["on_cancelled_upgrade"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    return event
end

event_fillers["on_character_corpse_expired"] = function(event)
    event["corpse"] = data_fillers["entity"](event["corpse"])
    return event
end

event_fillers["on_chart_tag_added"] = function(event)
    event["force"] = data_fillers["force"](event["force"])
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    event["tag"] = data_fillers["custom_chart_tag"](event["tag"])
    return event
end

event_fillers["on_chart_tag_modified"] = function(event)
    event["force"] = data_fillers["force"](event["force"])
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    event["tag"] = data_fillers["custom_chart_tag"](event["tag"])
    return event
end

event_fillers["on_chart_tag_removed"] = function(event)
    event["force"] = data_fillers["force"](event["force"])
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    event["tag"] = data_fillers["custom_chart_tag"](event["tag"])
    return event
end

event_fillers["on_chunk_charted"] = function(event)
    event["force"] = data_fillers["force"](event["force"])
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    return event
end

event_fillers["on_chunk_deleted"] = function(event)
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    return event
end

event_fillers["on_chunk_generated"] = function(event)
    event["surface"] = data_fillers["surface"](event["surface"])
    return event
end

event_fillers["on_combat_robot_expired"] = function(event)
    if event["owner"] ~= nil then
        event["owner"] = data_fillers["entity"](event["owner"])
    end
    event["robot"] = data_fillers["entity"](event["robot"])
    return event
end

event_fillers["on_console_chat"] = function(event)
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    return event
end

event_fillers["on_console_command"] = function(event)
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    return event
end

event_fillers["on_cutscene_cancelled"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_cutscene_waypoint_reached"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_difficulty_settings_changed"] = function(event)
    return event
end

event_fillers["on_entity_cloned"] = function(event)
    event["destination"] = data_fillers["entity"](event["destination"])
    event["source"] = data_fillers["entity"](event["source"])
    return event
end

event_fillers["on_entity_damaged"] = function(event)
    if event["cause"] ~= nil then
        event["cause"] = data_fillers["entity"](event["cause"])
    end
    event["damage_type"] = data_fillers["damage_prototype"](event["damage_type"])
    event["entity"] = data_fillers["entity"](event["entity"])
    if event["force"] ~= nil then
        event["force"] = data_fillers["force"](event["force"])
    end
    return event
end

event_fillers["on_entity_destroyed"] = function(event)
    return event
end

event_fillers["on_entity_died"] = function(event)
    if event["cause"] ~= nil then
        event["cause"] = data_fillers["entity"](event["cause"])
    end
    if event["damage_type"] ~= nil then
        event["damage_type"] = data_fillers["damage_prototype"](event["damage_type"])
    end
    event["entity"] = data_fillers["entity"](event["entity"])
    if event["force"] ~= nil then
        event["force"] = data_fillers["force"](event["force"])
    end
    event["loot"] = data_fillers["inventory"](event["loot"])
    return event
end

event_fillers["on_entity_logistic_slot_changed"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    return event
end

event_fillers["on_entity_renamed"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    return event
end

event_fillers["on_entity_settings_pasted"] = function(event)
    event["destination"] = data_fillers["entity"](event["destination"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    event["source"] = data_fillers["entity"](event["source"])
    return event
end

event_fillers["on_entity_spawned"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    event["spawner"] = data_fillers["entity"](event["spawner"])
    return event
end

event_fillers["on_equipment_inserted"] = function(event)
    event["equipment"] = data_fillers["equipment"](event["equipment"])
    event["grid"] = data_fillers["equipment_grid"](event["grid"])
    return event
end

event_fillers["on_equipment_removed"] = function(event)
    event["grid"] = data_fillers["equipment_grid"](event["grid"])
    return event
end

event_fillers["on_force_cease_fire_changed"] = function(event)
    event["force"] = data_fillers["force"](event["force"])
    event["other_force"] = data_fillers["force"](event["other_force"])
    return event
end

event_fillers["on_force_created"] = function(event)
    event["force"] = data_fillers["force"](event["force"])
    return event
end

event_fillers["on_force_friends_changed"] = function(event)
    event["force"] = data_fillers["force"](event["force"])
    event["other_force"] = data_fillers["force"](event["other_force"])
    return event
end

event_fillers["on_force_reset"] = function(event)
    event["force"] = data_fillers["force"](event["force"])
    return event
end

event_fillers["on_forces_merged"] = function(event)
    event["destination"] = data_fillers["force"](event["destination"])
    return event
end

event_fillers["on_forces_merging"] = function(event)
    event["destination"] = data_fillers["force"](event["destination"])
    event["source"] = data_fillers["force"](event["source"])
    return event
end

event_fillers["on_game_created_from_scenario"] = function(event)
    return event
end

event_fillers["on_gui_checked_state_changed"] = function(event)
    event["element"] = data_fillers["gui_element"](event["element"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_gui_click"] = function(event)
    event["element"] = data_fillers["gui_element"](event["element"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_gui_closed"] = function(event)
    if event["element"] ~= nil then
        event["element"] = data_fillers["gui_element"](event["element"])
    end
    if event["entity"] ~= nil then
        event["entity"] = data_fillers["entity"](event["entity"])
    end
    if event["equipment"] ~= nil then
        event["equipment"] = data_fillers["equipment"](event["equipment"])
    end
    if event["item"] ~= nil then
        event["item"] = data_fillers["item_stack"](event["item"])
    end
    if event["other_player"] ~= nil then
        event["other_player"] = data_fillers["player"](event["other_player"])
    end
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    if event["technology"] ~= nil then
        event["technology"] = data_fillers["technology"](event["technology"])
    end
    return event
end

event_fillers["on_gui_confirmed"] = function(event)
    event["element"] = data_fillers["gui_element"](event["element"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_gui_elem_changed"] = function(event)
    event["element"] = data_fillers["gui_element"](event["element"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_gui_location_changed"] = function(event)
    event["element"] = data_fillers["gui_element"](event["element"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_gui_opened"] = function(event)
    if event["element"] ~= nil then
        event["element"] = data_fillers["gui_element"](event["element"])
    end
    if event["entity"] ~= nil then
        event["entity"] = data_fillers["entity"](event["entity"])
    end
    if event["equipment"] ~= nil then
        event["equipment"] = data_fillers["equipment"](event["equipment"])
    end
    if event["item"] ~= nil then
        event["item"] = data_fillers["item_stack"](event["item"])
    end
    if event["other_player"] ~= nil then
        event["other_player"] = data_fillers["player"](event["other_player"])
    end
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_gui_selected_tab_changed"] = function(event)
    event["element"] = data_fillers["gui_element"](event["element"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_gui_selection_state_changed"] = function(event)
    event["element"] = data_fillers["gui_element"](event["element"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_gui_switch_state_changed"] = function(event)
    event["element"] = data_fillers["gui_element"](event["element"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_gui_text_changed"] = function(event)
    event["element"] = data_fillers["gui_element"](event["element"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_gui_value_changed"] = function(event)
    event["element"] = data_fillers["gui_element"](event["element"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_land_mine_armed"] = function(event)
    event["mine"] = data_fillers["entity"](event["mine"])
    return event
end

event_fillers["on_lua_shortcut"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_marked_for_deconstruction"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    return event
end

event_fillers["on_marked_for_upgrade"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    event["target"] = data_fillers["entity_prototype"](event["target"])
    return event
end

event_fillers["on_market_item_purchased"] = function(event)
    event["market"] = data_fillers["entity"](event["market"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_mod_item_opened"] = function(event)
    event["item"] = data_fillers["item_prototype"](event["item"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_permission_group_added"] = function(event)
    event["group"] = data_fillers["permission_group"](event["group"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_permission_group_deleted"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_permission_group_edited"] = function(event)
    event["group"] = data_fillers["permission_group"](event["group"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_permission_string_imported"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_picked_up_item"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_alt_selected_area"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    event["surface"] = data_fillers["surface"](event["surface"])
    return event
end

event_fillers["on_player_ammo_inventory_changed"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_armor_inventory_changed"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_banned"] = function(event)
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    return event
end

event_fillers["on_player_built_tile"] = function(event)
    if event["item"] ~= nil then
        event["item"] = data_fillers["item_prototype"](event["item"])
    end
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    if event["stack"] ~= nil then
        event["stack"] = data_fillers["item_stack"](event["stack"])
    end
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    event["tile"] = data_fillers["tile_prototype"](event["tile"])
    return event
end

event_fillers["on_player_cancelled_crafting"] = function(event)
    event["items"] = data_fillers["inventory"](event["items"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    event["recipe"] = data_fillers["recipe"](event["recipe"])
    return event
end

event_fillers["on_player_changed_force"] = function(event)
    event["force"] = data_fillers["force"](event["force"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_changed_position"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_changed_surface"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    return event
end

event_fillers["on_player_cheat_mode_disabled"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_cheat_mode_enabled"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_clicked_gps_tag"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_configured_blueprint"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_configured_spider_remote"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    event["vehicle"] = data_fillers["entity"](event["vehicle"])
    return event
end

event_fillers["on_player_crafted_item"] = function(event)
    event["item_stack"] = data_fillers["item_stack"](event["item_stack"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    event["recipe"] = data_fillers["recipe"](event["recipe"])
    return event
end

event_fillers["on_player_created"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_cursor_stack_changed"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_deconstructed_area"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    event["surface"] = data_fillers["surface"](event["surface"])
    return event
end

event_fillers["on_player_demoted"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_died"] = function(event)
    if event["cause"] ~= nil then
        event["cause"] = data_fillers["entity"](event["cause"])
    end
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_display_resolution_changed"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_display_scale_changed"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_driving_changed_state"] = function(event)
    if event["entity"] ~= nil then
        event["entity"] = data_fillers["entity"](event["entity"])
    end
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_dropped_item"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_fast_transferred"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_flushed_fluid"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_gun_inventory_changed"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_joined_game"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_kicked"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_left_game"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_main_inventory_changed"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_mined_entity"] = function(event)
    event["buffer"] = data_fillers["inventory"](event["buffer"])
    event["entity"] = data_fillers["entity"](event["entity"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_mined_item"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_mined_tile"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    return event
end

event_fillers["on_player_muted"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_pipette"] = function(event)
    event["item"] = data_fillers["item_prototype"](event["item"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_placed_equipment"] = function(event)
    event["equipment"] = data_fillers["equipment"](event["equipment"])
    event["grid"] = data_fillers["equipment_grid"](event["grid"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_promoted"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_removed"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_removed_equipment"] = function(event)
    event["grid"] = data_fillers["equipment_grid"](event["grid"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_repaired_entity"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_respawned"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    if event["player_port"] ~= nil then
        event["player_port"] = data_fillers["entity"](event["player_port"])
    end
    return event
end

event_fillers["on_player_rotated_entity"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_selected_area"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    event["surface"] = data_fillers["surface"](event["surface"])
    return event
end

event_fillers["on_player_set_quick_bar_slot"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_setup_blueprint"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    event["surface"] = data_fillers["surface"](event["surface"])
    return event
end

event_fillers["on_player_toggled_alt_mode"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_toggled_map_editor"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_trash_inventory_changed"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_unbanned"] = function(event)
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    return event
end

event_fillers["on_player_unmuted"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_used_capsule"] = function(event)
    event["item"] = data_fillers["item_prototype"](event["item"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_player_used_spider_remote"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    event["vehicle"] = data_fillers["entity"](event["vehicle"])
    return event
end

event_fillers["on_post_entity_died"] = function(event)
    if event["damage_type"] ~= nil then
        event["damage_type"] = data_fillers["damage_prototype"](event["damage_type"])
    end
    if event["force"] ~= nil then
        event["force"] = data_fillers["force"](event["force"])
    end
    if event["ghost"] ~= nil then
        event["ghost"] = data_fillers["entity"](event["ghost"])
    end
    event["prototype"] = data_fillers["entity_prototype"](event["prototype"])
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    return event
end

event_fillers["on_pre_build"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_pre_chunk_deleted"] = function(event)
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    return event
end

event_fillers["on_pre_entity_settings_pasted"] = function(event)
    event["destination"] = data_fillers["entity"](event["destination"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    event["source"] = data_fillers["entity"](event["source"])
    return event
end

event_fillers["on_pre_ghost_deconstructed"] = function(event)
    event["ghost"] = data_fillers["entity"](event["ghost"])
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    return event
end

event_fillers["on_pre_permission_group_deleted"] = function(event)
    event["group"] = data_fillers["permission_group"](event["group"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_pre_permission_string_imported"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_pre_player_crafted_item"] = function(event)
    event["items"] = data_fillers["inventory"](event["items"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    event["recipe"] = data_fillers["recipe"](event["recipe"])
    return event
end

event_fillers["on_pre_player_died"] = function(event)
    if event["cause"] ~= nil then
        event["cause"] = data_fillers["entity"](event["cause"])
    end
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_pre_player_left_game"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_pre_player_mined_item"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_pre_player_removed"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_pre_player_toggled_map_editor"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_pre_robot_exploded_cliff"] = function(event)
    event["cliff"] = data_fillers["entity"](event["cliff"])
    event["item"] = data_fillers["item_prototype"](event["item"])
    event["robot"] = data_fillers["entity"](event["robot"])
    return event
end

event_fillers["on_pre_script_inventory_resized"] = function(event)
    event["inventory"] = data_fillers["inventory"](event["inventory"])
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    return event
end

event_fillers["on_pre_surface_cleared"] = function(event)
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    return event
end

event_fillers["on_pre_surface_deleted"] = function(event)
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    return event
end

event_fillers["on_research_finished"] = function(event)
    event["research"] = data_fillers["technology"](event["research"])
    return event
end

event_fillers["on_research_reversed"] = function(event)
    event["research"] = data_fillers["technology"](event["research"])
    return event
end

event_fillers["on_research_started"] = function(event)
    if event["last_research"] ~= nil then
        event["last_research"] = data_fillers["technology"](event["last_research"])
    end
    event["research"] = data_fillers["technology"](event["research"])
    return event
end

event_fillers["on_resource_depleted"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    return event
end

event_fillers["on_robot_built_entity"] = function(event)
    event["created_entity"] = data_fillers["entity"](event["created_entity"])
    event["robot"] = data_fillers["entity"](event["robot"])
    event["stack"] = data_fillers["item_stack"](event["stack"])
    return event
end

event_fillers["on_robot_built_tile"] = function(event)
    event["item"] = data_fillers["item_prototype"](event["item"])
    event["robot"] = data_fillers["entity"](event["robot"])
    event["stack"] = data_fillers["item_stack"](event["stack"])
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    event["tile"] = data_fillers["tile_prototype"](event["tile"])
    return event
end

event_fillers["on_robot_exploded_cliff"] = function(event)
    event["item"] = data_fillers["item_prototype"](event["item"])
    event["robot"] = data_fillers["entity"](event["robot"])
    return event
end

event_fillers["on_robot_mined"] = function(event)
    event["robot"] = data_fillers["entity"](event["robot"])
    return event
end

event_fillers["on_robot_mined_entity"] = function(event)
    event["buffer"] = data_fillers["inventory"](event["buffer"])
    event["entity"] = data_fillers["entity"](event["entity"])
    event["robot"] = data_fillers["entity"](event["robot"])
    return event
end

event_fillers["on_robot_mined_tile"] = function(event)
    event["robot"] = data_fillers["entity"](event["robot"])
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    return event
end

event_fillers["on_robot_pre_mined"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    event["robot"] = data_fillers["entity"](event["robot"])
    return event
end

event_fillers["on_rocket_launch_ordered"] = function(event)
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    event["rocket"] = data_fillers["entity"](event["rocket"])
    event["rocket_silo"] = data_fillers["entity"](event["rocket_silo"])
    return event
end

event_fillers["on_rocket_launched"] = function(event)
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    event["rocket"] = data_fillers["entity"](event["rocket"])
    if event["rocket_silo"] ~= nil then
        event["rocket_silo"] = data_fillers["entity"](event["rocket_silo"])
    end
    return event
end

event_fillers["on_runtime_mod_setting_changed"] = function(event)
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    return event
end

event_fillers["on_script_inventory_resized"] = function(event)
    event["inventory"] = data_fillers["inventory"](event["inventory"])
    event["overflow_inventory"] = data_fillers["inventory"](event["overflow_inventory"])
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    return event
end

event_fillers["on_script_path_request_finished"] = function(event)
    return event
end

event_fillers["on_script_trigger_effect"] = function(event)
    if event["source_entity"] ~= nil then
        event["source_entity"] = data_fillers["entity"](event["source_entity"])
    end
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    if event["target_entity"] ~= nil then
        event["target_entity"] = data_fillers["entity"](event["target_entity"])
    end
    return event
end

event_fillers["on_sector_scanned"] = function(event)
    event["radar"] = data_fillers["entity"](event["radar"])
    return event
end

event_fillers["on_selected_entity_changed"] = function(event)
    if event["last_entity"] ~= nil then
        event["last_entity"] = data_fillers["entity"](event["last_entity"])
    end
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_spider_command_completed"] = function(event)
    event["vehicle"] = data_fillers["entity"](event["vehicle"])
    return event
end

event_fillers["on_string_translated"] = function(event)
    local player = game.get_player(event["player_index"])
    if player ~= nil then
        event["player"] = data_fillers["player"](player)
    end
    return event
end

event_fillers["on_surface_cleared"] = function(event)
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    return event
end

event_fillers["on_surface_created"] = function(event)
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    return event
end

event_fillers["on_surface_deleted"] = function(event)
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    return event
end

event_fillers["on_surface_imported"] = function(event)
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    return event
end

event_fillers["on_surface_renamed"] = function(event)
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    return event
end

event_fillers["on_technology_effects_reset"] = function(event)
    event["force"] = data_fillers["force"](event["force"])
    return event
end

event_fillers["on_tick"] = function(event)
    return event
end

event_fillers["on_train_changed_state"] = function(event)
    event["train"] = data_fillers["train"](event["train"])
    return event
end

event_fillers["on_train_created"] = function(event)
    event["train"] = data_fillers["train"](event["train"])
    return event
end

event_fillers["on_train_schedule_changed"] = function(event)
    if event["player_index"] ~= nil then
        local player = game.get_player(event["player_index"])
        if player ~= nil then
            event["player"] = data_fillers["player"](player)
        end
    end
    event["train"] = data_fillers["train"](event["train"])
    return event
end

event_fillers["on_trigger_created_entity"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    if event["source"] ~= nil then
        event["source"] = data_fillers["entity"](event["source"])
    end
    return event
end

event_fillers["on_trigger_fired_artillery"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    if event["source"] ~= nil then
        event["source"] = data_fillers["entity"](event["source"])
    end
    return event
end

event_fillers["on_unit_added_to_group"] = function(event)
    event["group"] = data_fillers["unit_group"](event["group"])
    event["unit"] = data_fillers["entity"](event["unit"])
    return event
end

event_fillers["on_unit_group_created"] = function(event)
    event["group"] = data_fillers["unit_group"](event["group"])
    return event
end

event_fillers["on_unit_group_finished_gathering"] = function(event)
    event["group"] = data_fillers["unit_group"](event["group"])
    return event
end

event_fillers["on_unit_removed_from_group"] = function(event)
    event["group"] = data_fillers["unit_group"](event["group"])
    event["unit"] = data_fillers["entity"](event["unit"])
    return event
end

event_fillers["on_worker_robot_expired"] = function(event)
    event["robot"] = data_fillers["entity"](event["robot"])
    return event
end

event_fillers["script_raised_built"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    return event
end

event_fillers["script_raised_destroy"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    return event
end

event_fillers["script_raised_revive"] = function(event)
    event["entity"] = data_fillers["entity"](event["entity"])
    return event
end

event_fillers["script_raised_set_tiles"] = function(event)
    local surface = game.get_surface(event["surface_index"])
    if surface ~= nil then
        event["surface"] = data_fillers["surface"](surface)
    end
    return event
end

return event_fillers
