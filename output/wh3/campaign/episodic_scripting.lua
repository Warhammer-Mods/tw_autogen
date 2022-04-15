
---@class episodic_scripting
local episodic_scripting = {}

--- Utilises the pathfinder to locate and return a valid spawn point for a character, based around a settlement. Returns -1, -1 if invalid.
---@param faction_key string Faction key, from the factions table.
---@param region_key string Region key of settlement, from the campaign_map_regions table.
---@param on_sea boolean Specifies whether the position should be on the sea.
---@param in_same_region boolean Specifies whether the spawn location should be in the same region as the specified settlement.
---@param preferred_spawn_distance number Specifies the distance at which the character should spawn.
function episodic_scripting:find_valid_spawn_location_for_character_from_settlement(faction_key, region_key, on_sea, in_same_region, preferred_spawn_distance) end

--- Stops the player from disbanding specific characters
---@param source_character CHARACTER_SCRIPT_INTERFACE source character
---@param stop_disbanding boolean Stop the desired character from disbanding.
function episodic_scripting:set_character_cannot_disband(source_character, stop_disbanding) end

--- Changes the name of a unit. The new name is specified directly as a string.
---@param unit UNIT_SCRIPT_INTERFACE Unit object - see the Model Hierarchy documentation for more information about this interface.
---@param name string New name for the unit.
function episodic_scripting:change_localised_unit_name(unit, name) end

--- Steals user input, so that input notifications are redirected to script. When keypresses are stolen by script the game calls a function called OnKeyPressed when a keypress occurs. This function can be declared in script to receive these notifications.
---@param steal_input boolean steal input
function episodic_scripting:steal_user_input(steal_input) end

--- Allows the AI to move a character again after it was previously blocked with cm:cai_disable_movement_for_character.
---@param character_lookup string Character lookup string - see Character Lookups for more information.
function episodic_scripting:cai_enable_movement_for_character(character_lookup) end

--- Re-enables movement for every character in the specified faction after it has been disabled with cm:disable_movement_for_character or cm:disable_movement_for_faction.
---@param faction_key string Faction key, from the factions table.
function episodic_scripting:enable_movement_for_faction(faction_key) end

--- Removes a time trigger by string id.
---@param id string id
function episodic_scripting:remove_time_trigger(id) end

--- Creates an army or a navy commanded by a specified existing character at the specified position, belonging to the specified faction, with the specified list of units.
---@param character_lookup string Character lookup string specifying the character to appoint as force commander. See Character Lookups for more information.
---@param faction_key string Faction key from the factions table.
---@param unit_list string Unit list. This should be a comma-separated list of unit keys from the main_units table.
---@param region_key string Region in which the force is created, from the campaign_map_regions table.
---@param x number Logical x co-ordinate.
---@param y number Logical y co-ordinate.
---@param id string ID of force. A ScriptedForceCreated event is triggered once the military force is created, and this ID is included in the context of the event so that listening scripts can differentiate between multiple created forces.
function episodic_scripting:create_force_with_existing_general(character_lookup, faction_key, unit_list, region_key, x, y, id) end

--- Spawns an agent of the specified type at the specified logical position.<br />
--- See the Model Hierarchy documentation for more information on the FACTION_SCRIPT_INTERFACE interface.
---@param faction FACTION_SCRIPT_INTERFACE Faction interface for the agent's faction.
---@param x number x logical co-ordinate.
---@param y number y logical co-ordinate.
---@param agent_type string Agent type key, from the agents table.
---@param agent_subtype string Agent subtype key, from the agent_subtypes table. This can be omitted.
function episodic_scripting:spawn_agent_at_position(faction, x, y, agent_type, agent_subtype) end

--- Exempt the province containing specified region from tax for all factions that own a settlement within it, and set the default for future factions.
---@param region_key string Region key, from the campaign_map_regions table.
---@param exempt boolean Exempt province from tax.
function episodic_scripting:exempt_province_from_tax_for_all_factions_and_set_default(region_key, exempt) end

--- Grant the specified ancillary to the specified character.
---@param target_character CHARACTER_SCRIPT_INTERFACE target_character
---@param ancillary_key string Ancillary key, from the ancillaries table.
---@param force_equip boolean if true the ancillary will be equipped and bypass any cooldowns or pre-conditions
---@param suppress_event_feed boolean if true no event feed events will be generated by this action
function episodic_scripting:force_add_ancillary(target_character, ancillary_key, force_equip, suppress_event_feed) end

--- Attempts to trigger a dilemma from database records with one or more target game objects. The game object or objects to associate the dilemma with are specified by command-queue index. The dilemma will need to pass any conditions set up in the cdir_events_dilemma_option_junctions table in order to trigger.<br />
--- A value of 0 may be supplied to omit a particular type of target.
---@param faction_cqi number Command-queue index of the faction to which the dilemma is issued. This must be supplied.
---@param dilemma_key string Dilemma key, from the dilemmas table.
---@param target_faction_cqi number Command-queue index of a target faction. 0 may be specified to omit this target (and other target arguments following this one).
---@param secondary_faction_cqi number Command-queue index of a second target faction. May be 0.
---@param character_cqi number Command-queue index of a target character. May be 0.
---@param military_force_cqi number Command-queue index of a target military force. May be 0.
---@param region_cqi number Command-queue index of a target region. May be 0.
---@param settlement_cqi number Command-queue index of a target settlement. May be 0.
function episodic_scripting:trigger_dilemma_with_targets(faction_cqi, dilemma_key, target_faction_cqi, secondary_faction_cqi, character_cqi, military_force_cqi, region_cqi, settlement_cqi) end

--- Apply an effect bundle to a campaign map region for a number of turns, or indefinitely.
---@param effect_bundle_key string Effect bundle key, from the effect_bundles table.
---@param region_key string Region key, from the campaign_map_regions table.
---@param turns number Number of turns to apply the effect bundle for. -1 may be supplied to apply the effect indefinitely.
function episodic_scripting:apply_effect_bundle_to_region(effect_bundle_key, region_key, turns) end

--- Removes a composite scene previously added by script, by the unique name given.
---@param name string name
function episodic_scripting:remove_scripted_composite_scene(name) end

--- Force one faction to vassalise another faction.
---@param vassalising_faction_key string Key of the faction which will become the master, from the factions table.
---@param vassal_faction_key string Key of the faction which will become the vassal, from the factions table.
function episodic_scripting:force_make_vassal(vassalising_faction_key, vassal_faction_key) end

--- Unlock a cooking recipe for a faction. The recipe must be permitted for the faction.
---@param faction FACTION_SCRIPT_INTERFACE Faction object - see the Model Hierarchy documentation for more information.
---@param recipe string Recipe key, from the cooking_recipes database table.
function episodic_scripting:unlock_cooking_recipe(faction, recipe) end

--- Attempt to cook a recipe for a faction with the specified ingredients. The ingredients lists should be specified as tables of strings.
---@param faction FACTION_SCRIPT_INTERFACE Faction object - see the Model Hierarchy documentation for more information.
---@param recipe string Recipe to cook. This should be a key from the cooking_recipes database table.
---@param primary_ingredients table Table containing a list of string values. Each should be a key from the cooking_ingredients database table.
---@param secondary_ingredients table Table containing a list of string values. Each should be a key from the cooking_ingredients database table.
function episodic_scripting:cook_recipe_with_ingredients(faction, recipe, primary_ingredients, secondary_ingredients) end

--- Force two factions to become defensive or military allies.
---@param first_faction_key string Faction key of the first faction, from the factions table.
---@param second_faction_key string Faction key of the second faction, from the factions table.
---@param is_military_alliance boolean Specifies whether the alliance should be a military alliance. If false is supplied then the alliance is defensive.
function episodic_scripting:force_alliance(first_faction_key, second_faction_key, is_military_alliance) end

--- Attempt to cook a recipe for a faction. The default ingredients will be used.
---@param faction FACTION_SCRIPT_INTERFACE Faction object - see the Model Hierarchy documentation for more information.
---@param recipe string Recipe to cook. This should be a key from the cooking_recipes database table.
function episodic_scripting:cook_recipe(faction, recipe) end

--- Rolls back a linked ritual chain to the specified stage. It is safe to call this function if the ritual chain isn't at this stage yet.
---@param ritual_chain_key string Ritual chain key, from the campaign_group_ritual_chains table.
---@param stage number Stage number.
function episodic_scripting:rollback_linked_ritual_chain(ritual_chain_key, stage) end

--- Add an interactable campaign marker of a specified type to the campaign map at a specified location. A radius around the marker is specified. As matching campaign characters enter or leave this radius then AreaEntered/AreaExited events will be triggered.<br />
--- Subculture and faction keys can be specified in order to filter what campaign characters should trigger the proximity events.<br />
--- Interactable campaign markers can be used for game features such as encounters at sea.
---@param unique_id string Unique id for this campaign marker, by which it may be later removed with cm:remove_interactable_campaign_marker.
---@param marker_info string Marker info key. This should match a record from the campaign_interactable_marker_infos table.
---@param x number Logical x position for the marker.
---@param y number Logical y position for the marker.
---@param radius number Radius around the position at which to trigger AreaEntered/AreaExited events.
---@param faction_key string Faction key filter. A blank string can be supplied to omit this.
---@param subculture_key string Subculture key filter. A blank string can be supplied to omit this.
function episodic_scripting:add_interactable_campaign_marker(unique_id, marker_info, x, y, radius, faction_key, subculture_key) end

--- Override the battle environment of upcoming battles. This needs to be cleared by calling it without any parameters.
---@param file_name string The file path of the battle environment file. E.g. "weather/battle/wh_day_clear_02.environment_group"
function episodic_scripting:set_battle_lighting_env_override(file_name) end

--- Constructs and displays an event message.
---@param faction_key string Key of the faction to whom the event is targeted, from the factions table.
---@param title_loc_key string Localisation key for the event title. This should be supplied in the full [table]_[field]_[key] localisation format, or can be a blank string.
---@param primary_loc_key string Localisation key for the primary detail of the event. This should be supplied in the full [table]_[field]_[key] localisation format, or can be a blank string.
---@param secondary_loc_key string Localisation key for the secondary detail of the event. This should be supplied in the full [table]_[field]_[key] localisation format, or can be a blank string.
---@param persistent boolean Sets this event to be persistent instead of transient. Persistent events are saved to the event history which is accessible to the player.
---@param index number Index indicating the type of event. This can be looked up by first finding a record in event_feed_message_events which relates to the event message being shown, then looking up the value in the campaign_groups field of this record in the campaign_group_member_criteria_values. This will provide one or more possible index values that may be used here.
function episodic_scripting:show_message_event(faction_key, title_loc_key, primary_loc_key, secondary_loc_key, persistent, index) end

--- Removes the specified tile upgrade from the currently active pending battle. The function will only work if called while the pending battle is being set up.
---@param tile_upgrade_key string tile upgrade key
function episodic_scripting:pending_battle_remove_scripted_tile_upgrade_tags(tile_upgrade_key) end

--- Locks recruitment of a starting general, preventing them from being created from the recruitment pool. This also works for characters that are convalescing. The character must be specified by startpos id.
---@param startpos_id string Startpos id of the target character. This is looked up from the ID field of the start_pos_characters table. This function cannot be used to lock recruitment of a character not present in the startpos data.
---@param faction_key string Faction key of the character, from the factions table.
function episodic_scripting:lock_starting_general_recruitment(startpos_id, faction_key) end

--- Forces a specified character to always or never perform an attack of opportunity, meaning they will always/never intercept when they get the chance. Once in place, this override can be removed with cm:remove_attack_of_opportunity_overrides.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param force_attack boolean Force an attack - if set to true the target character will always intercept, if set to false the character will always decline to intercept.
function episodic_scripting:add_attack_of_opportunity_overrides(character_lookup, force_attack) end

--- Prevents all factions hidden under the shroud from constructing or repairing buildings. Unlike other functions documented here this is a game-wide toggle and does not need to be set each turn. This should only be used in a singleplayer game.
---@param should_disable boolean should disable
function episodic_scripting:disable_shopping_for_ai_under_shroud(should_disable) end

--- Disables or re-enables the local player's ability to end the turn.
function episodic_scripting:disable_end_turn() end

--- Removes a vfx from a specified character.
---@param character_cqi number Command queue index of the character.
---@param vfx string VFX type. This must be an entry from the vfx_event field of the campaign_vfx_lookups table.
function episodic_scripting:remove_garrison_residence_vfx(character_cqi, vfx) end

--- Modifies the loyalty of a specified character.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param loyalty_modifier number Amount to modify the loyalty by. This may be positive or negative.
function episodic_scripting:modify_character_personal_loyalty_factor(character_lookup, loyalty_modifier) end

--- Prevents or allows the application of ancillaries by common.ancillary, which is intended to be the general-purpose ancillary-adding function. cm:force_add_ancillary will still work even with this restriction in place.
---@param disable boolean disable
function episodic_scripting:set_non_scripted_ancillaries_disabled(disable) end

--- Caches the state of the shroud across the map, so that it may later be recalled with cm:restore_shroud_from_snapshot.
function episodic_scripting:take_shroud_snapshot() end

--- Adds the specified foreign slot set to the target region, for the target faction. The foreign slot manager of the faction is returned, or a null script interface if parameters are invalid.
---@param faction_cqi number Command-queue index value of the target faction.
---@param region_cqi number Command-queue index value of the target region.
---@param slot_set_key string Slot set key, from the slot_sets table.
function episodic_scripting:add_foreign_slot_set_to_region_for_faction(faction_cqi, region_cqi, slot_set_key) end

--- Remove the specified ancilliary from the specified character.
---@param target_character CHARACTER_SCRIPT_INTERFACE target_character
---@param ancillary_key string Ancillary key, from the ancillaries table.
---@param remove_to_pool boolean Removes the ancillary from the character but leaves it in the pool of available ancillaries.
---@param suppress_event_feed boolean if true no event feed events will be generated by this action
function episodic_scripting:force_remove_ancillary(target_character, ancillary_key, remove_to_pool, suppress_event_feed) end

--- Perform a ritual with the provided setup, it must be available and valid for this call to succeed. Both modify and standard ritual setup interfaces are valid for this method
---@param setup MODIFY_RITUAL_SETUP_SCRIPT_INTERFACE|RITUAL_SETUP_SCRIPT_INTERFACE Ritual setup to use
function episodic_scripting:perform_ritual_with_setup(setup) end

--- Stops or allows user input.
---@param stop_input boolean stop input
function episodic_scripting:stop_user_input(stop_input) end

--- Updates the text shown for a particular objective of a specified scripted mission. This can be used to update a representation of mission progress on the panel.
---@param mission_key string Mission key, from the missions table.
---@param script_key string Key of the particular scripted objective associated with the mission.
---@param text_key string Localised text key, in the full [table]_[field]_[key] format.
function episodic_scripting:set_scripted_mission_text(mission_key, script_key, text_key) end

--- Swap a model for a certain character. This needs to be set up at a new session.
---@param character_lookup string Character lookup string - see Character Lookups for more information.
---@param model_key string model key
function episodic_scripting:add_unit_model_overrides(character_lookup, model_key) end

--- Makes all neighbouring regions visible in the shroud, for all factions. This effect will persist until the next round.
function episodic_scripting:make_neighbouring_regions_visible_in_shroud() end

--- Establishes a area trigger monitor around a specified display position, with a specified character lookup string filter. The shape of the trigger area is specified by a series of supplied points. This monitor will trigger an AreaEntered or AreaExited script event if a character that matches the specified filter moves through the specified circular area boundary.
---@param trigger_name string Trigger name. Multiple trigger areas with the same name behave as a single trigger.
---@param character_lookup string Character lookup string, specifying characters for which this trigger area will fire events. For more information, see Character Lookups.
---@param trigger_on_enter boolean Specifies whether an AreaEntered event is fired when a matching character enters the trigger area.
---@param trigger_on_exit boolean Specifies whether an AreaExited event is fired when a matching character exits the trigger area.
---@param trigger_once boolean Specifies whether the trigger continues monitoring after it fires its first event.
function episodic_scripting:add_outline_area_trigger(trigger_name, character_lookup, trigger_on_enter, trigger_on_exit, trigger_once) end

--- Adds a vfx of a specified type at a specified display position. VFX are distinct from markers in that they are generally 3D graphical effects.
---@param vfx_id string Unique id for this vfx, by which it may later be removed with cm:remove_vfx.
---@param vfx string VFX type. This must be an entry from the vfx_event field of the campaign_vfx_lookups table.
---@param x number x display position.
---@param y number y display position.
---@param height number height above water plane.
function episodic_scripting:add_vfx(vfx_id, vfx, x, y, height) end

--- Modify the number of faction slaves in the specified faction. The change can be positive or negative. This function will only have an affect if the target faction makes use of the slaves mechanic.
---@param faction_key string Faction key, from the factions table.
---@param change number Value to modify slaves by.
function episodic_scripting:modify_faction_slaves_in_a_faction(faction_key, change) end

--- Grant the specified trait to the specified character. If the character already has the trait, a trait point will be added.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param trait_key string Trait key, from the character_traits table.
---@param trait_points number Number of trait points to add.
function episodic_scripting:force_add_trait(character_lookup, trait_key, trait_points) end

--- Locks or unlocks the purchasable unit effect faction-wide, with an optional lock reason record. The purchasable effect is specified by string key. The faction is specified by FACTION_SCRIPT_INTERFACE - see the Model Hierarchy documentation for more information.
---@param faction FACTION_SCRIPT_INTERFACE Faction object.
---@param purchasable_effect string Unit purchasable effect. This should be a key from the unit_purchasable_effects database table.
---@param lock_reason string Lock reason. This should be a key from the unit_purchasable_effect_lock_reasons database table. A blank string may be supplied to not provide a lock reason.
---@param should_lock boolean Should lock - supply true to lock the effect, and false to unlock it.
function episodic_scripting:faction_set_unit_purchasable_effect_lock_state(faction, purchasable_effect, lock_reason, should_lock) end

--- Forces an incident to trigger. A payload string fragment specifying the incident consequences must be supplied.
---@param faction_key string Faction key, from the factions table.
---@param incident_key string Incident key, from the dilemmas table.
---@param fire_immediately boolean Set the incident to fire immediately.
---@param payload string Payload string. Check missions.txt for examples of how to structure a payload string.
function episodic_scripting:trigger_custom_incident(faction_key, incident_key, fire_immediately, payload) end

--- Returns true if this a new campaign game, or false otherwise. A new game is one that has yet to be saved and reloaded.
function episodic_scripting:is_new_game() end

--- Constructs and displays a event message with a zoom-to location.
---@param faction_key string Key of the faction to whom the event is targeted, from the factions table.
---@param title_loc_key string Localisation key for the event title. This should be supplied in the full [table]_[field]_[key] localisation format, or can be a blank string.
---@param primary_loc_key string Localisation key for the primary detail of the event. This should be supplied in the full [table]_[field]_[key] localisation format, or can be a blank string.
---@param secondary_loc_key string Localisation key for the secondary detail of the event. This should be supplied in the full [table]_[field]_[key] localisation format, or can be a blank string.
---@param x number Logical x co-ordinate of event target.
---@param y number Logical y co-ordinate of event target.
---@param persistent boolean Sets this event to be persistent instead of transient. Persistent events are saved to the event history which is accessible to the player.
---@param index number Index indicating the type of event. This can be looked up by first finding a record in event_feed_message_events which relates to the event message being shown, then looking up the value in the campaign_groups field of this record in the campaign_group_member_criteria_values. This will provide one or more possible index values that may be used here.
function episodic_scripting:show_message_event_located(faction_key, title_loc_key, primary_loc_key, secondary_loc_key, x, y, persistent, index) end

--- Removes the shroud from a specified land region for a specific faction. The region specified must be a land region.
---@param faction_key string Faction key, from the factions table.
---@param region_key string Region key, from the campaign_map_regions table.
function episodic_scripting:make_region_visible_in_shroud(faction_key, region_key) end

--- Add growth points to a region
---@param region_key string Region key, from the campaign_map_regions table.
---@param growth_points number Growth points to add.
function episodic_scripting:add_growth_points_to_region(region_key, growth_points) end

--- Enables or disables event feed events by category, subcategory or event. Any of these types can be empty. This differs from event feed suppression in that messages blocked by this function will be discarded, never to be shown. This function is of most use for temporarily or momentarily blocking certain event messages that the game produces naturally for some reason. This function should be used with care, as it can cause a softlock if a dilemma is triggered while disabled.<br />
--- For each specifier type (category/subcategory/event), multiple specifiers may be supplied in a single string, separated by semicolons. A category string of "wh_event_category_agent;wh_event_category_character" will block/unblock all event messages related to agents and characters, for example.<br />
--- Note that the event type lists are independent of one another, so if an event message is blocked by category, this restriction will not be lifted by unblocking by subcategory.
---@param should_disable boolean Disable the event messages specified by the supplied filters. Supply false here to re-enable previously disabled event messages.
---@param category string Event feed category to block, from the event_feed_categories table. Supply a blank string to not filter by category.
---@param subcategory string Event feed subcategory to block, from the event_feed_subcategories table. Supply a blank string to not filter by subcategory.
---@param event string Event feed event to block, from the event_feed_events table. Supply a blank string to not filter by event.
function episodic_scripting:disable_event_feed_events(should_disable, category, subcategory, event) end

--- Returns whether any event messages of the supplied type are currently being blocked/withheld by event feed suppression. If this function returns true for a specified event type, then the withheld event messages may be shown by calling cm:whitelist_event_feed_event_type to lift the suppression on that event type, or by calling cm:suppress_all_event_feed_event_types to lift all suppression.
---@param event_type string Event type, specified with a compound key from the event_feed_targeted_events table.
function episodic_scripting:event_feed_event_type_pending(event_type) end

--- Attempts to add a horde building to a military force. A slot must be available, or the force must contain a building that can be upgraded to the building specified. 
---@param force_cqi number Military force command-queue index value.
---@param building_key string Building key, from the building_levels table.
---@param operation_was_successful boolean operation was successful
function episodic_scripting:add_building_to_force(force_cqi, building_key, operation_was_successful) end

--- Sets one faction's stance towards another to the supplied strategic stance.
---@param faction_key string Faction key, from the factions table.
---@param target_faction_key string Target faction key, from the factions table.
---@param strategic_stance_key string Strategic stance key - see the list at the top of this section.
function episodic_scripting:cai_strategic_stance_manager_block_all_stances_but_that_specified_towards_target_faction(faction_key, target_faction_key, strategic_stance_key) end

--- Triggers a specific custom mission from its database record key. This mission must be defined in the missions.txt file that accompanies each campaign.
---@param faction_key string Faction key, from the factions table.
---@param mission_key string Mission key, from missions.txt file.
function episodic_scripting:trigger_custom_mission(faction_key, mission_key) end

--- Creates an army or a navy commanded by a specified existing character at the specified position, belonging to the specified faction, with the specified list of units.<br />
--- This command is distinct from cm:create_force in that it forces factions who can see the created force to be diplomatically aware of the force's faction.
---@param faction_key string Faction key from the factions table.
---@param unit_list string Unit list. This should be a comma-separated list of unit keys from the main_units table.
---@param region_key string Region in which the force is created, from the campaign_map_regions table.
---@param x number Logical x co-ordinate.
---@param y number Logical y co-ordinate.
---@param id string ID of force. A ScriptedForceCreated event is triggered once the military force is created, and this ID is included in the context of the event so that listening scripts can differentiate between multiple created forces.
---@param exclude_unique_characters boolean Prevent this force from having a unique character appointed as its general.
function episodic_scripting:create_force_with_full_diplomatic_discovery(faction_key, unit_list, region_key, x, y, id, exclude_unique_characters) end

--- Allows the AI to assigning the specified character to a position of command again after it was previously blocked with cm:cai_disable_command_assignment_for_character.
---@param character_lookup string Character lookup string - see Character Lookups for more information.
function episodic_scripting:cai_enable_command_assignment_for_character(character_lookup) end

--- Forces a stance update from one faction to another faction. The AI picks an appropriate new strategic stance.
---@param faction_key string Faction key, from the factions table.
---@param target_faction_key string Target faction key, from the factions table.
function episodic_scripting:cai_strategic_stance_manager_force_stance_update_between_factions(faction_key, target_faction_key) end

--- Instantly dismantle the building in the supplied region slot. The slot is specified by SLOT_SCRIPT_INTERFACE - see the Model Hierarchy documentation for more information.
function episodic_scripting:region_slot_instantly_dismantle_building() end

--- Changes the name of a region. The new name is specified directly as a string. Note that the region name is not currently used for display - see cm:change_localised_settlement_name instead.
---@param region REGION_SCRIPT_INTERFACE Region object - see the Model Hierarchy documentation for more information about this interface.
---@param name string New name for the region.
function episodic_scripting:change_localised_region_name(region, name) end

--- Create and add a specifiec unit to a military force commanded by a specified character. The unit will only be created if there is room for it in the force.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param unit_key string Key of unit to create, from the main_units table.
function episodic_scripting:grant_unit_to_character(character_lookup, unit_key) end

--- Restores the state of the shroud across the map after it has been cached with cm:take_shroud_snapshot.
function episodic_scripting:restore_shroud_from_snapshot() end

--- Instructs the campaign director to attempt to trigger a dilemma with a particular key, based on dilemma records from the database. The dilemma will be triggered if its conditions, defined in the cdir_events_dilemma_option_junctions, pass successfully. The function returns whether the dilemma was successfully triggered or not.
---@param faction_key string Faction key.
---@param dilemma_key string Dilemma key, from the dilemma table.
---@param fire_immediately boolean Set the incident to fire immediately.
function episodic_scripting:trigger_dilemma(faction_key, dilemma_key, fire_immediately) end

--- Converts a military force to a specific type. The military force is specified by MILITARY_FORCE_SCRIPT_INTERFACE - see the Model Hierarchy documentation for more information. The military force type is specified by string key, from the military_force_types database table.
---@param force MILITARY_FORCE_SCRIPT_INTERFACE Military force.
---@param type string Military force type, from the military_force_types table.
function episodic_scripting:convert_force_to_type(force, type) end

--- Sets a unit purchasable effect to be available or unavailable for a specified faction. Unit purchasable effects are upgrades for units, which is supported for some factions/races.
---@param faction_key string Key of the target faction, from the factions database table.
---@param purchasable_effect_key string Key of the purchasable effect, from the unit_purchasable_effects database table.
---@param available boolean Sets whether the purchasable effect should be available or not.
function episodic_scripting:faction_set_unit_purchasable_effect_availability(faction_key, purchasable_effect_key, available) end

--- Prevents all characters in the specified faction from moving, regardless of where the move order comes from, until movement is subsequently re-enabled with cm:enable_movement_for_faction or cm:enable_movement_for_character. Note that characters created in the faction after this restriction is applied will not have this restriction applied and will be able to move.<br />
--- This setting is saved into the campaign save file when the game is saved, and automatically re-established when the campaign is reloaded.
---@param faction_key string Faction key, from the factions table.
function episodic_scripting:disable_movement_for_faction(faction_key) end

--- Adds a restriction preventing a specified unit from being a recruitment option for a specified faction.<br />
--- This setting is saved into the campaign save file when the game is saved, and automatically re-established when the campaign is reloaded.
---@param unit_key string Unit key, from the main_units table.
---@param faction_key string Faction key, from the factions table.
---@param tooltip_key string Key of localised text in full [table]_[field]_[key] format to show as a tooltip on the restricted unit icon. This can be omitted.
function episodic_scripting:add_event_restricted_unit_record_for_faction(unit_key, faction_key, tooltip_key) end

--- Triggers a custom dilemma with two choices, with the specified faction as the dilemma target. 
---@param faction_key string Faction key, from the factions table.
---@param dilemma_key string Dilemma key, from the dilemmas table.
---@param first_choice_payload string Payload key for the first choice of the dilemma, from the cdir_events_dilemma_payloads table.
---@param second_choice_payload string Payload key for the second choice of the dilemma, from the cdir_events_dilemma_payloads table.
function episodic_scripting:trigger_custom_dilemma(faction_key, dilemma_key, first_choice_payload, second_choice_payload) end

--- Clears any existing scripted stance promotions between one faction and a target.
---@param faction_key string Faction key, from the factions table.
---@param target_faction_key string Target faction key, from the factions table.
function episodic_scripting:cai_strategic_stance_manager_clear_all_blocking_between_factions(faction_key, target_faction_key) end

--- Removes an interactable campaign marker that was previously added with cm:add_interactable_campaign_marker, by unique id.
---@param unique_id string unique id
function episodic_scripting:remove_interactable_campaign_marker(unique_id) end

--- Force the local player's faction to succeed at all agent actions.
---@param force_success boolean force success
function episodic_scripting:force_agent_action_success_for_human(force_success) end

--- Orders the specified character to attack a target character through an attack of opportunity - either an interception or an ambush. Note that this function requires character cqis to be passed in as arguments and not lookup strings.<br />
--- The two characters must be of different factions that are at war and neither may be garrisoned for the action to succeed.
---@param attacker_cqi number Command-queue index of the attacking character.
---@param target_cqi number Command-queue index of the target character.
---@param is_ambush boolean Set to true to ambush, or false to intercept.
function episodic_scripting:force_attack_of_opportunity(attacker_cqi, target_cqi, is_ambush) end

--- Removes any area triggers established with cm:add_circle_area_trigger or cm:add_outline_area_trigger with the supplied name.
---@param trigger_name string trigger name
function episodic_scripting:remove_area_trigger(trigger_name) end

--- Add growth points to a horde.
---@param military_force MILITARY_FORCE_SCRIPT_INTERFACE military force
---@param growth_points number Growth points to add.
function episodic_scripting:add_growth_points_to_horde(military_force, growth_points) end

--- Kills a specified character, and optionally also the entire military force they command.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param destroy_force boolean Destroy the character and the entire military force they command.
function episodic_scripting:kill_character(character_lookup, destroy_force) end

--- Attempts to add a building to a settlement. A slot must be available, or the settlement must contain a building that can be upgraded to the building specified. 
---@param region_key string Key of the region containing the target settlement, from the campaign_map_regions table.
---@param building_key string Building key, from the building_levels table.
---@param operation_was_successful boolean operation was successful
function episodic_scripting:add_building_to_settlement(region_key, building_key, operation_was_successful) end

--- Autosave the game at the next opportunity.
function episodic_scripting:autosave_at_next_opportunity() end

--- Kills a specified character and their associated unit, and optionally also the entire military force they command.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param destroy_force boolean Destroy the character and the entire military force they command.
function episodic_scripting:kill_character_and_commanded_unit(character_lookup, destroy_force) end

--- Remove all instances of the specified ancillary from every character, and the shared ancillary pool, of the specified faction.
---@param faction FACTION_SCRIPT_INTERFACE faction
---@param ancillary_key string Ancillary key, from the ancillaries table.
function episodic_scripting:force_remove_ancillary_from_faction(faction, ancillary_key) end

--- Unlock an ingredient for a faction. The ingredient must be permitted for the faction.
---@param faction FACTION_SCRIPT_INTERFACE Faction object - see the Model Hierarchy documentation for more information.
---@param ingredient string Ingredient key, from the cooking_ingredients database table.
function episodic_scripting:unlock_cooking_ingredient(faction, ingredient) end

--- Orders the specified character to move to a specified logical position. This is equivalent to the player or AI issuing the same order, and as such should only be done on that faction's turn.<br />
--- Note that if the character is in a settlement, or the intended destination is a settlement, an enemy army, or another kind of special obstacle then it's likely that a different type of order is required - see cm:join_garrison, cm:leave_garrison and cm:attack, for example.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param x number Logical x co-ordinate of target position.
---@param y number Logical y co-ordinate of target position.
function episodic_scripting:move_to(character_lookup, x, y) end

--- Plays a fullscreen movie, by path from the data/Movies directory.
---@param movie_path string movie path
function episodic_scripting:register_instant_movie(movie_path) end

--- Instantly dismantles the building in the specified foreign slot. The slot is specified by slot cqi, which can be obtained from the foreign slot script interface on the model hierarchy.
---@param foreign_slot_cqi number foreign slot cqi
function episodic_scripting:foreign_slot_instantly_dismantle_building(foreign_slot_cqi) end

--- Prevents or allows the application of traits by common.trait, which is intended to be the general-purpose trait-adding function. cm:force_add_trait will still work even with this restriction in place.
---@param disable boolean disable
function episodic_scripting:set_non_scripted_traits_disabled(disable) end

--- Creates a unique agent.
---@param faction_cqi number Faction cqi.
---@param agent_key string Agent record key, from the unique_agents table.
---@param force boolean Force agent to spawn even if invalid.
function episodic_scripting:spawn_unique_agent(faction_cqi, agent_key, force) end

--- Utilises the pathfinder to locate and return a valid spawn point for a character, based around a position. Returns -1, -1 if invalid.
---@param faction_key string Faction key, from the factions table.
---@param x number Logical x co-ordinate of position around which to search.
---@param y number Logical y co-ordinate of position around which to search.
---@param in_same_region boolean Specifies whether the spawn location should be in the same region as the specified position.
---@param preferred_distance number Preferred spawn distance, in logical hexes.
function episodic_scripting:find_valid_spawn_location_for_character_from_position(faction_key, x, y, in_same_region, preferred_distance) end

--- Ends the turn for the current faction, optionally forcing at the next opportunity. This optional flag should only be set for a player faction.
---@param force boolean force
function episodic_scripting:end_turn(force) end

--- Perform a VFS lookup in the specified path (root is the data folder) for files matching the pattern. Returns a comma-delimited list of files found.
---@param path string path
function episodic_scripting:filesystem_lookup(path) end

--- Removes all action points for characters from the specified target faction if they are hidden under the shroud of the specified player faction. This is a one-time action, and should be called each turn if it's desired that AI movement for a faction be stopped until 'discovered' by the player.
---@param player_faction_key string player faction key
---@param ai_faction_key string ai faction key
function episodic_scripting:disable_movement_for_ai_under_shroud(player_faction_key, ai_faction_key) end

--- Sets the tax rate for a specified faction. The tax rate may be one of the following integer values:<br />
--- ValueDescription<br />
--- 0minimal
--- 1low
--- 2normal
--- 3high
--- 4extortionate
---@param faction_key string Faction key, from the factions table.
---@param tax_rate number Tax rate, from the table above.
function episodic_scripting:set_tax_rate(faction_key, tax_rate) end

--- Modifies the per-turn modifier of a scripted food type for a specified faction. This is the amount of food of this type this faction will earn per-turn.<br />
--- The supplied value is added to the existing modifier value.
---@param faction_key string Faction key, from the factions table.
---@param food_factor_key string Food factor key, from the food_factors table.
---@param modifier number Modifier.
function episodic_scripting:faction_mod_food_factor_value(faction_key, food_factor_key, modifier) end

--- Unlock a ritual chain for a faction.
---@param faction FACTION_SCRIPT_INTERFACE Target Faction
---@param ritual_chain_key string Ritual Chain key, from the ritual_chains table.
---@param duration number Duration, number of rounds the ritual chain will be unlocked for. Zero or negative will be infinite.
function episodic_scripting:unlock_ritual_chain(faction, ritual_chain_key, duration) end

--- Establishes a area trigger monitor around a specified logical position, with a faction or subculture filter. This monitor will trigger an AreaEntered or AreaExited script event if a character that matches the filter moves through the area boundary.
---@param trigger_name string Unique name for this area trigger.
---@param x number Logical x co-ordinate for the hex area.
---@param y number Logical y co-ordinate for the hex area.
---@param radius number Radius in hexes (max of 20).
---@param faction_key string Key of faction to which the area trigger should apply, from the factions table. This may be a blank string if a subculture key is supplied.
---@param subculture_key string Key of subculture to which the area trigger should apply, from the   table. This may be a blank string if a subculture key is supplied.
function episodic_scripting:add_hex_area_trigger(trigger_name, x, y, radius, faction_key, subculture_key) end

--- Add the specified amount to the specified resource pool (type of resource), as the specified factor (type of change). The supplied value will be clamped to pool and factor bounds.
---@param faction_key string Faction key, from the factions table.
---@param resource_key string Pooled resource key, from the pooled_resources table.
---@param factor_key string Change factor key, from the pooled_resource_factors table.
---@param amount number Amount of resource to add. This value can be negative.
function episodic_scripting:faction_add_pooled_resource(faction_key, resource_key, factor_key, amount) end

--- Lock a ritual chain for a faction.
---@param faction FACTION_SCRIPT_INTERFACE Target Faction
---@param ritual_chain_key string Ritual chain key, from the ritual_chains table.
function episodic_scripting:lock_ritual_chain(faction, ritual_chain_key) end

--- Disables or re-enables public order in the province containing the specified region, for all factions that own settlements within the province, including factions that capture territory there in the future.
---@param region_key string Region key, from the campaign_map_regions table.
---@param disable boolean Disable public order.
function episodic_scripting:set_public_order_disabled_for_province_for_region_for_all_factions_and_set_default(region_key, disable) end

--- Disables or re-enables a shortcut by name. Shortcuts can be looked up in data/text/default_keys.xml.
---@param component_id string Component id, specified by the component attibute of a func element.
---@param function_id string Function id, specified by the name attribute of a func element.
---@param should_disable boolean Should disable.
function episodic_scripting:disable_shortcut(component_id, function_id, should_disable) end

--- Returns a handle to the campaign model object.
function episodic_scripting:model() end

--- Puts the supplied character into the supplied faction's prison. The faction and character are specified by model hierarchy objects - see the Model Hierarchy documentation for more information.
---@param imprisoning_faction FACTION_SCRIPT_INTERFACE imprisoning faction
---@param imprisoned_character CHARACTER_SCRIPT_INTERFACE imprisoned character
function episodic_scripting:faction_imprison_character(imprisoning_faction, imprisoned_character) end

--- Applies an effect bundle to a character. The character is specified by CHARACTER_SCRIPT_INTERFACE - see the Model Hierarchy documentation for more information.
---@param effect_bundle string Effect bundle key, from the effect_bundles table.
---@param character CHARACTER_SCRIPT_INTERFACE Target character.
---@param turns number Number of turns to apply the effect bundle for. -1 may be supplied to apply the effect indefinitely.
function episodic_scripting:apply_effect_bundle_to_character(effect_bundle, character, turns) end

--- Activates or deactivates the episodic scripting event feed suppression system. Once activated, event messages of all types will be withheld from triggering until they are either whitelisted with cm:whitelist_event_feed_event_type or until suppression is lifted again with a subsequent call to this function. Once one of these two actions occurs, any event messages previously blocked will be triggered.<br />
--- See also the equivalent UI-side suppression function CampaignUI.SuppressAllEventTypesInUI. This function should be used with care, as it can cause softlocks if dilemmas are suppressed. The UI-side functions are generally safer to use.<br />
--- Message suppression using this system should not be maintained over the end-turn sequence.
---@param activate_suppression boolean activate suppression
function episodic_scripting:suppress_all_event_feed_event_types(activate_suppression) end

--- Changes the name of a faction. The new name is specified directly as a string.
---@param settlement SETTLEMENT_SCRIPT_INTERFACE Settlement object - see the Model Hierarchy documentation for more information about this interface.
---@param name string New name for the faction.
function episodic_scripting:change_localised_settlement_name(settlement, name) end

--- Add a marker at a specified display position, using a specified marker type. These markers are distinct from VFX in that they are generally 2D, clickable UI elements at a position on the battlefield.
---@param marker_id string Unique id for this marker, by which it may be later removed.
---@param marker_type string Marker type. Supported marker types are move_to, select, pointer, move_to_vfx, select_vfx, look_at_vfx and objective.
---@param x number x display position.
---@param y number y display position.
---@param height number height above water plane.
function episodic_scripting:add_marker(marker_id, marker_type, x, y, height) end

--- Triggers an intrigue (the High Elf game mechanic) incident which improves or worsens diplomatic relations between two supplied factions.
---@param issuing_faction string Key of the faction issuing the intrigue, from the factions database table.
---@param faction_a_key string Key of the first target faction, from the factions database table.
---@param faction_b_key string Key of the second target faction, from the factions database table.
---@param improve boolean Specifies that the intrigue should improve rather than worsen diplomatic relations between the target factions.
---@param exempt_from_cost boolean Specifies that the intrigue should not cost influence points for issuing faction.
function episodic_scripting:trigger_intrigue(issuing_faction, faction_a_key, faction_b_key, improve, exempt_from_cost) end

--- Returns whether the supplied label string matches the text of a supplied uicomponent, taking localisation into account.
---@param uicomponent UIC uicomponent
---@param label_string string label string
function episodic_scripting:compare_localised_string(uicomponent, label_string) end

--- Re-enables movement for a specified character after it has been disabled with cm:disable_movement_for_character or cm:disable_movement_for_faction.
---@param character_lookup string Character lookup string - see Character Lookups for more information.
function episodic_scripting:enable_movement_for_character(character_lookup) end

--- Adds experience points to a specified character.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param points number Experience points to award.
function episodic_scripting:add_agent_experience(character_lookup, points) end

--- Adds a composite scene to a specified settlement.
---@param name string Unique name for this composite scene, by which it may later be removed with cm:remove_scripted_composite_scene.
---@param composite_scene string Composite scene key from the campaign_composite_scenes table.
---@param region REGION_SCRIPT_INTERFACE region of the settlement to add the scene to
---@param facing_x number Logical x co-ordinate of a position this composite scene faces.
---@param facing_y number Logical y co-ordinate of a position this composite scene faces.
---@param one_shot boolean One shot - if set to true, this composite scene is not added to the internal list of scenes and can't later be removed with cm:remove_scripted_composite_scene. However, the name of one-shot scenes does not have to be unique.
---@param show_in_seen_shroud boolean Sets whether this composite scene should be drawn when in thin shroud over previously-seen terrain.
---@param show_in_unseen_shroud boolean Sets whether this composite scene should be drawn when in thick shroud over unseen terrain.
---@param faction FACTION_SCRIPT_INTERFACE Faction this composite scene is visible to. Defaults to all factions if not set.
function episodic_scripting:add_scripted_composite_scene_to_settlement(name, composite_scene, region, facing_x, facing_y, one_shot, show_in_seen_shroud, show_in_unseen_shroud, faction) end

--- Dismisses the advisor panel.
function episodic_scripting:dismiss_advice() end

--- Appoints the specified character to the command of the most expensive military force in their faction.
---@param character_lookup string Character lookup string of subject character. For more information see the documentation on Character Lookups.
function episodic_scripting:appoint_character_to_most_expensive_force(character_lookup) end

--- Orders the specified character to immediately teleport to a specified logical position. This order should only be given on that faction's turn.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param x number Logical x co-ordinate of target position.
---@param y number Logical y co-ordinate of target position.
function episodic_scripting:teleport_to(character_lookup, x, y) end

--- Clears the active recipe for the specified faction.
---@param faction FACTION_SCRIPT_INTERFACE Faction object - see the Model Hierarchy documentation for more information.
function episodic_scripting:clear_active_cooking_recipe(faction) end

--- Spawns a rogue army of a specified rogue army faction, at a specified position. This command will fail if the rogue army is already alive or is flagged to naturally spawn.<br />
--- string faction key, Faction key, from the factions database table.
---@param x number Logical x co-ordinate.
---@param y number Logical y co-ordinate.
function episodic_scripting:spawn_rogue_army(x, y) end

--- Blocks a specific strategic stance from one faction to another faction until a specified round number.
---@param faction_key string Faction key, from the factions table.
---@param target_faction_key string Target faction key, from the factions table.
---@param strategic_stance_key string Strategic stance key - see the list at the top of this section.
---@param round_number number Final round number (inclusive) of blocking behaviour.
function episodic_scripting:cai_strategic_stance_manager_set_stance_blocking_between_factions_for_a_given_stance(faction_key, target_faction_key, strategic_stance_key, round_number) end

--- Sets whether the specified character is unique or not. This affects several aspects about how the game might treat that character such as when they might be available to recruit.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param is_unique boolean is unique
function episodic_scripting:set_character_unique(character_lookup, is_unique) end

--- Disables a pathfinding restriction layer. These are layers that can be built into the campaign map data that prevent the player from being able to move into an area on the map. By calling this function to lift a restriction, the player will be able to pathfind into the new area.<br />
--- Note that the enable_scripted_pathfinding_restrictions campaign variable must be set for restrictions to work - create an entry for this variable and the campaign in the campaigns_campaign_variables_junctions table.
---@param id number Pathfinding restriction layer id to un-restrict. Layers are numbered sequentially - lifting the restriction on one layer will also lift it on all layers with a lower numerical id.
function episodic_scripting:disable_pathfinding_restriction(id) end

--- Force a rebellion of a specified size in the specified region.
---@param region_key string Region key, from the campaign_map_regions table.
---@param units number Maximum number of units in the spawned rebellion.
---@param x number Logical x co-ordinate of target position.
---@param y number Logical y co-ordinate of target position.
---@param suppress_message boolean Suppress the event message related to the rebellion.
function episodic_scripting:force_rebellion_in_region(region_key, units, x, y, suppress_message) end

--- Prevents or allows ending turn.
---@param should_disable boolean should disable
function episodic_scripting:disable_ending_turn(should_disable) end

--- Instructs the campaign director to attempt to trigger a specified incident, based on record from the database. The incident will be triggered if its conditions, defined in the cdir_events_incident_option_junctions, pass successfully. The function returns whether the incident was successfully triggered or not.
---@param faction_key string Faction key, from the factions table.
---@param incident_key string Incident key, from the incidents table.
---@param fire_immediately boolean Set the incident to fire immediately.
function episodic_scripting:trigger_incident(faction_key, incident_key, fire_immediately) end

--- Enables or disables random event generation by the campaign director system.
---@param enable boolean enable
function episodic_scripting:set_event_generation_enabled(enable) end

--- Orders the specified character to move into a specified garrison residence. The garrison is specified by settlement key. This is equivalent to the player or AI issuing the same order, and as such should only be done on that faction's turn.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param settlement string Key of settlement containing the garrison residence, from the campaign_map_settlements table.
function episodic_scripting:join_garrison(character_lookup, settlement) end

--- Removes an effect bundle from a province. The province is specified by REGION_SCRIPT_INTERFACE - see the Model Hierarchy documentation for more information. The effect bundle will be removed from the portion of the province owned by the owner of the specified region - this can be the whole province if one faction controls it all.
---@param effect_bundle string Effect bundle key, from the effect_bundles table.
---@param region REGION_SCRIPT_INTERFACE Target region.
function episodic_scripting:remove_effect_bundle_from_faction_province(effect_bundle, region) end

--- Creates a new custom effect bundle, using the specified effect bundle record as a base. The custom effect bundle is returned as a CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE - see the Model Hierarchy documentation for more information.
---@param base_effect_bundle string Base effect bundle key, from the effect_bundles table.
function episodic_scripting:create_new_custom_effect_bundle(base_effect_bundle) end

--- Adds a restriction preventing a specified building from being a construction option for any faction.<br />
--- This setting is saved into the campaign save file when the game is saved, and automatically re-established when the campaign is reloaded.
---@param building_key string Building key, from the building_levels table.
---@param tooltip_key string Key of localised text in full [table]_[field]_[key] format to show as a tooltip on the restricted building icon. This can be omitted.
function episodic_scripting:add_event_restricted_building_record(building_key, tooltip_key) end

--- Removes a vfx previously added with cm:add_vfx, by vfx id.
---@param vfx_id string vfx id
function episodic_scripting:remove_vfx(vfx_id) end

--- Removes a previously-applied effect bundle from a faction.
---@param effect_bundle_key string Effect bundle key, from the effect_bundles table.
---@param faction_key string Faction key, from the factions table.
function episodic_scripting:remove_effect_bundle(effect_bundle_key, faction_key) end

--- Instantly upgrade the building in the supplied region slot to the supplied building. The slot is specified by SLOT_SCRIPT_INTERFACE - see the Model Hierarchy documentation for more information. The building specified must be a valid upgrade for the building chain present in the slot.
function episodic_scripting:region_slot_instantly_upgrade_building() end

--- Sets the shroud state of a specified land region to seen, for a specific faction. The region specified must be a land region.
---@param faction_key string Faction key, from the factions table.
---@param region_key string Region key, from the campaign_map_regions table.
function episodic_scripting:make_region_seen_in_shroud(faction_key, region_key) end

--- Disables or re-enables availability of a set of diplomacy types between factions described in the faction and target specifiers. Specifiers can be all, faction:&lt;faction_key&gt;, subculture:&lt;subculture_key&gt; or culture:&lt;culture_key&gt;.<br />
--- The diplomacy types to be allowed or disallowed are specified with a bitmask. Diplomacy types can be included in the bitmask by adding the number corresponding to the diplomacy type to the mask value. This mapping is shown here:<br />
--- Diplomacy TypeMask Value<br />
--- trade agreement2^0
--- hard military access2^1
--- cancel hard military access2^2
--- military alliance2^3
--- regions2^4
--- technology2^5
--- state gift2^6
--- payments2^7
--- vassal2^8
--- peace2^9
--- war2^10
--- join war2^11
--- break trade2^12
--- break alliance2^13
--- hostages2^14
--- marriage2^15
--- non aggression pact2^16
--- soft military access2^17
--- cancel soft military access2^18
--- defensive alliance2^19
--- client state2^20
--- form confederation2^21
--- break non aggression pact2^22
--- break soft military access2^23
--- break defensive alliance2^24
--- break vassal2^25
--- break client state2^26
--- state gift unilateral2^27
--- The function campaign_manager:force_diplomacy on the campaign_manager interface wraps this function, providing a more useable interface and debug output. It's recommended to call that function rather than directly calling this one.
---@param source_faction string Specifier that specifies one or more source factions.
---@param target_faction string Specifier that specifies one or more target factions.
---@param bitmask number Bitmask.
---@param can_offer boolean Sets whether the source faction(s) can to offer deals of this diplomacy type to the target faction(s).
---@param can_accept boolean Sets whether the target faction(s) can accept deals of this diplomacy type from the source faction(s).
function episodic_scripting:force_diplomacy_new(source_faction, target_faction, bitmask, can_offer, can_accept) end

--- Removes a custom battle override previously set with cm:add_custom_battlefield.<br />
--- Note that the campaign_manager intercepts calls which modify custom battlefield records, and will defer them if a battle is currently active and has been fought. This is to stop existing custom battlefield records, which are needed by the code to process the battle result, from being tampered with. See the Custom Battlefields section.
---@param id string id
function episodic_scripting:remove_custom_battlefield(id) end

--- Forces the balance of religions in a specified province to specified values. The key of a region within the target province must be specified, along with one or more argument pairs specifying a religion key and a proportion for that religion. The sum of all specified religion proportions must equal 1. At least one religion/religion proportion pair of arguments must therefore be specified. Religions not specified in the arguments of this function call will not be present in the target province.<br />
--- The religion system in Warhammer is repurposed to represent corruption. Use this function to override the setup of corruption within a province.<br />
--- Note that this function will only work if called on turn one.
---@param region_key string Key of a region within the target province, from the campaign_map_regions table.
---@param religion_key string Key of a religion, from the religions table.
---@param religion_proportion number Unary proportion (0-1) of the religion specified by the previous argument. The unary proportion of all specified religions should add up to 1.
---@vararg any
function episodic_scripting:force_religion_factors(region_key, religion_key, religion_proportion, extra_religions) end

--- Apply an effect bundle to a military force for a number of turns, or indefinitely.
---@param effect_bundle_key string Effect bundle key, from the effect_bundles table.
---@param force_cqi number Command-queue index of the military force.
---@param turns number Number of turns to apply the effect bundle for. -1 may be supplied to apply the effect indefinitely.
function episodic_scripting:apply_effect_bundle_to_force(effect_bundle_key, force_cqi, turns) end

--- Adds a vfx to a specified character.
---@param character_cqi number Command queue index of the character.
---@param vfx string VFX type. This must be an entry from the vfx_event field of the campaign_vfx_lookups table.
---@param show_in_shroud boolean Show this vfx even when the character is under the shroud.
function episodic_scripting:add_character_vfx(character_cqi, vfx, show_in_shroud) end

--- Adds experience points to a supplied unit's existing experience level.
---@param unit UNIT_SCRIPT_INTERFACE unit
---@param experience_level_to_add number experience level to add
function episodic_scripting:add_experience_to_unit(unit, experience_level_to_add) end

--- Instantly set the health of a building.
---@param region_key string Region key, from the campaign_map_regions table.
---@param building_key string Building level or chain key, from either the building_levels or building_chains tables.
---@param health_percent number New health value of building, expressed as a number from 0 to 100.
function episodic_scripting:instant_set_building_health_percent(region_key, building_key, health_percent) end

--- Adds one or more of a specified unit to the specified province mercenary pool. The province is specified by a region within it. Unlike with cm:add_unit_to_province_mercenary_pool, the unit type must already be represented in the pool.
---@param region_key string Region key of a region within the target province, from the campaign_map_regions table.
---@param unit_key string Unit key, from the main_units table.
---@param count number Number of units to add.
function episodic_scripting:add_units_to_province_mercenary_pool_by_region(region_key, unit_key, count) end

--- Perform a ritual for a faction. The ritual must be available and valid for the action to succeed.
---@param performing_faction_key string Faction key of the faction performing the ritual, from the factions table.
---@param target_faction_key string Faction key of the target faction of the ritual, from the factions table. An empty string may be supplied, in which case the performing faction is the target.
---@param ritual_key string Ritual key, from the rituals table.
function episodic_scripting:perform_ritual(performing_faction_key, target_faction_key, ritual_key) end

--- Applies a custom effect bundle to a military force. This replaces any existing effect bundle with the same record.<br />
--- For more information about the CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE or MILITARY_FORCE_SCRIPT_INTERFACE interfaces see the Model Hierarchy documentation.
---@param custom_effect_bundle CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE custom effect bundle
---@param military_force MILITARY_FORCE_SCRIPT_INTERFACE military force
function episodic_scripting:apply_custom_effect_bundle_to_force(custom_effect_bundle, military_force) end

--- Spawn a plague in a region.
---@param region REGION_SCRIPT_INTERFACE Target region.
---@param plague_key string Plague key, from the plagues table.
function episodic_scripting:spawn_plague_at_region(region, plague_key) end

--- Prevents the specified character from moving, regardless of where the move order comes from, until movement is subsequently re-enabled with cm:enable_movement_for_faction or cm:enable_movement_for_character.<br />
--- This setting is saved into the campaign save file when the game is saved, and automatically re-established when the campaign is reloaded.
---@param character_lookup string Character lookup string - see Character Lookups for more information.
function episodic_scripting:disable_movement_for_character(character_lookup) end

--- Removes a marker previously added using cm:add_marker, by marker id.
---@param marker_id string marker id
function episodic_scripting:remove_marker(marker_id) end

--- Makes all neighbouring regions seen in the shroud, for all factions. This effect will persist until the next round.
function episodic_scripting:make_neighbouring_regions_seen_in_shroud() end

--- Increases the experience of all units commanded by a specified character, by a specified level.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param level number Level to increase experience of units by.
function episodic_scripting:add_experience_to_units_commanded_by_character(character_lookup, level) end

--- Instructs the campaign director to attempt to trigger a mission of a particular type, based on a mission record from the database. The mission will be triggered if its conditions, defined in the cdir_events_mission_option_junctions, pass successfully. The function returns whether the mission was successfully triggered or not. Note that if the command is sent via the command queue then true will always be returned, regardless of whether the mission successfully triggers.
---@param faction_key string Faction key, from the factions table.
---@param mission_key string Mission key, from the missions table.
---@param fire_immediately boolean Set the mission to fire immediately, instead of waiting for the start of the faction's turn. This also overrides any delay set in the mission data.
function episodic_scripting:trigger_mission(faction_key, mission_key, fire_immediately) end

--- Set whether or not advice should be dismissed on ending turn.
---@param should_dismiss boolean should dismiss
function episodic_scripting:dismiss_advice_at_end_turn(should_dismiss) end

--- Sets whether the campaign director system can generate missions or not.
---@param can_generate boolean can generate
function episodic_scripting:toggle_mission_generation(can_generate) end

--- Sets whether the specified character can die or not.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param is_immortal boolean is immortal
function episodic_scripting:set_character_immortality(character_lookup, is_immortal) end

--- Creates a storm of a given type in a given region.
---@param region_key string Region key, from the campaign_map_regions table.
---@param storm_strength number Storm strength. The strength of existing storm instances can be looked up in the campaign_storms table.
---@param duration number Duration of the storm in turns.
---@param storm_type string Storm type, looked up from the campaign_storm_types table. By default, this is set to "land_storm" for a land region and "wandering_decaying_sea_storm" for a sea region.
function episodic_scripting:create_storm_for_region(region_key, storm_strength, duration, storm_type) end

--- Reads a value from a loading game. Should only be called when the LoadingGame event is received, and must be passed the context object supplied by that event.<br />
--- It's recommended to use the loading functions provided by the campaign manager, listed in the Loading Game section of this documentation, instead of directly calling this function.
---@param value_name string Value name.
---@param default_value string|number|boolean This defines the type of the value to load from the savegame and also a default value which will be returned if no value with the specified name could be found in the savegame. Can be a boolean, number or string.
---@param context_object context context object
function episodic_scripting:load_named_value(value_name, default_value, context_object) end

--- Marks a particular objective associated with a specified scripted mission as either succeeded or failed. Once all objectives for a scripted mission are completed, the mission itself is completed.
---@param faction_name string Name of the faction completing the mission, from the factions database table.
---@param mission_key string Mission key, from the missions table.
---@param script_key string Key of the particular scripted objective associated with the mission.
---@param is_success boolean Objective was completed successfully.
function episodic_scripting:complete_scripted_mission_objective(faction_name, mission_key, script_key, is_success) end

--- Updates the map position related to a particular objective of a specified scripted mission. This can be used to update a mission's zoom-to target.
---@param mission_key string Mission key, from the missions table.
---@param script_key string Key of the particular scripted objective associated with the mission.
---@param x number Logical x co-ordinate of the updated position.
---@param y number Logical y co-ordinate of the updated position.
function episodic_scripting:set_scripted_mission_position(mission_key, script_key, x, y) end

--- Adds development points to the province containing the specified region.
---@param region_key string Region key, from the campaign_map_regions table.
---@param development_points number Developments points to add.
function episodic_scripting:add_development_points_to_region(region_key, development_points) end

--- Activates or deactivates a ui override.
---@param ui_override_name string ui override name
---@param activate_override boolean activate override
function episodic_scripting:override_ui(ui_override_name, activate_override) end

--- Adds one or more of a specified unit to the specified faction's mercenary pool. Unlike with cm:add_units_to_faction_mercenary_pool, the unit type must already be represented in the pool.
---@param faction_cqi number CQI of the subject faction.
---@param unit_key string Unit key, from the main_units table.
---@param count number Number of units to add.
function episodic_scripting:add_units_to_faction_mercenary_pool(faction_cqi, unit_key, count) end

--- Applies a custom effect bundle to a region. This replaces any existing effect bundle with the same record.<br />
--- For more information about the CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE or REGION_SCRIPT_INTERFACE interfaces see the Model Hierarchy documentation.
---@param custom_effect_bundle CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE custom effect bundle
---@param region REGION_SCRIPT_INTERFACE region
function episodic_scripting:apply_custom_effect_bundle_to_region(custom_effect_bundle, region) end

--- Removes a vfx from a specified character.
---@param character_cqi number Command queue index of the character.
---@param vfx string VFX type. This must be an entry from the vfx_event field of the campaign_vfx_lookups table.
function episodic_scripting:remove_character_vfx(character_cqi, vfx) end

--- Instantly sets the primary slot level of the supplied settlement. The settlement is specified by SETTLEMENT_SCRIPT_INTERFACE - see the Model Hierarchy documentation for more information. The supplied level Will be clamped to the maximum level of the chain.<br />
--- The new primary slot building will be returned, as a BUILDING_SCRIPT_INTERFACE object.
function episodic_scripting:instantly_set_settlement_primary_slot_level() end

--- Plays a fullscreen movie for an outro, by path from the data/Movies directory. The campaign will exit once playback has completed.
---@param movie_path string movie path
function episodic_scripting:register_outro_movie(movie_path) end

--- Grants the specified ancillary to the specified faction. The ancillary goes into that faction's ancillary pool, from where it may be equipped by a character.
---@param target_faction FACTION_SCRIPT_INTERFACE target faction
---@param ancillary_key string Ancillary key, from the ancillaries table.
---@param suppress_event_feed boolean if true no event feed events will be generated by this action
function episodic_scripting:add_ancillary_to_faction(target_faction, ancillary_key, suppress_event_feed) end

--- Triggers campaign voiceover audio at a character's 3D position. The character specified also partially specifies the path by which the voiceover sound is looked up.
---@param sound_event string Sound event name.
---@param character_lookup string Character lookup string - see Character Lookups for more information.
---@param delay number Delay in seconds before triggering the vo.
function episodic_scripting:trigger_campaign_vo(sound_event, character_lookup, delay) end

--- Instantly repair the building in the specified slot. Slots are specified by SLOT_SCRIPT_INTERFACE, see the Model Hierarchy documentation for more information.
---@param slot SLOT_SCRIPT_INTERFACE slot
function episodic_scripting:region_slot_instantly_repair_building(slot) end

--- Forces or un-forces any characters visible to humans to move at normal speed during the end-turn sequence. Overrides set using this function are saved into the savegame.
---@param use_human_speed_ boolean use human speed 
function episodic_scripting:set_ai_uses_human_display_speed(use_human_speed_) end

--- Adds the specified tile upgrade to the currently active pending battle. This should match the key of a tile upgrade set within the map data of the tile the battle will be fought on, so its use is highly situational.<br />
--- The function will only work if called while the pending battle is being set up.
---@param tile_upgrade_key string tile upgrade key
function episodic_scripting:pending_battle_add_scripted_tile_upgrade_tag(tile_upgrade_key) end

--- Disables or re-enables units gaining experience across the whole campaign. This restriction is saved into the savegame, so only needs to be set once.
---@param disable boolean Disable experience. Set to false to re-enable.
function episodic_scripting:set_unit_experience_disabled(disable) end

--- Changes the name of a faction. The new name is specified directly as a string.
---@param faction_key string Faction key, from the factions table.
---@param name string New name for the faction.
function episodic_scripting:change_custom_faction_name(faction_key, name) end

--- Sets the per-turn modifier of a scripted food type for a specified faction. This is the amount of food of this type this faction will earn per-turn.
---@param faction_key string Faction key, from the factions table.
---@param food_factor_key string Food factor key, from the food_factors table.
---@param modifier number Modifier.
function episodic_scripting:faction_set_food_factor_value(faction_key, food_factor_key, modifier) end

--- Removes all action points from a specified character.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
function episodic_scripting:zero_action_points(character_lookup) end

--- Allows the AI to move characters in a faction again after it was previously blocked with cm:cai_disable_movement_for_faction.
---@param faction_key string Faction key, from the factions table.
function episodic_scripting:cai_enable_movement_for_faction(faction_key) end

--- Register a time trigger, in seconds. This will cause a TimeTrigger event to trigger after the specified interval.
---@param id string ID for this time trigger. This will be supplied with the TimeTrigger event when it is triggered.
---@param interval number Interval after which to trigger the TimeTrigger event, in seconds.
---@param repeat boolean Repeats the time trigger if set to true.
function episodic_scripting:add_time_trigger(id, interval, repeat) end

--- Prevents the AI from assigning the specified character to a position of command.
---@param character_lookup string Character lookup string - see Character Lookups for more information.
function episodic_scripting:cai_disable_command_assignment_for_character(character_lookup) end

--- Forces a proposing faction to subsume a target faction into its confederation.
---@param proposing_faction_key string Faction key of the proposing faction, from the factions table.
---@param target_faction_key string Faction key of the target faction, from the factions table. This faction will be subsumed into the confederation.
function episodic_scripting:force_confederation(proposing_faction_key, target_faction_key) end

--- Makes diplomacy available between two factions, as if they had discovered each other on the campaign map.
---@param first_faction_key string Faction key of the first faction, from the factions table.
---@param second_faction_key string Faction key of the second faction, from the factions table.
function episodic_scripting:make_diplomacy_available(first_faction_key, second_faction_key) end

--- Prevents the AI from being able to move any characters in a faction. Other sources of character movement (e.g. the script or the player) will work as normal.
---@param faction_key string Faction key, from the factions table.
function episodic_scripting:cai_disable_movement_for_faction(faction_key) end

--- Removes a restriction previously added with cm:add_event_restricted_unit_record.
---@param unit_key string Unit key, from the main_units table.
function episodic_scripting:remove_event_restricted_unit_record(unit_key) end

--- Changes the name of a region. The new name is specified by full localised text key, in the [table]_[key]_[field] format. Note that the region name is not currently used for display - see cm:change_custom_settlement_name instead.
---@param region REGION_SCRIPT_INTERFACE Region object - see the Model Hierarchy documentation for more information about this interface.
---@param name_key string Localised name key, in the [table]_[key]_[field] format.
function episodic_scripting:change_custom_region_name(region, name_key) end

--- Creates a unique agent in a specified region.
---@param faction_cqi number Faction cqi.
---@param agent_key string Agent record key, from the unique_agents table.
---@param region_cqi number The cqi of the target region.
---@param force boolean Force agent to spawn even if invalid.
function episodic_scripting:spawn_unique_agent_at_region(faction_cqi, agent_key, region_cqi, force) end

--- Instantly returns a convalescing (wounded) character to the available pool of recruitable characters for their faction.
---@param character_cqi number character cqi
function episodic_scripting:stop_character_convalescing(character_cqi) end

--- Sets up a process which promotes a particular strategic stance from one faction to a target faction over a number of turns.
---@param faction_key string Faction key, from the factions table.
---@param target_faction_key string Target faction key, from the factions table.
---@param strategic_stance_key string Strategic stance key - see the list at the top of this section.
---@param start_round number Starting round number.
---@param start_level number Starting stance level. This is a numerical indicator of how likely this stance is to be chosen.
---@param end_round number End round number.
---@param end_level number End stance level. This is a numerical indicator of how likely this stance is to be chosen.
function episodic_scripting:cai_strategic_stance_manager_set_stance_promotion_between_factions_for_a_given_stance(faction_key, target_faction_key, strategic_stance_key, start_round, start_level, end_round, end_level) end

--- Within the ai personality assignment system it is possible to set up weightings between rounds and personalities, allowing for certain personalities to be more or less likely to be chosen depending on the turn number (so the AI changes behaviour over time). This command forces the specified faction to pick a new AI personality from their available pool, based on the supplied round number rather than the actual round number. "All" may be supplied in place of a faction key to force all factions to change personalities in this way.
---@param faction_key string Faction key, from the factions table, or "all".
---@param round_number number Override for turn/round number.
function episodic_scripting:cai_force_personality_change_with_override_round_number(faction_key, round_number) end

--- Instantly embed the specified agent in the specified force. The agent will teleport into the force, disregarding normal restrictions other than that force being under siege. See the Model Hierarchy documentation for more information on the CHARACTER_SCRIPT_INTERFACE or MILITARY_FORCE_SCRIPT_INTERFACE interfaces.
---@param agent CHARACTER_SCRIPT_INTERFACE agent
---@param military_force MILITARY_FORCE_SCRIPT_INTERFACE military force
function episodic_scripting:embed_agent_in_force(agent, military_force) end

--- Disables or re-enables characters gaining experience across the whole campaign. This restriction is saved into the savegame, so only needs to be set once.
---@param disable boolean Disable experience. Set to false to re-enable.
function episodic_scripting:set_character_experience_disabled(disable) end

--- The specified faction will win the next autoresolve battle.
---@param faction_key string Faction key, from the factions table.
function episodic_scripting:win_next_autoresolve_battle(faction_key) end

--- Sets the multiplier of a scripted food type for a specified faction. The amount of food of this type this faction will earn per-turn will be multiplied by this amount.
---@param faction_key string Faction key, from the factions table.
---@param food_factor_key string Food factor key, from the food_factors table.
---@param multiplier number Multiplier.
function episodic_scripting:faction_set_food_factor_multiplier(faction_key, food_factor_key, multiplier) end

--- Force the specified faction to adopt the specified AI personality.
---@param faction_key string Faction key, from the factions table.
---@param personality_key string Personality key, from the cai_personalities table.
function episodic_scripting:force_change_cai_faction_personality(faction_key, personality_key) end

--- Set the attackers predicted win chance percentage for the next battle, affecting the balance of power shown on the pre-battle screen. This will not change the result.<br />
--- This function will only work if called while the pending battle is being set up.
---@param chance number Chance as a percentage, so a value of 50 would display a 50/50 attacker/defender balance.
function episodic_scripting:override_attacker_win_chance_prediction(chance) end

--- Sets whether the winds of magic gambler panel should be shown in the next player battle or not. The setting only affects the next battle.
---@param should_skip boolean should skip
function episodic_scripting:skip_winds_of_magic_gambler(should_skip) end

--- Spawns a new character in the specified faction's recruitment pool. The CHARACTER_DETAILS_SCRIPT_INTERFACE related to the spawned character is returned.
---@param faction string Faction key, from the factions table.
---@param forename string Forename key. This should be a value from the id field of the names table.
---@param surname string Surname key. This should be a value from the id field of the names table. A blank string may be supplied to omit this.
---@param clanname string Clan name key. This should be a value from the id field of the names table. This can be used to grant a title such as "Admiral" or "Emperor". A blank string may be supplied to omit this.
---@param othername string Other name key.  This should be a value from the id field of the names table. This is currently unused and should be set to a blank string.
---@param age number Age of character.
---@param male boolean Set this character to be male or female.
---@param agent_key string Agent record key, from the agents table.
---@param agent_subtype_key string Agent subtype key, from the agent_subtypes table.
---@param immortal boolean Sets whether this character is immortal.
---@param art_set string Art set override id, from the campaign_character_art_sets table. A blank string may be supplied to omit this.
function episodic_scripting:spawn_character_to_pool(faction, forename, surname, clanname, othername, age, male, agent_key, agent_subtype_key, immortal, art_set) end

--- Changes the name of a unit. The new name is specified by full localised text key, in the [table]_[key]_[field] format.
---@param unit UNIT_SCRIPT_INTERFACE Unit object - see the Model Hierarchy documentation for more information about this interface.
---@param name_key string Localised name key, in the [table]_[key]_[field] format.
function episodic_scripting:change_custom_unit_name(unit, name_key) end

--- Modify the number of faction slaves in the province containing a specified region. The change can be positive or negative. This function will only have an affect if the target faction makes use of the slaves mechanic.
---@param region_key string Region key, from the campaign_map_regions table.
---@param change number Value to modify slaves by.
function episodic_scripting:modify_faction_slaves_in_a_faction_province(region_key, change) end

--- Returns a cinematic script interface.
function episodic_scripting:cinematic() end

--- Modifies the result of the next autoresolved battle.
---@param attacker_win_chance number Attacker win chance as a unary (0-1) value.
---@param defender_win_chance number Defender win chance as a unary (0-1) value.
---@param attacker_losses_modifier number Multiplier for losses sustained by the attacker.
---@param defender_losses_modifier number Multiplier for losses sustained by the defender.
---@param kill_loser boolean Forces the loser of the battle to be wiped out if set to true.
function episodic_scripting:modify_next_autoresolve_battle(attacker_win_chance, defender_win_chance, attacker_losses_modifier, defender_losses_modifier, kill_loser) end

--- Makes it much more likely that one faction's stance towards another will be the supplied strategic stance.
---@param faction_key string Faction key, from the factions table.
---@param target_faction_key string Target faction key, from the factions table.
---@param strategic_stance_key string Strategic stance key - see the list at the top of this section.
function episodic_scripting:cai_strategic_stance_manager_promote_specified_stance_towards_target_faction(faction_key, target_faction_key, strategic_stance_key) end

--- Removes all custom battle overrides previously set with cm:add_custom_battlefield.<br />
--- Note that the campaign_manager intercepts calls which modify custom battlefield records, and will defer them if a battle is currently active and has been fought. This is to stop existing custom battlefield records, which are needed by the code to process the battle result, from being tampered with. See the Custom Battlefields section.
function episodic_scripting:clear_custom_battlefields() end

--- Adds a record which modifies or completely overrides a fought or autoresolved battle, if that battle happens within a certain supplied radius of a supplied campaign anchor position. Aspects of the battle may be specified, such as the loading screen and script to use, or the entire battle may be subsituted with an xml battle.<br />
--- Note that the campaign_manager intercepts calls which modify custom battlefield records, and will defer them if a battle is currently active and has been fought. This is to stop existing custom battlefield records, which are needed by the code to process the battle result, from being tampered with. See the Custom Battlefields section.
---@param id string Id for this custom battle record. This may be used to later remove this override with cm:remove_custom_battlefield.
---@param x number X logical co-ordinate of anchor position.
---@param y number Y logical co-ordinate of anchor position.
---@param radius number Radius around anchor position. If a battle is launched within this radius of the anchor position and it involves the local player, then the battle is modified/overridden.
---@param dump_campaign boolean If set to true, the battle makes no attempt to load back into this campaign after completion.
---@param loading_screen_override string Key of a custom loading screen to use, from the custom_loading_screens table. A blank string may be supplied to not override the loading screen. This is ignored if the entire battle is overriden with a battle xml, as that may specify a loading screen override.
---@param script_override string Path to a script file to load with the battle, from the working data folder. A blank string may be supplied to not override the loading screen. This is ignored if the entire battle is overriden with a battle xml, as that may specify a script override.
---@param whole_battle_override string Path to an battle xml file which overrides the whole battle.
---@param human_alliance number Sets the index of the human alliance, 0 or 1, if setting a battle xml to override the whole battle. If not setting a battle xml this number is ignored.
---@param launch_immediately boolean Launch the battle immediately without saving the campaign first.
---@param is_land_battle boolean Sets whether the following battle is a land battle. This is only required if when launching the battle immediately.
---@param force_autoresolve_result boolean If set to true, this forces the application of the autoresolver to the battle result after the battle, regardless of what happened in the battle itself. This is of most use for faking a battle result of an xml battle, which would otherwise return with no result.
function episodic_scripting:add_custom_battlefield(id, x, y, radius, dump_campaign, loading_screen_override, script_override, whole_battle_override, human_alliance, launch_immediately, is_land_battle, force_autoresolve_result) end

--- Unlock a ritual for a faction.
---@param faction FACTION_SCRIPT_INTERFACE Target Faction
---@param ritual_key string Ritual key, from the rituals table.
---@param duration number Duration, number of rounds the ritual will be unlocked for. Zero or negative will be infinite.
function episodic_scripting:unlock_ritual(faction, ritual_key, duration) end

--- Lock a ritual for a faction.
---@param faction FACTION_SCRIPT_INTERFACE Target Faction
---@param ritual_key string Ritual key, from the rituals table.
function episodic_scripting:lock_ritual(faction, ritual_key) end

--- Override the display of a building chain so that it appears as another building chain in the ui. A region key may optionally be specified to only override the building chain there. The override building chain must contain the same number of buildings as the chain being overridden.
---@param building_chain_key string Building chain key, from the building_chains table.
---@param override_chain_key string Override building chain key, also from the building_chains table.
---@param region_key string Region key, from the campaign_map_regions table.
function episodic_scripting:override_building_chain_display(building_chain_key, override_chain_key, region_key) end

--- Sets the maximum number of primary ingredients that the specified faction may cook with. This value is clamped between 0 and 10.
---@param faction FACTION_SCRIPT_INTERFACE Faction object - see the Model Hierarchy documentation for more information.
---@param max_ingredients number Maximum number of ingredients.
function episodic_scripting:set_faction_max_primary_cooking_ingredients(faction, max_ingredients) end

--- Force a recipe to be cooked for a faction with the specified ingredients. The ingredients lists should be specified as tables of strings.
---@param faction FACTION_SCRIPT_INTERFACE Faction object - see the Model Hierarchy documentation for more information.
---@param recipe string Recipe to cook. This should be a key from the cooking_recipes database table.
---@param primary_ingredients table Table containing a list of string values. Each should be a key from the cooking_ingredients database table.
---@param secondary_ingredients table Table containing a list of string values. Each should be a key from the cooking_ingredients database table.
---@param apply_cost boolean Apply the recipe cost.
function episodic_scripting:force_cook_recipe_with_ingredients(faction, recipe, primary_ingredients, secondary_ingredients, apply_cost) end

--- Triggers a custom mission from a string passed into the function. The mission string must be supplied in a custom format - see the missions.txt that commonly accompanies a campaign for examples.
---@param faction_key string Faction key, from the factions table.
---@param mission string Mission definition string.
function episodic_scripting:trigger_custom_mission_from_string(faction_key, mission) end

--- Force a recipe to be cooked for a faction. The default ingredients will be used.
---@param faction FACTION_SCRIPT_INTERFACE Faction object - see the Model Hierarchy documentation for more information.
---@param recipe string Recipe to cook. This should be a key from the cooking_recipes database table.
---@param apply_cost boolean Apply the recipe cost.
function episodic_scripting:force_cook_recipe(faction, recipe, apply_cost) end

--- Forces the specified faction to pick a new AI personality from their available pool. "All" may be supplied in place of a faction key to force all factions to change personalities.
---@param faction_key string Faction key, from the factions table, or "all".
function episodic_scripting:cai_force_personality_change(faction_key) end

--- Makes the supplied faction purchase a supplied effect for a supplied unit. All arguments are specified by model hierarchy objects - see the Model Hierarchy documentation for more information.
---@param faction FACTION_SCRIPT_INTERFACE faction
---@param unit UNIT_SCRIPT_INTERFACE unit
---@param purchasable_effect UNIT_PURCHASABLE_EFFECT_SCRIPT_INTERFACE purchasable effect
function episodic_scripting:faction_purchase_unit_effect(faction, unit, purchasable_effect) end

--- Spawn a plague at a military force.
---@param military_force MILITARY_FORCE_SCRIPT_INTERFACE Target military force.
---@param plague_key string Plague key, from the plagues table.
function episodic_scripting:spawn_plague_at_military_force(military_force, plague_key) end

--- Creates an army or a navy at the specified position, belonging to the specified faction, with the specified list of units. If the faction doesn't exist on the campaign map then it will also be created.
---@param faction_key string Faction key from the factions table.
---@param unit_list string Unit list. This should be a comma-separated list of unit keys from the main_units table.
---@param region_key string Region in which the force is created, from the campaign_map_regions table.
---@param x number Logical x co-ordinate.
---@param y number Logical y co-ordinate.
---@param id string ID of force. A ScriptedForceCreated event is triggered once the military force is created, and this ID is included in the context of the event so that listening scripts can differentiate between multiple created forces.
---@param exclude_unique_characters boolean Prevent this force from having a unique character appointed as its general.
function episodic_scripting:create_force(faction_key, unit_list, region_key, x, y, id, exclude_unique_characters) end

--- Spawn a plague at a settlement.
---@param settlement SETTLEMENT_SCRIPT_INTERFACE Target settlement.
---@param plague_key string Plague key, from the plagues table.
function episodic_scripting:spawn_plague_at_settlement(settlement, plague_key) end

--- Removes any attack of opportunity override previously placed on the target character with cm:add_attack_of_opportunity_overrides.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
function episodic_scripting:remove_attack_of_opportunity_overrides(character_lookup) end

--- Compels one faction to offer peace to another faction that it's at war with. The target faction may decline.
---@param proposing_faction_key string Faction key of the first faction, from the factions table.
---@param target_faction_key string Faction key of the second faction, from the factions table.
function episodic_scripting:faction_offers_peace_to_other_faction(proposing_faction_key, target_faction_key) end

--- Create a new modify ritual setup interface
---@param performing_faction FACTION_SCRIPT_INTERFACE Faction to perform the ritual
---@param ritual_key string Ritual key, from the rituals table.
function episodic_scripting:create_new_ritual_setup(performing_faction, ritual_key) end

--- Applies the effect of all rituals that are active for a faction right now. This is used in conjunction with the delay_payload_application field of the rituals database table. Should this field be set for a ritual, then that ritual will not apply its payload effects when triggered until this function or cm:apply_active_ritual is called.<br />
--- Calls to this function will not succeed if the ritual has not been actively triggered.
---@param faction FACTION_SCRIPT_INTERFACE Target faction.
function episodic_scripting:apply_active_rituals(faction) end

--- Adds a restriction preventing a specified building from being a construction option for a specified faction.<br />
--- This setting is saved into the campaign save file when the game is saved, and automatically re-established when the campaign is reloaded.
---@param building_key string Building key, from the building_levels table.
---@param faction_key string Faction key, from the factions table.
---@param tooltip_key string Key of localised text in full [table]_[field]_[key] format to show as a tooltip on the restricted building icon. This can be omitted.
function episodic_scripting:add_event_restricted_building_record_for_faction(building_key, faction_key, tooltip_key) end

--- Removes a lock previously placed with cm:lock_technology.
---@param faction_key string Faction key, from the factions table.
---@param technology_key string Technology key, from the technologies table.
function episodic_scripting:unlock_technology(faction_key, technology_key) end

--- Unlock a rituals in a category for a faction.
---@param faction FACTION_SCRIPT_INTERFACE Target Faction
---@param ritual_category_key string Ritual category key, from the ritual_categories table.
---@param duration number Duration, number of rounds the rituals in the category will be unlocked for. Zero or negative will be infinite.
function episodic_scripting:unlock_ritual_in_category(faction, ritual_category_key, duration) end

--- Establishes a circular area trigger monitor around a specified display position, with a specified character lookup string filter. This monitor will trigger an AreaEntered or AreaExited script event if a character that matches the specified filter moves through the specified circular area boundary.
---@param x number x display co-ordinate.
---@param y number y display co-ordinate.
---@param radius number Radius of circle.
---@param trigger_name string Trigger name. Multiple trigger areas with the same name behave as a single trigger.
---@param character_lookup string Character lookup string, specifying characters for which this trigger area will fire events. For more information, see Character Lookups.
---@param trigger_on_enter boolean Specifies whether an AreaEntered event is fired when a matching character enters the trigger area.
---@param trigger_on_exit boolean Specifies whether an AreaExited event is fired when a matching character exits the trigger area.
---@param trigger_once boolean Specifies whether the trigger continues monitoring after it fires its first event.
function episodic_scripting:add_circle_area_trigger(x, y, radius, trigger_name, character_lookup, trigger_on_enter, trigger_on_exit, trigger_once) end

--- Prevents or allows the saving of the game.
---@param should_disable boolean should disable
function episodic_scripting:disable_saving_game(should_disable) end

--- Sets whether the campaign director system can generate dilemmas or not.
---@param can_generate boolean can generate
function episodic_scripting:toggle_incident_generation(can_generate) end

--- Lock all rituals in a category for a faction.
---@param faction FACTION_SCRIPT_INTERFACE Target Faction
---@param ritual_category_key string Ritual category key, from the ritual_categories table.
function episodic_scripting:lock_rituals_in_category(faction, ritual_category_key) end

--- Sets the maximum number of secondary ingredients that the specified faction may cook with. This value is clamped between 0 and 10.
---@param faction FACTION_SCRIPT_INTERFACE Faction object - see the Model Hierarchy documentation for more information.
---@param max_ingredients number Maximum number of ingredients.
function episodic_scripting:set_faction_max_secondary_cooking_ingredients(faction, max_ingredients) end

--- Applies the effect of a ritual that is active right now. This is used in conjunction with the delay_payload_application field of the rituals database table. Should this field be set for a ritual, then that ritual will not apply its payload effects when triggered until this function or cm:apply_active_rituals is called.<br />
--- Calls to this function will not succeed if the ritual has not been actively triggered.
---@param faction FACTION_SCRIPT_INTERFACE Target faction.
---@param ritual ACTIVE_RITUAL_SCRIPT_INTERFACE Target ritual.
function episodic_scripting:apply_active_ritual(faction, ritual) end

--- Forcibly remove all background skills for the specified character.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
function episodic_scripting:remove_all_background_skills(character_lookup) end

--- Apply an effect bundle to a faction for a number of turns, or indefinitely.
---@param effect_bundle_key string Effect bundle key, from the effect_bundles table.
---@param faction_key string Faction key, from the factions table.
---@param turns number Number of turns to apply the effect bundle for. -1 may be supplied to apply the effect indefinitely.
function episodic_scripting:apply_effect_bundle(effect_bundle_key, faction_key, turns) end

--- Applies a custom effect bundle to a character. This replaces any existing effect bundle with the same record.<br />
--- For more information about the CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE or CHARACTER_SCRIPT_INTERFACE interfaces see the Model Hierarchy documentation.
---@param custom_effect_bundle CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE custom effect bundle
---@param character CHARACTER_SCRIPT_INTERFACE character
function episodic_scripting:apply_custom_effect_bundle_to_character(custom_effect_bundle, character) end

--- Changes the name of a faction. The new name is specified by full localised text key, in the [table]_[key]_[field] format.
---@param faction_key string Faction key, from the factions table.
---@param name_key string Localised name key, in the [table]_[key]_[field] format.
function episodic_scripting:change_localised_faction_name(faction_key, name_key) end

--- Wounds a specified character, forcing them to convalesce for a specified number of turns before they can be re-appointed.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param convalescence_time number Number of turns this character should convalesce for until they can be re-appointed.
function episodic_scripting:wound_character(character_lookup, convalescence_time) end

--- Removes a previously-applied effect bundle from a campaign map region.
---@param effect_bundle_key string Effect bundle key, from the effect_bundles table.
---@param region_key string Region key, from the campaign_map_regions table.
function episodic_scripting:remove_effect_bundle_from_region(effect_bundle_key, region_key) end

--- Adds one or more units of a specified type to a faction's mercenary pool. These units can then be recruitable by that faction (or potentially other factions) using gameplay mechanics such as Regiments of Renown or Wulfhart's Mercenaries.
---@param faction FACTION_SCRIPT_INTERFACE Faction whose pool the unit(s) should be added to. For more information about the FACTION_SCRIPT_INTERFACE interface see the Model Hierarchy documentation.
---@param unit string Key of unit to add to the mercenary pool, from the main_units table.
---@param count number Number of units to add to the mercenary pool.
---@param replenishment_chance number Replenishment chance, as a percentage. This is the chance per-turn that the number of available units in the pool of the supplied type will be increased, if not already at its maximum.
---@param max_units number The maximum number of units of the supplied type that the pool is allowed to contain.
---@param max_per_turn number The maximum number of units of the supplied type that may be added by replenishment per-turn.
---@param faction_restriction string The key of the faction who can actually recruit the units, from the factions database table. This may be different from the faction whose pool the unit is added to. An empty string "" may be supplied to omit this, which will usually be the case.
---@param subculture_restriction string The key of the subculture who can actually recruit the units, from the cultures_subcultures database table. An empty string "" may be supplied to omit this, which will usually be the case.
---@param tech_restriction string The key of a technology that must be researched in order to recruit the units, from the technologies database table.
---@param partial_replenishment boolean Allow replenishment of partial units.
function episodic_scripting:add_unit_to_faction_mercenary_pool(faction, unit, count, replenishment_chance, max_units, max_per_turn, faction_restriction, subculture_restriction, tech_restriction, partial_replenishment) end

--- Attempts to trigger a mission from database records with one or more target game objects. The game object or objects to associate the mission with are specified by command-queue index. The mission will need to pass any conditions set up in the cdir_events_mission_option_junctions table in order to trigger.<br />
--- A value of 0 may be supplied to omit a particular type of target.
---@param faction_cqi number Command-queue index of the faction to which the mission is issued. This must be supplied.
---@param mission_key string Mission key, from the missions table.
---@param target_faction_cqi number Command-queue index of a target faction. 0 may be specified to omit this target (and other target arguments following this one).
---@param secondary_faction_cqi number Command-queue index of a second target faction. May be 0.
---@param character_cqi number Command-queue index of a target character. May be 0.
---@param military_force_cqi number Command-queue index of a target military force. May be 0.
---@param region_cqi number Command-queue index of a target region. May be 0.
---@param settlement_cqi number Command-queue index of a target settlement. May be 0.
function episodic_scripting:trigger_mission_with_targets(faction_cqi, mission_key, target_faction_cqi, secondary_faction_cqi, character_cqi, military_force_cqi, region_cqi, settlement_cqi) end

--- Remove the first instance of the specified unit from the force commanded by the specified character.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param unit_key string Key of unit to remove, from the main_units table.
function episodic_scripting:remove_unit_from_character(character_lookup, unit_key) end

--- Returns a lua table containing a list of building keys that are upgrades from a supplied building key. If the building specified by the supplied key has no upgrades then the returned table will be empty. If the supplied key does not specify a building then nothing is returned.<br />
--- Building keys all specify building records in the building_levels database table.
---@param building_key string building key
function episodic_scripting:get_building_level_upgrades(building_key) end

--- Spawns a new character into a position in the family tree of the specified faction.
---@param faction string Faction key, from the factions table.
---@param forename string Forename key. This should be a value from the id field of the names table.
---@param surname string Surname key. This should be a value from the id field of the names table. A blank string may be supplied to omit this.
---@param clanname string Clan name key. This should be a value from the id field of the names table. This can be used to grant a title such as "Admiral" or "Emperor". A blank string may be supplied to omit this.
---@param othername string Other name key.  This should be a value from the id field of the names table. This is currently unused and should be set to a blank string.
---@param age number Age of character.
---@param male boolean Set this character to be male or female.
---@param father string Character lookup string specifying the father of the spawned character. For more information see the documentation on Character Lookups.
---@param mother string Character lookup string specifying the mother of the spawned character. For more information see the documentation on Character Lookups.
---@param immortal boolean Sets whether this character is immortal.
---@param art_set string Art set override id, from the campaign_character_art_sets table. A blank string may be supplied to omit this.
---@param make_heir boolean Make this character the faction heir.
function episodic_scripting:spawn_character_into_family_tree(faction, forename, surname, clanname, othername, age, male, father, mother, immortal, art_set, make_heir) end

--- Steals the ESC key, so that keypresses on it are redirected to script. When keypresses are stolen by script the game calls a function called OnKeyPressed when a keypress occurs. This function can be declared in script to receive these notifications.
---@param steal_escape_key boolean steal escape key
function episodic_scripting:steal_escape_key(steal_escape_key) end

--- Fades the scene to black or back to picture over a specified period.
---@param brightness number Brightness, as a unary value. Supply a value of 0 to fade to black, supply a value of 1 to fade to picture, or supply a value in between to transition to a partially-faded picture.
---@param duration number Duration of the fade effect in seconds.
function episodic_scripting:fade_scene(brightness, duration) end

--- Sets the hit points/number of men to the given unary proportion of the maximum for that unit. The unit is specified by UNIT_SCRIPT_INTERFACE - see the Model Hierarchy documentation for more information.
---@param unit UNIT_SCRIPT_INTERFACE Unit.
---@param unary_hp number Unary proportion (0-1) of max hp value to set unit health to.
function episodic_scripting:set_unit_hp_to_unary_of_maximum(unit, unary_hp) end

--- Adds a composite scene to the port slot of a specified settlement.
---@param name string Unique name for this composite scene, by which it may later be removed with cm:remove_scripted_composite_scene.
---@param composite_scene string Composite scene key from the campaign_composite_scenes table.
---@param Region REGION_SCRIPT_INTERFACE Region of the settlement to add the scene to
---@param facing_x number Logical x co-ordinate of a position this composite scene faces.
---@param facing_y number Logical y co-ordinate of a position this composite scene faces.
---@param one_shot boolean One shot - if set to true, this composite scene is not added to the internal list of scenes and can't later be removed with cm:remove_scripted_composite_scene. However, the name of one-shot scenes does not have to be unique.
---@param show_in_seen_shroud boolean Sets whether this composite scene should be drawn when in thin shroud over previously-seen terrain.
---@param show_in_unseen_shroud boolean Sets whether this composite scene should be drawn when in thick shroud over unseen terrain.
---@param faction FACTION_SCRIPT_INTERFACE Faction this composite scene is visible to. Defaults to all factions if not set.
function episodic_scripting:add_scripted_composite_scene_to_settlement_port(name, composite_scene, Region, facing_x, facing_y, one_shot, show_in_seen_shroud, show_in_unseen_shroud, faction) end

--- Exempts, or un-exempts, the province containing specified region from tax contributions.
---@param region_key string Region key, from the campaign_map_regions table.
---@param exempt boolean Exempt province from tax.
function episodic_scripting:exempt_region_from_tax(region_key, exempt) end

--- Orders one character to seek a unit exchange with a target character, allowing troops to be swapped between the two armies they command.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param target_character_lookup string Target character lookup string. For more information, see Character Lookups.
---@param show_ui boolean Shows the seek exchange UI.
function episodic_scripting:seek_exchange(character_lookup, target_character_lookup, show_ui) end

--- Spawns an agent of the specified type next to the specified settlement.<br />
--- See the Model Hierarchy documentation for more information on the FACTION_SCRIPT_INTERFACE or SETTLEMENT_SCRIPT_INTERFACE interfaces.
---@param faction FACTION_SCRIPT_INTERFACE Faction interface for the agent's faction.
---@param settlement SETTLEMENT_SCRIPT_INTERFACE Settlement at which to spawn the agent.
---@param agent_type string Agent type key, from the agents table.
---@param agent_subtype string Agent subtype key, from the agent_subtypes table. This can be omitted.
function episodic_scripting:spawn_agent_at_settlement(faction, settlement, agent_type, agent_subtype) end

--- Creates an army or a navy commanded by a specified character at the specified position, belonging to the specified faction, with the specified list of units. If the faction doesn't exist on the campaign map then it will also be created.
---@param faction_key string Faction key from the factions table.
---@param unit_list string Unit list. This should be a comma-separated list of unit keys from the main_units table.
---@param region_key string Region in which the force is created, from the campaign_map_regions table.
---@param x number Logical x co-ordinate.
---@param y number Logical y co-ordinate.
---@param character_type string Character type key, from the agents table.
---@param character_subtype string Character subtype key, from the agent_subtypes table.
---@param forename string Forename id. This should be a value from the id field of the names table.
---@param clanname string Clan name id. This should be a value from the id field of the names table. This can be used to grant a title such as "Admiral" or "Emperor". A blank string may be supplied to omit this.
---@param surname string Surname id. This should be a value from the id field of the names table. A blank string may be supplied to omit this.
---@param other_name string Other name id. This should be a value from the id field of the names table. This is currently unused and should be set to a blank string.
---@param id string ID of force. A ScriptedForceCreated event is triggered once the military force is created, and this ID is included in the context of the event so that listening scripts can differentiate between multiple created forces.
---@param make_faction_leader boolean Make this character the faction leader.
function episodic_scripting:create_force_with_general(faction_key, unit_list, region_key, x, y, character_type, character_subtype, forename, clanname, surname, other_name, id, make_faction_leader) end

--- Applies a custom effect bundle to a province. This replaces any existing effect bundle with the same record. The effect bundle will be applied to the portion of the province owned by the owner of the specified region - this can be the whole province if one faction controls it all.<br />
--- For more information about the CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE or REGION_SCRIPT_INTERFACE interfaces see the Model Hierarchy documentation.
---@param custom_effect_bundle CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE custom effect bundle
---@param region REGION_SCRIPT_INTERFACE region
function episodic_scripting:apply_custom_effect_bundle_to_faction_province(custom_effect_bundle, region) end

--- Repositions the camera to the specified co-ordinates.
---@param x number Display x co-ordinate of camera target.
---@param y number Display y co-ordinate of camera target.
---@param d number Horizontal distance from camera to target.
---@param b number Horizontal bearing in radians of target from camera.
---@param h number Height of camera.
function episodic_scripting:set_camera_position(x, y, d, b, h) end

--- Instantly upgrades the building in the specified foreign slot. The slot is specified by slot cqi, which can be obtained from the foreign slot script interface on the model hierarchy.
---@param foreign_slot_cqi number Foreign slot cqi.
---@param building_key string Building key, from the building_levels table.
function episodic_scripting:foreign_slot_instantly_upgrade_building(foreign_slot_cqi, building_key) end

--- Remove a skill point from the specified character and skill. Returns true if successful.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param skill_key string Skill key, from the character_skills table.
function episodic_scripting:remove_skill_point(character_lookup, skill_key) end

--- Adds one or more units of a specified type to the mercenary pool in a province. These units can then be recruitable by that faction (or potentially other factions) using gameplay mechanics such as Raising Dead.
---@param region REGION_SCRIPT_INTERFACE Region within the province to which the unit(s) should be added. For more information about the REGION_SCRIPT_INTERFACE interface see the Model Hierarchy documentation.
---@param unit string Key of unit to add to the mercenary pool, from the main_units table.
---@param count number Number of units to add to the mercenary pool.
---@param replenishment_chance number Replenishment chance, as a percentage. This is the chance per-turn that the number of available units in the pool of the supplied type will be increased, if not already at its maximum.
---@param max_units number The maximum number of units of the supplied type that the pool is allowed to contain.
---@param max_per_turn number The maximum number of units of the supplied type that may be added by replenishment per-turn.
---@param faction_restriction string The key of the faction who can actually recruit the units, from the factions database table. This may be different from the faction whose pool the unit is added to. An empty string "" may be supplied to omit this, which will usually be the case.
---@param subculture_restriction string The key of the subculture who can actually recruit the units, from the cultures_subcultures database table. An empty string "" may be supplied to omit this, which will usually be the case.
---@param tech_restriction string The key of a technology that must be researched in order to recruit the units, from the technologies database table.
function episodic_scripting:add_unit_to_province_mercenary_pool(region, unit, count, replenishment_chance, max_units, max_per_turn, faction_restriction, subculture_restriction, tech_restriction) end

--- Forces the military force commanded by the specified character into the specified stance.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param stance_key string Stance key, from the campaign_stances table.
function episodic_scripting:force_character_force_into_stance(character_lookup, stance_key) end

--- Sets the shroud state of a specified sea region for all factions to seen. The specified region must be a sea region.
---@param region_key string Region key, from the campaign_map_regions table.
function episodic_scripting:make_sea_region_seen_in_shroud(region_key) end

--- Plays a movie in the movie panel, by path from the data/Movies directory.
---@param movie_path string movie path
function episodic_scripting:play_movie_in_ui(movie_path) end

--- Applies an effect bundle to a province. The province is specified by REGION_SCRIPT_INTERFACE - see the Model Hierarchy documentation for more information. The effect bundle will be applied to the portion of the province owned by the owner of the specified region - this can be the whole province if one faction controls it all.
---@param effect_bundle string Effect bundle key, from the effect_bundles table.
---@param region REGION_SCRIPT_INTERFACE Target region.
---@param turns number Number of turns to apply the effect bundle for. -1 may be supplied to apply the effect indefinitely.
function episodic_scripting:apply_effect_bundle_to_faction_province(effect_bundle, region, turns) end

--- Removes the shroud from a specified sea region for all factions.
---@param region_key string Region key, from the campaign_map_regions table.
function episodic_scripting:make_sea_region_visible_in_shroud(region_key) end

--- Removes the specified foreign slot set from the target region, for the target faction.
---@param faction_cqi number Command-queue index value of the target faction.
---@param region_cqi number Command-queue index value of the target region.
function episodic_scripting:remove_faction_foreign_slots_from_region(faction_cqi, region_cqi) end

--- Causes movement extents surrounded a selected character in the game to flash or not.
---@param should_highlight boolean should highlight
function episodic_scripting:highlight_movement_extents(should_highlight) end

--- Removes a restriction previously added with cm:add_event_restricted_building_record_for_faction.
---@param building_key string Building key, from the building_levels table.
---@param faction_key string Faction key, from the factions table.
function episodic_scripting:remove_event_restricted_building_record_for_faction(building_key, faction_key) end

--- Make the specified garrisoned character leave their garrison and move to a specified logical positon. Orders the specified character to move into a specified garrison residence. The garrison is specified by settlement key.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param settlement string Key of settlement containing the garrison residence, from the campaign_map_settlements table.
function episodic_scripting:leave_garrison(character_lookup, settlement) end

--- Lock a specified technology and all technologies that are children of it, for a specified faction.<br />
--- This setting is saved into the campaign save file when the game is saved, and automatically re-established when the campaign is reloaded.
---@param faction_key string Faction key, from the factions table.
---@param technology_key string Technology key, from the technologies table.
function episodic_scripting:lock_technology(faction_key, technology_key) end

--- Removes a restriction previously added with cm:add_event_restricted_building_record.
---@param building_key string Building key, from the building_levels table.
function episodic_scripting:remove_event_restricted_building_record(building_key) end

--- Heals the garrison army (and navy, where applicable) in the specified region back to full health. The region is specified by cqi.
---@param region_cqi number Command-queue index of the target region.
function episodic_scripting:heal_garrison(region_cqi) end

--- Removes a restriction previously added with cm:add_event_restricted_unit_record_for_faction.
---@param unit_key string Unit key, from the main_units table.
---@param faction_key string Faction key, from the factions table.
function episodic_scripting:remove_event_restricted_unit_record_for_faction(unit_key, faction_key) end

--- Removes a previously-applied effect bundle from a military force, specified by its commanding character.
---@param effect_bundle_key string Effect bundle key, from the effect_bundles table.
---@param character_cqi number Command-queue index of the character commanding the military force.
function episodic_scripting:remove_effect_bundle_from_characters_force(effect_bundle_key, character_cqi) end

--- Adds a restriction preventing a specified unit from being a recruitment option for any faction.<br />
--- This setting is saved into the campaign save file when the game is saved, and automatically re-established when the campaign is reloaded.
---@param unit_key string Unit key, from the main_units table.
---@param tooltip_key string Key of localised text in full [table]_[field]_[key] format to show as a tooltip on the restricted unit icon. This can be omitted.
function episodic_scripting:add_event_restricted_unit_record(unit_key, tooltip_key) end

--- Immediately sets the specified to be abandoned. Nothing will happen if an already-abandoned region is specified.
---@param region_key string Region key, from the campaign_map_regions table.
function episodic_scripting:set_region_abandoned(region_key) end

--- Disables or re-enables public order in the province containing the specified region.
---@param region_key string Region key, from the campaign_map_regions table.
---@param disable boolean Disable public order.
function episodic_scripting:set_public_order_disabled_for_province_for_region(region_key, disable) end

--- Triggers a custom dilemma with two choices, with the specified character as the dilemma target.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param dilemma_key string Dilemma key, from the dilemmas table.
---@param first_choice_payload string Payload key for the first choice of the dilemma, from the cdir_events_dilemma_payloads table.
---@param second_choice_payload string Payload key for the second choice of the dilemma, from the cdir_events_dilemma_payloads table.
function episodic_scripting:trigger_custom_dilemma_for_character(character_lookup, dilemma_key, first_choice_payload, second_choice_payload) end

--- Forces a trade agreement between two specified factions. If no agreement is possible then nothing will happen.
---@param first_faction_key string Faction key of the first faction, from the factions table.
---@param second_faction_key string Faction key of the second faction, from the factions table.
function episodic_scripting:force_make_trade_agreement(first_faction_key, second_faction_key) end

--- Forces peace between two warring factions.
---@param first_faction_key string Faction key of the first faction, from the factions table.
---@param second_faction_key string Faction key of the second faction, from the factions table.
function episodic_scripting:force_make_peace(first_faction_key, second_faction_key) end

--- Force one faction to grant another faction military access to its territory.
---@param granting_faction_key string Faction key of the granting faction, from the factions table.
---@param recipient_faction_key string Faction key of the recipient faction, from the factions table.
---@param is_hard_access boolean Indicates whether this should be hard military access. This concept is currently unused.
function episodic_scripting:force_grant_military_access(granting_faction_key, recipient_faction_key, is_hard_access) end

--- Apply an effect bundle to a military force for a number of turns, or indefinitely. The military force is specified by its commanding character.
---@param effect_bundle_key string Effect bundle key, from the effect_bundles table.
---@param character_cqi number Command-queue index of the character commanding the military force.
---@param turns number Number of turns to apply the effect bundle for. -1 may be supplied to apply the effect indefinitely.
function episodic_scripting:apply_effect_bundle_to_characters_force(effect_bundle_key, character_cqi, turns) end

--- Causes the zone of control surrounding a selected character in the game to flash or not.
---@param should_highlight boolean should highlight
function episodic_scripting:highlight_selected_character_zoc(should_highlight) end

--- Enables or disables the shroud.
---@param show boolean show
function episodic_scripting:show_shroud(show) end

--- Stops all military forces from entering non-default recruitment stances, such as raiding camp stance.
---@param force_basic_recruitment_stances boolean force basic recruitment stances
function episodic_scripting:set_only_allow_basic_recruit_stance(force_basic_recruitment_stances) end

--- Changes the name of a settlement. The new name is specified by full localised text key, in the [table]_[key]_[field] format.
---@param settlement SETTLEMENT_SCRIPT_INTERFACE Settlement object - see the Model Hierarchy documentation for more information about this interface.
---@param name_key string Localised name key, in the [table]_[key]_[field] format.
function episodic_scripting:change_custom_settlement_name(settlement, name_key) end

--- Adds a composite scene at a specified logical position.
---@param name string Unique name for this composite scene, by which it may later be removed with cm:remove_scripted_composite_scene.
---@param composite_scene string Composite scene key from the campaign_composite_scenes table.
---@param x number Logical x co-ordinate.
---@param x number Logical y co-ordinate.
---@param facing_x number Logical x co-ordinate of a position this composite scene faces.
---@param facing_y number Logical y co-ordinate of a position this composite scene faces.
---@param one_shot boolean One shot - if set to true, this composite scene is not added to the internal list of scenes and can't later be removed with cm:remove_scripted_composite_scene. However, the name of one-shot scenes does not have to be unique.
---@param show_in_seen_shroud boolean Sets whether this composite scene should be drawn when in thin shroud over previously-seen terrain.
---@param show_in_unseen_shroud boolean Sets whether this composite scene should be drawn when in thick shroud over unseen terrain.
---@param faction FACTION_SCRIPT_INTERFACE Faction this composite scene is visible to. Defaults to all factions if not set.
function episodic_scripting:add_scripted_composite_scene_to_logical_position(name, composite_scene, x, x, facing_x, facing_y, one_shot, show_in_seen_shroud, show_in_unseen_shroud, faction) end

--- Utilises the pathfinder to locate and return a valid logical spawn point for a character, based around another character. Returns -1, -1 if invalid.
---@param faction_key string Faction key, from the factions table.
---@param character_lookup string Character lookup string of subject character. For more information see the documentation on Character Lookups.
---@param in_same_region boolean Specifies whether the spawn location should be in the same region as the specified character.
---@param preferred_distance number Preferred spawn distance, in logical hexes.
function episodic_scripting:find_valid_spawn_location_for_character_from_character(faction_key, character_lookup, in_same_region, preferred_distance) end

--- Clears any existing scripted stance promotions from one faction to a target faction.
---@param faction_key string Faction key, from the factions table.
---@param target_faction_key string Target faction key, from the factions table.
function episodic_scripting:cai_strategic_stance_manager_clear_all_promotions_between_factions(faction_key, target_faction_key) end

--- Applies a custom effect bundle to a character's military force. This replaces any existing effect bundle with the same record.<br />
--- For more information about the CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE or CHARACTER_SCRIPT_INTERFACE interfaces see the Model Hierarchy documentation.
---@param custom_effect_bundle CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE custom effect bundle
---@param character CHARACTER_SCRIPT_INTERFACE character
function episodic_scripting:apply_custom_effect_bundle_to_characters_force(custom_effect_bundle, character) end

--- Prevents the AI from being able to move a character. Other sources of character movement (e.g. the script or the player) will work as normal.
---@param character_lookup string Character lookup string - see Character Lookups for more information.
function episodic_scripting:cai_disable_movement_for_character(character_lookup) end

--- Adds a vfx to a specified garrison residence/settlement.
---@param garrison_residence_cqi number Command queue index of the garrison residence.
---@param vfx string VFX type. This must be an entry from the vfx_event field of the campaign_vfx_lookups table.
---@param show_in_shroud boolean Show this vfx even when the garrison residence is under the shroud.
function episodic_scripting:add_garrison_residence_vfx(garrison_residence_cqi, vfx, show_in_shroud) end

--- Sets the public order value for the province containing the specified region.
---@param region_key string Region key, from the campaign_map_regions table.
---@param public_order number Public order value.
function episodic_scripting:set_public_order_of_province_for_region(region_key, public_order) end

--- Applies a custom effect bundle to a faction. This replaces any existing effect bundle with the same record.<br />
--- For more information about the CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE or FACTION_SCRIPT_INTERFACE interfaces see the Model Hierarchy documentation.
---@param custom_effect_bundle CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE custom effect bundle
---@param faction FACTION_SCRIPT_INTERFACE faction
function episodic_scripting:apply_custom_effect_bundle_to_faction(custom_effect_bundle, faction) end

--- Scroll the camera along a list of co-ordinates that define a spline. 
---@param adjust_endpoint boolean Adjust the endpoint to be valid for gameplay. Set this to true if control is to be restored to the player after this camera movement finishes. Set to false if another camera movement follows this one.
---@param scroll_time number Scroll time in seconds
function episodic_scripting:scroll_camera_with_direction(adjust_endpoint, scroll_time) end

--- Orders the specified character to attack a target character. This is equivalent to the player or AI issuing the same order, and as such should only be done on that faction's turn.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param target_character_lookup string Target character lookup string. For more information, see Character Lookups.
---@param lay_siege boolean Lay siege if the target is a garrison residence.
---@param ignore_shroud boolean Ignores shroud restrictions. If this is set to false then the attack command is ignore if the attacker cannot see the target.
function episodic_scripting:attack(character_lookup, target_character_lookup, lay_siege, ignore_shroud) end

--- Directly applies a diplomatic bonus or penalty between two factions, as if it had come from a dilemma. The bonus should be an integer between -6 and +6, each integer value of which corresponds to a change type (from PENALTY_XXXLARGE (-6) to BONUS_XXXLARGE (+6)) which carries a diplomatic attitude modifier that is actually applied.
---@param faction_a_key string First faction key.
---@param faction_a_key string Second faction key.
---@param bonus_value number Bonus value (-6 to +6).
function episodic_scripting:apply_dilemma_diplomatic_bonus(faction_a_key, faction_a_key, bonus_value) end

--- Stops a scrolling camera.
function episodic_scripting:stop_camera() end

--- Creates a unique agent at or near the position of a specified character.
---@param faction_cqi number Faction cqi.
---@param agent_key string Agent record key, from the unique_agents table.
---@param character_cqi number The cqi of the target character.
---@param force boolean Force agent to spawn even if invalid.
function episodic_scripting:spawn_unique_agent_at_character(faction_cqi, agent_key, character_cqi, force) end

--- Create an agent/hero character at a specified position.
---@param faction_key string Faction key from the factions table.
---@param agent_type string Agent type from the agents table.
---@param agent_subtype string Agent subtype from the agent_subtypes table.
---@param x number Logical x co-ordinate.
---@param y number Logical y co-ordinate.
---@param id string ID of agent. A ScriptedAgentCreated event is triggered once the character is created, and this ID is included in the context of the event so that listening scripts can differentiate between multiple created agents.
function episodic_scripting:create_agent(faction_key, agent_type, agent_subtype, x, y, id) end

--- Orders the specified character to initiate an attack on the settlement in a target region. If the character cannot initiate a battle (for example he or she currently has no method to defeat the fortifications) then nothing will happen.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param region_key string Region key containing the target settlement, from the campaign_map_regions table.
function episodic_scripting:attack_region(character_lookup, region_key) end

--- Whitelists an event type, allowing it to be shown despite suppression being activated with cm:suppress_all_event_feed_event_types. Event types are specified by a compound key from the event_feed_targeted_events table, by concatenating the values from the event and target fields from that table. See the documentation for the ui-side equivalent of this function, CampaignUI.WhiteListEventTypeInUI, for more information.<br />
--- This function has no effect if suppression has not been activated with cm:suppress_all_event_feed_event_types.
---@param event_type string Event type, specified with a compound key from the event_feed_targeted_events table.
function episodic_scripting:whitelist_event_feed_event_type(event_type) end

--- Enables or disables the user interface.
---@param enable_ui boolean enable ui
function episodic_scripting:enable_ui(enable_ui) end

--- Disables or re-enables all rebellions across the map.
---@param disable boolean disable
function episodic_scripting:disable_rebellions_worldwide(disable) end

--- Cancels an active custom mission.
---@param faction_key string Faction key, from the factions table.
---@param mission_key string Mission key, from the missions table.
function episodic_scripting:cancel_custom_mission(faction_key, mission_key) end

--- Removes an effect bundle from a character. The character is specified by CHARACTER_SCRIPT_INTERFACE - see the Model Hierarchy documentation for more information.
---@param effect_bundle string Effect bundle key, from the effect_bundles table.
---@param character CHARACTER_SCRIPT_INTERFACE Target character.
function episodic_scripting:remove_effect_bundle_from_character(effect_bundle, character) end

--- Removes a previously-applied effect bundle from a military force.
---@param effect_bundle_key string Effect bundle key, from the effect_bundles table.
---@param force_cqi number Command-queue index of the military force.
function episodic_scripting:remove_effect_bundle_from_force(effect_bundle_key, force_cqi) end

--- Unlocks recruitment of a starting general, allowing them to be recruited. This also works for characters that are convalescing. The character must be specified by startpos id.
---@param startpos_id string Startpos id of the target character. This is looked up from the ID field of the start_pos_characters table. This function cannot be used to unlock recruitment of a character not present in the startpos data.
---@param faction_key string Faction key of the character, from the factions table.
function episodic_scripting:unlock_starting_general_recruitment(startpos_id, faction_key) end

--- Write a value to the savegame. This should only be called when the SavingGame event is received, and must be passed the context object supplied by that event.<br />
--- It's recommended to use the saving functions provided by the campaign manager, listed in the Saving Game section of this documentation, instead of directly calling this function.
---@param value_name string Value name.
---@param value_to_save string|number|boolean Value to save. Can be a boolean, number or string.
---@param context_object context context object
function episodic_scripting:save_named_value(value_name, value_to_save, context_object) end

--- Disables or re-enables imperium level changes across the whole campaign.
---@param disable boolean disable
function episodic_scripting:set_imperium_level_change_disabled(disable) end

--- Immediately transfers ownership of the specified region to the specified faction.
---@param region_key string Region key, from the campaign_map_regions table.
---@param faction_key string Faction key, from the factions table.
function episodic_scripting:transfer_region_to_faction(region_key, faction_key) end

--- Performs an action on a character within the faction's prison. The faction and character (family member) are specified by model hierarchy objects - see the Model Hierarchy documentation for more information.
---@param faction FACTION_SCRIPT_INTERFACE Imprisoning faction.
---@param character FAMILY_MEMBER_SCRIPT_INTERFACE Imprisoned character - this is specified as a family member.
---@param action string Action to perform. This should be a key from the campaign_prison_actions database table.
function episodic_scripting:faction_perform_action_on_prisoner(faction, character, action) end

--- Replenishes the action points of a specified character.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
function episodic_scripting:replenish_action_points(character_lookup) end

--- Attempts to trigger an incident from database records with one or more target game objects. The game object or objects to associate the incident with are specified by command-queue index. The incident will need to pass any conditions set up in the cdir_events_incident_option_junctions table in order to trigger.<br />
--- A value of 0 may be supplied to omit a particular type of target.
---@param faction_cqi number Command-queue index of the faction to which the incident is issued. This must be supplied.
---@param incident_key string Incident key, from the incidents table.
---@param target_faction_cqi string Command-queue index of a target faction. 0 may be specified to omit this target (and other target arguments following this one).
---@param secondary_faction_cqi string Command-queue index of a second target faction. May be 0.
---@param character_cqi string Command-queue index of a target character. May be 0.
---@param military_force_cqi string Command-queue index of a target military force. May be 0.
---@param region_cqi string Command-queue index of a target region. May be 0.
---@param settlement_cqi string Command-queue index of a target settlement. May be 0.
function episodic_scripting:trigger_incident_with_targets(faction_cqi, incident_key, target_faction_cqi, secondary_faction_cqi, character_cqi, military_force_cqi, region_cqi, settlement_cqi) end

--- Spawns an agent of the specified type next to the specified military force.<br />
--- See the Model Hierarchy documentation for more information on the FACTION_SCRIPT_INTERFACE or MILITARY_FORCE_SCRIPT_INTERFACE interfaces.
---@param faction FACTION_SCRIPT_INTERFACE Faction interface for the agent's faction.
---@param force MILITARY_FORCE_SCRIPT_INTERFACE Military force at which to spawn the agent.
---@param agent_type string Agent type key, from the agents table.
---@param agent_subtype string Agent subtype key, from the agent_subtypes table. This can be omitted.
function episodic_scripting:spawn_agent_at_military_force(faction, force, agent_type, agent_subtype) end

--- Returns the current position of the camera.
function episodic_scripting:get_camera_position() end

--- Disables or re-enables post-battle liberation options for the player.
---@param disable boolean disable
function episodic_scripting:set_liberation_options_disabled(disable) end

--- Add development points to a horde.
---@param military_force MILITARY_FORCE_SCRIPT_INTERFACE military force
---@param development_points number Developments points to add.
function episodic_scripting:add_development_points_to_horde(military_force, development_points) end

--- Returns true if this campaign is running in benchmark mode, meaning it was launched from the benchmark section in the graphics options.
function episodic_scripting:is_benchmark_mode() end

--- Forces one faction to declare war on another.
---@param attacking_faction_key string Faction key of the attacking faction, from the factions table.
---@param target_faction_key string Faction key of the target faction, from the factions table.
---@param invite_attacker_allies boolean Allows factions allied with the attacker to choose whether to join.
---@param invite_defender_allies boolean Allows factions allied with the defender to choose whether to join.
function episodic_scripting:force_declare_war(attacking_faction_key, target_faction_key, invite_attacker_allies, invite_defender_allies) end

--- Immediately modifies the treasury of the specified faction by the specified amount.
---@param faction_key string Faction key, from the factions table.
---@param amount number Treasury modification. This value must be positive.
function episodic_scripting:treasury_mod(faction_key, amount) end

--- Immediately cancels the current actions of a specified character.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
function episodic_scripting:cancel_actions_for(character_lookup) end

--- Removes the specified trait from the specified character. If the character is past the point of no return in the trait, it will be removed anyway.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param trait_key string Trait key, from the character_traits table.
function episodic_scripting:force_remove_trait(character_lookup, trait_key) end

--- Completely resets the skill points of the target character. Does not remove background skills.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
function episodic_scripting:force_reset_skills(character_lookup) end

--- Sets whether the campaign director system can generate dilemmas or not.
---@param can_generate boolean can generate
function episodic_scripting:toggle_dilemma_generation(can_generate) end

--- Grant the specified skill to the specified character, or adds a point if they already have it.
---@param character_lookup string Character lookup string. For more information, see Character Lookups.
---@param skill_key string Skill key, from the character_skills table.
function episodic_scripting:force_add_skill(character_lookup, skill_key) end

--- Returns whether the dlc with the specified key is activated.
---@param dlc_key string dlc key
function episodic_scripting:is_dlc_flag_enabled(dlc_key) end

--- Removes any area triggers established with cm:add_hex_area_trigger with the supplied trigger name.
---@param trigger_name string trigger name
function episodic_scripting:remove_hex_area_trigger(trigger_name) end
