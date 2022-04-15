
---@class campaign_manager
local campaign_manager = {}

--- Calls the supplied function repeatedly after the supplied period in seconds using a timer synchronised to the campaign model. A string name for the callback may optionally be provided to allow the callback to be cancelled. Cancelling the callback is the only method to stop a repeat callback, once started.<br />
--- This function call is passed through to timer_manager:callback - this campaign_manager alias is provided purely for convenience.
---@param callback_to_call function Callback to call.
---@param time number Time in seconds after to which to call the callback, repeatedly. The callback will be called each time this interval elapses.
---@param name string Callback name. If supplied, this callback can be cancelled at a later time with campaign_manager:remove_callback.
function campaign_manager:repeat_callback(callback_to_call, time, name) end

--- Scrolls the camera from the current camera position in a cutscene. Cinematic borders will be shown (unless disabled with campaign_manager:set_use_cinematic_borders_for_automated_cutscenes), the UI hidden, and interaction with the game disabled while the camera is scrolling. The player will be able to skip the cutscene with the ESC key, in which case the camera will jump to the end position.
---@param time number Time in seconds over which to scroll.
---@param callback function Optional callback to call when the cutscene ends.
---@vararg any
function campaign_manager:scroll_camera_with_cutscene(time, callback, positions) end

--- Retrieves or generates a value saved using the saved value system. When called, the function looks up a value by supplied name using campaign_manager:get_saved_value. If it exists it is returned, but if it doesn't exist a supplied function is called which generates the cached value. This value is saved with the supplied name, and also returned. A value is generated the first time this function is called, therefore, and is retrieved from the savegame on subsequent calls with the same arguments. If the supplied function doesn't return a value, a script error is triggered.
---@param value_name string value name
---@param generator_callback function generator callback
function campaign_manager:get_cached_value(value_name, generator_callback) end

--- Returns true if the supplied character is a general that has been defeated (when?), false otherwise.
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_manager:char_is_defeated_general(character) end

--- Draws a debug line in the 3D space.
---@param x_start_pos number Start point display x co-ordinate.
---@param y_start_pos number Start point display y co-ordinate.
---@param z_start_pos number Start point display z co-ordinate (height).
---@param x_end_pos number End point display x co-ordinate.
---@param y_end_pos number End point display y co-ordinate.
---@param z_end_pos number End point display z co-ordinate (height).
---@param duration number Duration in seconds to display the text on screen for.
---@param r number Red value (0-255).
---@param g number Green value (0-255).
---@param b number Blue value (0-255).
---@param a number Alpha value (0-255).
function campaign_manager:draw_line(x_start_pos, y_start_pos, z_start_pos, x_end_pos, y_end_pos, z_end_pos, duration, r, g, b, a) end

--- Returns true if the unit was involved in the cached pending battle as attacker or defender.
---@param unit_key string unit key
function campaign_manager:pending_battle_cache_unit_key_exists(unit_key) end

--- Registers a function to be called when the ui is created in a new multiplayer game. Be sure not to make any calls to the model from within this callback.
---@param callback function callback
function campaign_manager:add_ui_created_callback_mp_new(callback) end

--- Adds a listener for the FactionTurnStart event which triggers if a faction with the supplied subculture key starts a turn.
---@param listener_name string Name by which this listener can be later cancelled using campaign_manager:remove_faction_turn_start_listener_by_subculture if necessary. It is valid to have multiple listeners with the same name.
---@param subculture_key string Subculture key to watch for, from the subcultures database table.
---@param callback function Callback to call if a faction of the specified subculture starts a turn.
---@param persistent boolean Is this a persistent listener. If this value is false the listener will stop the first time the callback is triggered. If true, the listener will continue until cancelled with campaign_manager:remove_faction_turn_start_listener_by_culture.
function campaign_manager:add_faction_turn_start_listener_by_subculture(listener_name, subculture_key, callback, persistent) end

--- Returns a province object with the supplied province name. If no such province is found then false is returned.
---@param province_name string province name
function campaign_manager:get_province(province_name) end

--- Returns the garrison army from a garrison residence. By default this returns the land army armed citizenry - an optional flag instructs the function to return the naval armed citizenry instead.
---@param garrison_residence GARRISON_RESIDENCE_SCRIPT_INTERFACE Garrison residence.
---@param get_naval boolean Returns the naval armed citizenry army, if set to true.
function campaign_manager:get_armed_citizenry_from_garrison(garrison_residence, get_naval) end

--- Returns the current combined campaign difficulty. This is returned as an integer value by default, or a string if a single true argument is passed in.<br />
--- stringnumbereasy1normal2hard3very hard4legendary5
--- Note that the numbers returned above are different from those returned by the combined_difficulty_level() function on the campaign model.
---@param return_as_string boolean return as string
function campaign_manager:get_difficulty(return_as_string) end

--- Scrolls the camera in a cutscene to the specified settlement in a cutscene. The settlement is specified by region key. Cinematic borders will be shown (unless disabled with campaign_manager:set_use_cinematic_borders_for_automated_cutscenes), the UI hidden, and interaction with the game disabled while the camera is scrolling. The player will be able to skip the cutscene with the ESC key, in which case the camera will jump to the target.
---@param time number Time in seconds over which to scroll.
---@param callback function Optional callback to call when the cutscene ends.
---@param region_key string Key of region containing target settlement.
function campaign_manager:scroll_camera_with_cutscene_to_settlement(time, callback, region_key) end

--- Returns the character within the supplied faction that's closest to the supplied logical co-ordinates. An optional filter function may be supplied which is called for each character in the faction - the function will be passed the character and should return true if the character is eligible to returned.<br />
--- If the is-display-coordinates flag is set then the supplied co-ordinates should be display co-ordinates instead.
---@param faction any Faction specifier. This can be a faction object or a string faction name.
---@param x number Logical x co-ordinate, or Display x co-ordinate if the is-display-coordinates flag is set.
---@param y number Logical y co-ordinate, or Display y co-ordinate if the is-display-coordinates flag is set.
---@param filter function Character filter callback. If supplied, this function will be called for each character in the faction and should return true if the character is to be considered in the results.
function campaign_manager:get_closest_character_from_filter_to_position_from_faction(faction, x, y, filter) end

--- Returns just a table containing the unit keys of a particular attacker in the cached pending battle. The attacker is specified by numerical index, with the first being accessible at record 1.
---@param index_of_attacker number index of attacker
function campaign_manager:pending_battle_cache_get_attacker_units(index_of_attacker) end

--- Returns the camera position which was last cached with the optional cache name (the default cache name is "default"). If no camera cache has been set with the specified name then a script error is generated.
---@param cache_name string cache name
function campaign_manager:get_cached_camera_position(cache_name) end

--- Retuns a numerically-indexed table containing all agent types. Please copy this table instead of writing to it.
function campaign_manager:get_all_agent_types() end

--- Returns true if any faction with a culture corresponding to the supplied key is alive (uses campaign_manager:faction_is_alive).
---@param culture_key string culture key
function campaign_manager:faction_of_culture_is_alive(culture_key) end

--- Registers a function to be called when the advisor VO has finished playing and the AdviceFinishedTrigger event is sent from the game to script. If this event is not received after a duration (default 5 seconds) the function starts actively polling whether the advice audio is still playing, and calls the callback when it finds that it isn't.<br />
--- Only one process invoked by this function may be active at a time.
---@param name string Name for this progress on advice finished process, by which it may be later cancelled if necessary.
---@param callback function Callback to call.
---@param delay number Delay in seconds after the advisor finishes to wait before calling the callback.
---@param playtime number Time in seconds to wait before actively polling whether the advice is still playing. The default value is 5 seconds unless overridden with this parameter. This is useful during development as if no audio has yet been recorded, or if no advice is playing for whatever reason, the function would otherwise continue to monitor until the next time advice is triggered, which is probably not desired.
---@param use_os_clock boolean Use OS clock. Set this to true if the process is going to be running during the end-turn sequence, where the normal flow of model time completely breaks down.
function campaign_manager:progress_on_advice_finished(name, callback, delay, playtime, use_os_clock) end

--- Returns the general within the supplied faction that's closest to the supplied co-ordinates. Logical co-ordinates should be supplied, unless the is-display-coordinates flag is set, in which case display co-ordinates should be provided.
---@param faction any Faction specifier. This can be a faction object or a string faction name.
---@param x number x co-ordinate.
---@param y number y co-ordinate.
---@param include_garrison_commanders boolean Includes garrison commanders in the search results if set to true.
---@param visible_to_faction boolean Sets the function to use display co-ordinates instead of logical co-ordinates.
function campaign_manager:get_closest_general_to_position_from_faction(faction, x, y, include_garrison_commanders, visible_to_faction) end

--- Triggers a dilemma with a specified key and one or more target game objects, preferentially wrapped in an intervention.<br />
--- If calling from within an intervention, force_dilemma_immediately can be specified as true to prevent a nested intervention call. If in multiplayer, the dilemma will never be wrapped in an intervention.<br />
--- The game object or objects to associate the dilemma with are specified by command-queue index. The dilemma will need to pass any conditions set up in the cdir_events_dilemma_option_junctions table in order to trigger.
---@param faction_cqi number Command-queue index of the faction to which the dilemma is issued. This must be supplied.
---@param dilemma_key string Dilemma key, from the dilemmas table.
---@param target_faction_cqi number Command-queue index of a target faction.
---@param secondary_faction_cqi number Command-queue index of a second target faction.
---@param character_cqi number Command-queue index of a target character.
---@param military_force_cqi number Command-queue index of a target military force.
---@param region_cqi number Command-queue index of a target region.
---@param settlement_cqi number Command-queue index of a target settlement.
---@param trigger_callback function Callback to call when the intervention actually gets triggered.
---@param trigger_callback_immediately boolean If true, will not wrap the dilemma in an intervention. If false, will only wrap the dilemma in an intervention if in singleplayer.
function campaign_manager:trigger_dilemma_with_targets(faction_cqi, dilemma_key, target_faction_cqi, secondary_faction_cqi, character_cqi, military_force_cqi, region_cqi, settlement_cqi, trigger_callback, trigger_callback_immediately) end

--- Applies an effect bundle to a region for a number of turns (can be infinite).
---@param effect_bundle_key string Effect bundle key from the effect bundles table.
---@param region_key string Key of the region to add the effect bundle to.
---@param turns number Number of turns to apply the effect bundle for. Supply 0 here to apply the effect bundle indefinitely (it can be removed later with campaign_manager:remove_effect_bundle_from_region if required).
function campaign_manager:apply_effect_bundle_to_region(effect_bundle_key, region_key, turns) end

--- Returns the building chain key for the supplied building key. If no building could be found then nil is returned.
---@param building_key string Building key, from the building_levels database table.
function campaign_manager:building_chain_key_for_building(building_key) end

--- Allows progress when a supplied condition function returns true, either at the point progress_on_event is called or when a specified script event is received. This mechanism allows scripts to progress if either a) a condition is true now or b) it will become true at some later point when an event is received.<br />
--- This function takes a condition callback, an event name, and a target callback. When progress_on_event is called the condition callback is immedidately checked - should it return true, the target callback is called and the function terminates. Should it not return true, a listener is set up for the supplied event - when that event is received, the condition is checked at that time also. The first time the event is received and the condition returns true, the target callback is called.<br />
--- When the event is received, the context for the event will be passed to the condition function. Be mindful that when the condition is first called (at the time that progress_on_event is called) no context object will be supplied, so the condition must cope with a context object being present or not.<br />
--- A name must also be supplied, with which the process may be terminated with campaign_manager:cancel_progress_on_event.
---@param name string Name for this process, by which it may be cancelled.
---@param event string Event to listen for.
---@param condition function Condition callback, which should return true when the target callback should be called.
---@param target function Target callback, which should be called when the condition is true.
---@param First_call_context custom_context, The context used for the initial call to the condition function, while all subsequent contexts come from the specified event. Use custom_context:new() to create a context object similar to the ones provided by regular game events.
function campaign_manager:progress_on_event(name, event, condition, target, First_call_context) end

--- Registers a function to be called when the first tick occurs in a singleplayer game, whether new or loaded from a savegame.
---@param callback function callback
function campaign_manager:add_first_tick_callback_sp_each(callback) end

--- Stops playback of any currently-playing cindy scene. This is a wrapper for the function of the same name on the cinematic interface, but adds debug output.
---@param clear_animation_scenes boolean clear animation scenes
function campaign_manager:stop_cindy_playback(clear_animation_scenes) end

--- Gets the total amount of a pooled resource or pooled resource factor gained by a particular faction. A tracking monitor must be started for the specified faction before this function can be called.<br />
--- If a factor key is specified then the gained value returned relates to the factor for the specified pooled resource. If no factor key is specified, then the total gained for the pooled resource (for all factors) is returned.
---@param faction_key string Key of the faction to query, from the factions database table.
---@param pooled_resource_key string Key of the pooled resource to query, from the pooled_resources database table.
---@param factor_key string Key of the pooled resource factor to query, from the pooled_resource_factors database table.
function campaign_manager:get_total_pooled_resource_gained_for_faction(faction_key, pooled_resource_key, factor_key) end

--- Adds an interactable campaign marker (.bmd prefabs - as defined in the database) to the campaign map at a specified position. The marker comes with an attached hex area trigger. The area will trigger "AreaEntered" and "AreaExited" events when a character enters and exits the trigger.
---@param id string The ID of the interactable campaign marker. Multiple area triggers with the same name will act as a single area trigger.
---@param marker_info_key string The key of the marker to use as defined in the campaign_interactable_marker_infos table of the database.
---@param x number Logical x co-ordinate.
---@param y number Logical y co-ordinate.
---@param radius number Radius of the area trigger (code supports a max of 20).
---@param faction_key string Optional filter for faction (events will only trigger if the character belongs to this faction).
---@param subculture_key string Optional filter for subculture (events will only trigger if the character belongs to this subculture).
function campaign_manager:add_interactable_campaign_marker(id, marker_info_key, x, y, radius, faction_key, subculture_key) end

--- Returns the gold value of attacking forces in the cached pending battle.
function campaign_manager:pending_battle_cache_attacker_value() end

--- Constructs and displays an event. This wraps the cm:show_message_event function of the same name on the underlying episodic_scripting, although it provides input validation, output, whitelisting and a progression callback.
---@param faction_key string Faction key to who the event is targeted.
---@param title_loc_key string Localisation key for the event title. This should be supplied in the full [table]_[field]_[key] localisation format, or can be a blank string.
---@param primary_loc_key string Localisation key for the primary detail of the event. This should be supplied in the full [table]_[field]_[key] localisation format, or can be a blank string.
---@param secondary_loc_key string Localisation key for the secondary detail of the event. This should be supplied in the full [table]_[field]_[key] localisation format, or can be a blank string.
---@param persistent boolean Sets this event to be persistent instead of transient.
---@param index number Index indicating the type of event.
---@param end_callback function Specifies a callback to call when this event is dismissed. Note that if another event message shows first for some reason, this callback will be called early.
---@param callback_delay number Delay in seconds before calling the end callback, if supplied.
---@param dont_whitelist boolean By default this function will whitelist the scripted event message type with campaign_manager:whitelist_event_feed_event_type. Set this flag to true to prevent this.
function campaign_manager:show_message_event(faction_key, title_loc_key, primary_loc_key, secondary_loc_key, persistent, index, end_callback, callback_delay, dont_whitelist) end

--- Removes a listener that was previously added with campaign_manager:add_faction_turn_start_listener_by_subculture. Calling this won't affect other faction turn start listeners.
---@param listener_name string listener name
function campaign_manager:remove_faction_turn_start_listener_by_subculture(listener_name) end

--- Gets a faction object by its string key. If no faction with the supplied key could be found then false is returned.<br />
--- If a faction object is supplied then it is returned directly. This functionality is provided to allow other library functions to be flexible enough to accept a faction or faction key from client code, and use get_faction to convert that faction-or-faction-key into a faction object.
---@param faction_key string Faction key, from the factions database table. Alternatively a faction object may be supplied.
---@param error_if_not_found boolean Generate an error if the faction specifier was a string but no faction with a corresponding key could be found.
function campaign_manager:get_faction(faction_key, error_if_not_found) end

--- Returns true if the supplied faction has any armies in the supplied region, false otherwise.
---@param faction FACTION_SCRIPT_INTERFACE faction
---@param region REGION_SCRIPT_INTERFACE region
function campaign_manager:faction_has_armies_in_region(faction, region) end

--- Removes a callback previously added with campaign_manager:callback or campaign_manager:repeat_callback by name. All callbacks with a name matching that supplied will be cancelled and removed.<br />
--- This function call is passed through to timer_manager:remove_callback - this campaign_manager alias is provided purely for convenience.
---@param name string Name of callback to remove.
function campaign_manager:remove_callback(name) end

--- Returns true if the supplied character has a navy military force, false otherwise.
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_manager:char_has_navy(character) end

--- Calls the supplied callback when the post-battle panel has finished animating on-screen. The function has to poll the panel state repeatedly, so the supplied callback will not be called the exact moment the panel comes to rest. Don't call this unless you know that the panel is about to animate on, otherwise it will be repeatedly polling in the background!<br />
--- Only one such monitor may be active at once.
---@param callback function Callback to call.
---@param delay number Delay in ms after the panel finishes moving before calling the callback.
function campaign_manager:progress_on_post_battle_panel_visible(callback, delay) end

--- Returns the closest character of the supplied subculture to the supplied faction. The subculture and faction are both specified by string key.<br />
--- Use this function sparingly, as it is quite expensive.
---@param faction_key string Faction key, from the factions database table.
---@param subculture_key string Subculture key, from the cultures_subcultures database table.
---@param filter function Filter function. If supplied, this filter function will be called for each potentially-eligible character, with the character being passed in as a single argument. The character will only be considered eligible if the filter function returns true.
function campaign_manager:get_closest_visible_character_of_subculture(faction_key, subculture_key, filter) end

--- Registers a turn countdown event. The supplied script event will be triggered after the specified number of turns has passed, when the FactionTurnStart event is received for the specified faction.
---@param faction_key string Key of the faction on whose turn start the event will be triggered.
---@param turns number Number of turns from now to trigger the event.
---@param event string Event to trigger. By convention, script event names begin with "ScriptEvent"
---@param context_string string Optional context string to trigger with the event.
function campaign_manager:add_turn_countdown_event(faction_key, turns, event, context_string) end

--- Compels the campaign director to trigger a dilemma of a particular type, based on a record from the database. This function is a raw wrapper for the cm:trigger_dilemma function on the game interface, adding debug output and event type whitelisting, but not featuring the intervention-wrapping behaviour of campaign_manager:trigger_dilemma. Use this function if triggering the dilemma from within an intervention, but campaign_manager:trigger_dilemma for all other instances.
---@param faction_key string Faction key, from the factions table.
---@param dilemma_key string Dilemma key, from the dilemmas table.
---@param fire_immediately boolean Fire immediately. If set, the dilemma will fire immediately, otherwise the dilemma will obey any wait period set in the cdir_events_dilemma_options table.
---@param whitelist boolean Supply true here to also whitelist the dilemma event type, so that it displays even if event feed restrictions are in place (see campaign_manager:suppress_all_event_feed_messages and campaign_manager:whitelist_event_feed_event_type).
function campaign_manager:trigger_dilemma_raw(faction_key, dilemma_key, fire_immediately, whitelist) end

--- Instructs the campaign game to save at the next opportunity. An optional completion callback may be supplied.
---@param callback function Completion callback. If supplied, this is called when the save procedure is completed.
---@param lock_afterwards boolean Lock saving functionality after saving is completed.
function campaign_manager:save(callback, lock_afterwards) end

--- Removes a listener that was previously added with campaign_manager:add_faction_turn_start_listener_by_name. Calling this won't affect other faction turn start listeners.
---@param listener_name string listener name
function campaign_manager:remove_faction_turn_start_listener_by_name(listener_name) end

--- Returns true if any of the factions involved in the cached pending battle on either side match the supplied culture.
---@param culture_key string culture key
function campaign_manager:pending_battle_cache_culture_is_involved(culture_key) end

--- Registers a function to be called when the first tick occurs. Callbacks registered with this function will be called regardless of what mode the campaign is being loaded in.
---@param callback function callback
function campaign_manager:add_first_tick_callback(callback) end

--- Returns true if the supplied source character can reach the supplied target character this turn, false otherwise. The underlying test on the model interface returns false-positives if the source character has no action points - this wrapper function works around this problem by testing the source character's action points too.
---@param source_character CHARACTER_SCRIPT_INTERFACE source character
---@param target_character CHARACTER_SCRIPT_INTERFACE target character
function campaign_manager:character_can_reach_character(source_character, target_character) end

--- Returns whether or not the game is loaded and time is ticking.
function campaign_manager:is_game_running() end

--- Returns true if the supplied faction has a home region or any military forces. Note that what constitutes as "alive" for a faction changes between different projects so use with care.
---@param faction_object FACTION_SCRIPT_INTERFACE faction object
function campaign_manager:faction_is_alive(faction_object) end

--- Adds the current campaign's folder to the path, so that the lua files related to this campaign can be loaded with the require command. This function adds the root folder for this campaign based on the campaign name i.e. script/campaign/%campaign_name%/, and also the factions subfolder within this. A name for this campaign must have been set with campaign_manager:new or campaign_manager:set_campaign_name prior to calling this function.
function campaign_manager:require_path_to_campaign_folder() end

--- Loads all lua script files with filenames that contain the supplied string from the target directory. This is used to load in exported files e.g. export_ancillaries.lua, as the asset graph system may create additional files with an extension of this name for each DLC, where needed (e.g. export_ancillaries_dlcxx.lua). The target directory is "script" by default.
---@param filename string Filename subset of script file(s) to load.
---@param path string Path of directory to load script files from, from working data. This should be supplied without leading or trailing "/" separators.
function campaign_manager:load_exported_files(filename, path) end

--- Removes a listener that was previously added with campaign_manager:add_pooled_resource_changed_listener_by_faction.
---@param listener_name string listener name
function campaign_manager:remove_pooled_resource_changed_listener_by_faction(listener_name) end

--- Returns true if the supplied character has a land army military force, false otherwise.
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_manager:char_has_army(character) end

--- Returns the gold value of all of the units in the force.
---@param force_cqi number force cqi
function campaign_manager:force_gold_value(force_cqi) end

--- Returns the region held by a specified faction that has the highest proportion of a specified religion. The numeric religion proportion is also returned.
---@param subject_faction FACTION_SCRIPT_INTERFACE subject faction
---@param religion_key string religion key
function campaign_manager:get_most_pious_region_for_faction_for_religion(subject_faction, religion_key) end

--- Returns true if the supplied faction has any armies in the supplied region, false otherwise.
---@param faction FACTION_SCRIPT_INTERFACE faction
---@param region REGION_SCRIPT_INTERFACE region
function campaign_manager:faction_has_trade_agreement_with_faction(faction, region) end

--- Stops any monitor started by campaign_manager:notify_on_character_movement, by process name.
---@param process_name string process name
function campaign_manager:stop_notify_on_character_movement(process_name) end

--- Cancels any running campaign_manager:progress_on_advice_finished process.
---@param name string Name of the progress on advice finished process to cancel.
function campaign_manager:cancel_progress_on_advice_finished(name) end

--- Registers a callback to be called when the game is being saved. The callback can then save individual values with campaign_manager:save_named_value.
---@param callback function Callback to call. When calling this function the campaign manager passes it a single context argument, which can then be passed through in turn to campaign_manager:save_named_value.
function campaign_manager:add_saving_game_callback(callback) end

--- Creates, starts, and immediately triggers a transient intervention with the supplied paramters. This should trigger immediately unless another intervention is running, in which case it should trigger afterwards.
---@param name string Name for intervention. This should be unique amongst interventions.
---@param callback function Trigger callback to call.
---@param debug boolean Sets the intervention into debug mode, in which it will produce more output. Supply false to suppress this behaviour.
---@param configuration_callback function If supplied, this function will be called with the created intervention supplied as a single argument before the intervention is started. This allows calling script to configure the intervention before being started.
---@param intervention_priority number Priority value of the intervention.
function campaign_manager:trigger_transient_intervention(name, callback, debug, configuration_callback, intervention_priority) end

--- Forceably adds an trait to a character. This wraps the cm:force_add_trait function on the underlying episodic scripting interface, but adds validation and output. This output will be shown in the Lua - Traits debug console spool.
---@param character_string string Character string of the target character, using the standard character string lookup system.
---@param trait_key string Trait key to add.
---@param show_message boolean Show message.
---@param points number Trait points to add. The underlying force_add_trait function is called for each point added.
function campaign_manager:force_add_trait(character_string, trait_key, show_message, points) end

--- Returns true if any of the defending factions in the cached pending battle are of the supplied subculture.
---@param subculture_key string subculture key
function campaign_manager:pending_battle_cache_subculture_is_defender(subculture_key) end

--- Returns true if the supplied military force contains any units of a type contained in the supplied unit type list, false otherwise.
---@param military_force MILITARY_FORCE_SCRIPT_INTERFACE Military force.
---@param unit_type_list table Unit type list. This must be supplied as a numerically indexed table of strings.
function campaign_manager:military_force_contains_unit_type_from_list(military_force, unit_type_list) end

--- Add a callback to be called after the game has been saved. These callbacks are called last in the saving sequence, and only the first time the game is saved after they have been added.
---@param callback function Callback to call. When calling this function the campaign manager passes it a single context argument.
function campaign_manager:add_post_saving_game_callback(callback) end

--- Returns the commander of a military force by the military force's command queue index. If no military force with the supplied cqi is found or it has no commander then false is returned.
---@param military_force_cqi number military force cqi
function campaign_manager:get_character_by_mf_cqi(military_force_cqi) end

--- Stops any running monitor started with campaign_manager:is_character_moving, by character. Note that once the monitor completes (half a second after it was started) it will automatically shut itself down.
---@param cqi number Command-queue-index of the subject character.
function campaign_manager:stop_is_character_moving(cqi) end

--- Constructs and displays a located event. This wraps the cm:show_message_event_located function of the same name on the underlying episodic scripting interface, although it also provides input validation, output, whitelisting and a progression callback.
---@param faction_key string Faction key to who the event is targeted.
---@param title_loc_key string Localisation key for the event title. This should be supplied in the full [table]_[field]_[key] localisation format, or can be a blank string.
---@param primary_loc_key string Localisation key for the primary detail of the event. This should be supplied in the full [table]_[field]_[key] localisation format, or can be a blank string.
---@param secondary_loc_key string Localisation key for the secondary detail of the event. This should be supplied in the full [table]_[field]_[key] localisation format, or can be a blank string.
---@param x number Logical x co-ordinate of event target.
---@param y number Logical y co-ordinate of event target.
---@param persistent boolean Sets this event to be persistent instead of transient.
---@param index number Index indicating the type of event.
---@param end_callback function Specifies a callback to call when this event is dismissed. Note that if another event message shows first for some reason, this callback will be called early.
---@param callback_delay number Delay in seconds before calling the end callback, if supplied.
function campaign_manager:show_message_event_located(faction_key, title_loc_key, primary_loc_key, secondary_loc_key, x, y, persistent, index, end_callback, callback_delay) end

--- Returns the number of units in all military forces in the supplied faction. The optional second parameter, if true, specifies that units in armed citizenry armies should not be considered in the calculation.
---@param faction_object FACTION_SCRIPT_INTERFACE faction object
---@param exclude_armed_citizenry boolean exclude armed citizenry
function campaign_manager:number_of_units_in_faction(faction_object, exclude_armed_citizenry) end

--- Returns true if the supplied garrison residence contains a building with the supplied chain key, false otherwise.
---@param garrison_residence GARRISON_RESIDENCE_SCRIPT_INTERFACE garrison residence
---@param building_chain_key string building chain key
function campaign_manager:garrison_contains_building_chain(garrison_residence, building_chain_key) end

--- Returns true if the supplied character fought in the cached pending battle.
---@param character any Character to query. May be supplied as a character object or as a cqi number.
function campaign_manager:pending_battle_cache_char_is_involved(character) end

--- Returns true if the supplied character is a general with a military force that is a navy, false otherwise.
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_manager:char_is_general_with_navy(character) end

--- Triggers a specific custom mission from its database record key. This mission must be defined in the missions.txt file that accompanies each campaign. This function wraps the cm:trigger_custom_mission function on the game interface, adding debug output and event type whitelisting.
---@param faction_key string Faction key.
---@param mission_key string Mission key, from missions.txt file.
---@param do_not_cancel boolean By default this function cancels this custom mission before issuing it, to avoid multiple copies of the mission existing at once. Supply true here to prevent this behaviour.
---@param whitelist boolean Supply false here to not whitelist the mission event type, so that it does not display if event feed restrictions are in place (see campaign_manager:suppress_all_event_feed_messages and campaign_manager:whitelist_event_feed_event_type).
function campaign_manager:trigger_custom_mission(faction_key, mission_key, do_not_cancel, whitelist) end

--- Adds a listener for the FactionTurnStart event which triggers if a faction with the supplied faction name starts a turn.
---@param listener_name string Name by which this listener can be later cancelled using campaign_manager:remove_faction_turn_start_listener_by_name if necessary. It is valid to have multiple listeners with the same name.
---@param faction_name string Faction name to watch for, from the factions database table.
---@param callback function Callback to call if a faction with the specified name starts a turn.
---@param persistent boolean Is this a persistent listener. If this value is false the listener will stop the first time the callback is triggered. If true, the listener will continue until cancelled with campaign_manager:remove_faction_turn_start_listener_by_name.
function campaign_manager:add_faction_turn_start_listener_by_name(listener_name, faction_name, callback, persistent) end

--- Returns the strongest military force from the specified faction. Nil is returned if the faction contains no military forces.
---@param faction_key string Faction key, from the factions table.
---@param include_garrisons boolean Include garrision armies.
function campaign_manager:get_strongest_military_force_from_faction(faction_key, include_garrisons) end

--- Returns the number of defending armies in the cached pending battle.
function campaign_manager:pending_battle_cache_num_defenders() end

--- Adds a linear sequence configuration. All added linear sequences will be queried when campaign_manager:load_linear_sequence_configuration is called, with one being picked and loaded based on the game state.<br />
--- The name, svr boolean, and tweaker name (where set) of each configuration must be unique compared to other configurations.
---@param name string Script name for this configuration. This must not contain spaces. The name of a saved value which gets saved with the campaign is derived from this name.
---@param filename string Appellation of script file to be passed to campaign_manager:load_local_faction_script (which performs the actual script loading) if this configuration is chosen by campaign_manager:load_linear_sequence_configuration.
---@param svr_bool string Name of a scripted value registry boolean which, if set, causes this configuration to be loaded. When the transition from some other configuration to this configuration is desired, the game scripts should set this boolean value to true with ScriptedValueRegistry:SaveBool. The next time the campaign scripts load and campaign_manager:load_linear_sequence_configuration, this configuration will be chosen. Once chosen in this manner, the svr boolean is set back to false again.
---@param is_default boolean Make this the default configuration if no other is chosen. Only one default configuration may be set.
---@param tweaker string Name of tweaker value which, if set, forces this configuration to be chosen for loading. This is used for debugging scripts and forcing the game to start in a particular configuration.
function campaign_manager:add_linear_sequence_configuration(name, filename, svr_bool, is_default, tweaker) end

--- Returns true if any of the attacking factions in the cached pending battle are of the supplied culture.
---@param culture_key string culture key
function campaign_manager:pending_battle_cache_culture_is_attacker(culture_key) end

--- Returns whether the supplied foreign slot manager is allied to the settlement that it's a part of.
---@param foreign_slot_manager FOREIGN_SLOT_MANAGER_SCRIPT_INTERFACE foreign slot manager
function campaign_manager:is_foreign_slot_manager_allied(foreign_slot_manager) end

--- Returns true if the supplied faction has any armies in the territory of factions it's at war with, false otherwise.
---@param faction FACTION_SCRIPT_INTERFACE faction
function campaign_manager:faction_has_armies_in_enemy_territory(faction) end

--- Returns just the faction name of a particular attacker in the cached pending battle. The attacker is specified by numerical index, with the first being accessible at record 1.
---@param index_of_attacker number index of attacker
function campaign_manager:pending_battle_cache_get_attacker_faction_name(index_of_attacker) end

--- Steal a key, and register a callback to be called when it's pressed. It will be un-stolen when this occurs. cm:steal_user_input will need to be called separately for this mechanism to work, unless it's the escape key that being stolen, where cm:steal_escape_key should be used instead. In this latter case campaign_manager:steal_escape_key_with_callback can be used instead.
---@param name string Unique name for this key-steal entry. This can be used later to release the key with campaign_manager:release_key_with_callback.
---@param key string Key name.
---@param callback function Function to call when the key is pressed.
---@param is_persistent boolean Key should remain stolen after callback is first called.
function campaign_manager:steal_key_with_callback(name, key, callback, is_persistent) end

--- Triggers dilemma with a specified key, based on a record from the database, preferentially wrapped in an intervention. The delivery of the dilemma will be wrapped in an intervention in singleplayer mode, whereas in multiplayer mode the dilemma is triggered directly. It is preferred to use this function to trigger a dilemma, unless the calling script is running from within an intervention in which case campaign_manager:trigger_dilemma_raw should be used.
---@param faction_key string Faction key, from the factions table.
---@param dilemma_key string Dilemma key, from the dilemmas table.
---@param trigger_callback function Callback to call when the intervention actually gets triggered.
function campaign_manager:trigger_dilemma(faction_key, dilemma_key, trigger_callback) end

--- Returns true if any of the factions involved in the cached pending battle on either side were human controlled and belonging to the supplied culture (whether local or not).
function campaign_manager:pending_battle_cache_human_culture_is_involved() end

--- Returns true if the supplied source character can reach the supplied target settlement this turn, false otherwise. The underlying test on the model interface returns false-positives if the source character has no action points - this wrapper function works around this problem by testing the source character's action points too.
---@param source_character CHARACTER_SCRIPT_INTERFACE source character
---@param target_settlement SETTLEMENT_SCRIPT_INTERFACE target settlement
function campaign_manager:character_can_reach_settlement(source_character, target_settlement) end

--- Returns the closest military force from the specified subject faction to a foreign faction. Nil is returned if either faction contains no military forces.
---@param subject_faction_key string Subject faction key, from the factions table.
---@param foreign_faction_key string Foreign faction key, from the factions table.
---@param include_garrisons boolean Include garrison armies from the subject faction.
function campaign_manager:get_closest_military_force_from_faction_to_faction(subject_faction_key, foreign_faction_key, include_garrisons) end

--- Returns the cached culture key of the local human player. If no local faction has been set then a blank string is returned - this should only happen in autoruns.
---@param force_result boolean Force the result to be returned instead of erroring in multiplayer.
function campaign_manager:get_local_faction_culture(force_result) end

--- Starts a new objective chain, with a topic_leader. This function passes its arguments through objectives_manager:activate_objective_chain_with_leader on the objectives manager - see the documentation on that function for more information.
---@param chain_name string Objective chain name.
---@param objective_key string Key of initial objective, from the scripted_objectives table.
---@param number_param_a number First numeric parameter - see the documentation for campaign_manager:set_objective for more details.
---@param number_param_b number Second numeric parameter - see the documentation for campaign_manager:set_objective for more details.
function campaign_manager:activate_objective_chain_with_leader(chain_name, objective_key, number_param_a, number_param_b) end

--- Removes a previously added interactable campaign marker with the specified ID.
---@param id string The ID of the interactable campaign marker to remove.
function campaign_manager:remove_interactable_campaign_marker(id) end

--- Adds a callback to be called when the LoadingGame event is received from the game. This callback will be able to load information from the savegame with campaign_manager:load_named_value. See also campaign_manager:add_saving_game_callback and campaign_manager:save_named_value to save the values that will be loaded here.<br />
--- Note that it is preferable for client scripts to use this function rather than listen for the LoadingGame event themselves as it preserves the ordering of certain setup procedures.
---@param callback function Callback to call. When calling this function the campaign manager passes it a single context argument, which can then be passed through in turn to campaign_manager:load_named_value.
function campaign_manager:add_loading_game_callback(callback) end

--- Returns whether the region with the supplied key is owned by a faction with the supplied name.
---@param region_name string Region name, from the campaign_map_regions database table.
---@param faction_name string Faction name, from the factions database table.
function campaign_manager:is_region_owned_by_faction(region_name, faction_name) end

--- Returns a region data object with the supplied region name. If no such region data is found then false is returned.
---@param region_data_name string region data name
function campaign_manager:get_region_data(region_data_name) end

--- Returns true if the supplied garrison residence contains a building with the supplied superchain key, false otherwise.
---@param garrison_residence GARRISON_RESIDENCE_SCRIPT_INTERFACE garrison residence
---@param building_superchain_key string building superchain key
function campaign_manager:garrison_contains_building_superchain(garrison_residence, building_superchain_key) end

--- Returns a static path to the campaign script folder (currently "data/script/campaign")
function campaign_manager:get_campaign_folder() end

--- Registers a turn coutdown message to trigger on a specified absolute turn. The supplied script message will be triggered when the faction specified starts the supplied turn.<br />
--- See the script_messager documentation for more information about script messages.
---@param faction_key string Key of the faction on whose turn start the event will be triggered.
---@param turns number Number of turns from now to trigger the event.
---@param event string Event to trigger. By convention, script event names begin with "ScriptEvent"
---@param context_string string Optional context string to trigger with the event.
---@param is_narrative_message boolean Sets this message to be a narrative message. If this is set then the context string is actually a faction key, and will be exposed on the context supplied when the message is triggered in the way that the narrative system expects.
function campaign_manager:add_absolute_turn_countdown_message(faction_key, turns, event, context_string, is_narrative_message) end

--- Kills the specified character, with the ability to also destroy their whole force if they are commanding one. The character may be specified by a lookup string or by character cqi.
---@param character_lookup_string string Character string of character to kill. This uses the standard character string lookup system. Alternatively, a number may be supplied, which specifies a character cqi.
---@param destroy_force boolean Will also destroy the characters whole force if true.
function campaign_manager:kill_character(character_lookup_string, destroy_force) end

--- Returns the family member cqi of a particular defender in the cached pending battle. The defender is specified by numerical index, with the first being accessible at record 1.
---@param index_of_defender number index of defender
function campaign_manager:pending_battle_cache_get_defender_fm_cqi(index_of_defender) end

--- Registers a function to be called when the ui is created in a new singleplayer game.
---@param callback function callback
function campaign_manager:add_ui_created_callback_sp_new(callback) end

--- Calls the supplied function after the supplied interval in seconds using a timer synchronised to the campaign model. A string name for the callback may optionally be provided to allow the callback to be cancelled later.<br />
--- This function call is passed through to timer_manager:callback - this campaign_manager alias is provided purely for convenience.
---@param callback_to_call function Callback to call.
---@param interval number Interval in seconds after to which to call the callback.
---@param name string Callback name. If supplied, this callback can be cancelled at a later time (before it triggers) with campaign_manager:remove_callback.
function campaign_manager:callback(callback_to_call, interval, name) end

--- Returns true if the supplied character is a general with a military force that contains at least one embedded agent, false otherwise.
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_manager:char_is_general_with_embedded_agent(character) end

--- Randomly shuffles a table with an implementation of the Fisher-Yates shuffle.<br />
--- Note that, unlike the random_sort and random_sort_copy functions, this modifies the existing table and doesn't destroy the original or create a new table.
---@param table table table
function campaign_manager:shuffle_table(table) end

--- Reports the number of turns until the next turn countdown event matching the supplied criteria will trigger. <br />
--- If a faction key is specified then turn countdown events related to that faction are considered, otherwise turn countdown events related to the start of round are considered.<br />
--- Any combination of script event name and context string must be supplied. Both may be specified, neither, or just one. If more than one matching turn countdown event is found then information about the next one to trigger will be returned. If no matching turn countdown event is found then nil is returned.
---@param faction_key string Faction key, from the factions database table. If no faction key is supplied then countdown events related to the start of round are considered.
---@param event_name string Script event name to filter by.
---@param context_string string Context string to filter by.
function campaign_manager:report_turns_until_countdown_event(faction_key, event_name, context_string) end

--- Adds a listener for the PooledResourceRegularIncome event which triggers if a faction with the supplied key receive a regular income.
---@param listener_name string Name by which this listener can be later cancelled using campaign_manager:remove_pooled_resource_regular_income_listener_by_faction if necessary. It is valid to have multiple listeners with the same name.
---@param faction_name string Faction name to watch for, from the factions database table.
---@param callback function Callback to call if the specified faction experiences a pooled resource change.
---@param persistent boolean Is this a persistent listener. If this value is false the listener will stop the first time the callback is triggered. If true, the listener will continue until cancelled with campaign_manager:remove_pooled_resource_regular_income_listener_by_faction.
function campaign_manager:add_pooled_resource_regular_income_listener_by_faction(listener_name, faction_name, callback, persistent) end

--- Returns the x/y display position of the supplied character.
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_manager:char_display_pos(character) end

--- Returns whether a specified faction can recruit agents, optionally of a type.
---@param faction FACTION_SCRIPT_INTERFACE faction
---@param types table Table of string agent types, from the agents database table.
function campaign_manager:can_recruit_agent(faction, types) end

--- Returns whether any army in a source faction can reach any settlement in a target faction this turn. An optional flag also includes whether the can-reach test should be performed against the target faction's roving armies.
---@param source_faction_specifier FACTION_SCRIPT_INTERFACE Source faction specifier - this can be a faction script interface object, or a string faction key from the factions database table.
---@param target_faction_specifier FACTION_SCRIPT_INTERFACE Target faction specifier - this can be a faction script interface object, or a string faction key from the factions database table.
---@param include_armies boolean Include the movable armies of the target faction in the can-reach test.
function campaign_manager:faction_can_reach_faction(source_faction_specifier, target_faction_specifier, include_armies) end

--- Restricts or unrestricts a faction from constructing one or more building types. 
---@param faction_name string Faction name.
---@param building_list table Numerically-indexed table of string building keys.
---@param should_restrict boolean Set this to true to apply the restriction, false to remove it.
function campaign_manager:restrict_buildings_for_faction(faction_name, building_list, should_restrict) end

--- Returns true if the supplied character was a defender in the cached pending battle.
---@param character any Character to query. May be supplied as a character object or as a cqi number.
function campaign_manager:pending_battle_cache_char_is_defender(character) end

--- Shows subtitled text during a cutscene. The text is displayed until campaign_manager:hide_subtitles is called.
---@param text_key string Text key. By default, this is supplied as a record key from the scripted_subtitles table. Text from anywhere in the database may be shown, however, by supplying the full localisation key and true for the second argument.
---@param full_text_key_supplied boolean Set to true if the fll localised text key was supplied for the first argument in the form [table]_[field]_[key].
---@param force_diplay boolean Forces subtitle display. Setting this to true overrides the player's preferences on subtitle display.
function campaign_manager:show_subtitle(text_key, full_text_key_supplied, force_diplay) end

--- Pass-through function for infotext_manager:remove_infotext. Removes a line of infotext from the infotext panel.
---@param infotext_key string infotext key
function campaign_manager:remove_infotext(infotext_key) end

--- Sets the name of the campaign. This is used for some output, but is mostly used to determine the file path to the campaign script folder which is partially based on the campaign name. If the intention is to use campaign_manager:require_path_to_campaign_folder or campaign_manager:require_path_to_campaign_faction_folder to load in script files from a path based on the campaign name, then a name must be set first. The name may also be supplied to campaign_manager:new when creating the campaign manager.
---@param campaign_name string campaign name
function campaign_manager:set_campaign_name(campaign_name) end

--- Returns whether the specified faction is human.
---@param faction_key string Faction key, from the factions database table.
function campaign_manager:is_faction_human(faction_key) end

--- Returns true if any of the attacking factions involved in the cached pending battle were human controlled (whether local or not).
function campaign_manager:pending_battle_cache_human_is_attacker() end

--- Registers a turn countdown event related to a round, rather than a faction. The supplied script event will be triggered after the specified number of turns has passed, when the WorldStartRound event is received.
---@param turns number Number of turns from now to trigger the event.
---@param event string Event to trigger. By convention, script event names begin with "ScriptEvent"
---@param context_string string Optional context string to trigger with the event.
function campaign_manager:add_round_turn_countdown_event(turns, event, context_string) end

--- Creates a hex based area trigger at a given set of logical co-ordinates with a supplied radius. Faction and subculture filtering is optional. The area will trigger "AreaEntered" and "AreaExited" events when a character enters and exits the trigger.
---@param id string The ID of the area trigger. Multiple area triggers with the same name will act as a single area trigger.
---@param x number Logical x co-ordinate.
---@param y number Logical y co-ordinate.
---@param radius number Radius of the area trigger (code supports a max of 20).
---@param faction_key string Optional filter for faction (events will only trigger if the character belongs to this faction).
---@param subculture_key string Optional filter for subculture (events will only trigger if the character belongs to this subculture).
function campaign_manager:add_hex_area_trigger(id, x, y, radius, faction_key, subculture_key) end

--- Returns whether any factions in the supplied list are human. The faction list should be supplied as a numerically-indexed table of either faction keys or faction script objects.
---@param faction_list table Numerically-indexed table of string faction keys or faction script objects.
---@param tolerate_errors boolean Sets the function to tolerate errors, where it won't throw a script error and return if any of the supplied data is incorrectly formatted.
function campaign_manager:are_any_factions_human(faction_list, tolerate_errors) end

--- Returns true if any faction with a subculture corresponding to the supplied key is alive (uses campaign_manager:faction_is_alive).
---@param subculture_key string subculture key
function campaign_manager:faction_of_subculture_is_alive(subculture_key) end

--- Gets a handle to the campaign_ui_manager (or creates it).
function campaign_manager:get_campaign_ui_manager() end

--- Enables or disables verbose debug output for the advice system. This can be useful as the advice system is difficult to debug using traditional means.
---@param enable_debug_output boolean enable debug output
function campaign_manager:set_advice_debug(enable_debug_output) end

--- Immediately positions the camera at a position looking at the primary military force for the supplied faction. The faction is specified by key.
---@param faction_key string faction key
function campaign_manager:position_camera_at_primary_military_force(faction_key) end

--- Adds a record which modifies or completely overrides a fought or autoresolved battle, if that battle happens within a certain supplied radius of a supplied campaign anchor position. Aspects of the battle may be specified, such as the loading screen and script to use, or the entire battle may be subsituted with an xml battle.<br />
--- If a pending battle sequence is already active, and the battle has been fought, then this call is deferred until after the battle is completed to avoid tampering with the running battle.
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
function campaign_manager:add_custom_battlefield(id, x, y, radius, dump_campaign, loading_screen_override, script_override, whole_battle_override, human_alliance, launch_immediately, is_land_battle, force_autoresolve_result) end

--- Sets up defines common behaviour for intro cutscenes that factions scripts can use invoke of defining their own behaviour manually. In singleplayer mode, an intro cutscene will be started when the loading screen is dismised that will play the supplied cindyscene. In multiplayer mode, the camera is positioned at the default camera position. In both cases the script event ScriptEventIntroCutsceneFinished event is triggered when the sequence completes.
---@param default_camera_position table Default camera position. This should be a lua table containing x, y, d, b and h fields.
---@param cindy_path string Path to cindy scene to play. If no cindy scene is specified then a placeholder non-cindy cutscene will be shown with a duration of 3 seconds.
---@param advice_keys table Table of advice keys that may be played within the cutscene.
---@param end_callback function End callback. If a function is supplied here, it will be called when the intro cutscene ends;
---@param cutscene_configurator function Cutscene configurator callback. If a function is supplied here, it will be called after the intro cutscene is declared but before campaign_cutscene:start is called, and will be passed the campaign_cutscene as a single argument. The function can therefore make configuration calls to the cutscene before it starts. This is useful if nonstandard behaviour for the cutscene is desired.
---@param movie string Pre-cindyscene fullscreen movie to play, if one is desired. This should be a key from the videos table.
---@param hide_faction_leader number Hide the faction leader's character model while the intro cutscene is playing. If the boolean value true is supplied here, or 0, the faction leader's model will be hiddent at the start of the cutscene and unhidden at the end. If a positive number is supplied they will be hidden at the start, and then unhidden that many seconds in to the cutscene (or when the cutscene is skipped, whichever comes first).
function campaign_manager:setup_campaign_intro_cutscene(default_camera_position, cindy_path, advice_keys, end_callback, cutscene_configurator, movie, hide_faction_leader) end

--- Returns whether it's currently the local player's turn.
---@param force_result boolean Force the result to be returned instead of erroring in multiplayer.
function campaign_manager:is_local_players_turn(force_result) end

--- Returns a handle to the game model at any time (after the game has been created). See the Model Hierarchy pages for more information about the game model interface.
function campaign_manager:model() end

--- Cancels a monitor started with campaign_manager:progress_on_panel_dismissed by name.
---@param unique_name string Unique descriptive string name for this process.
function campaign_manager:cancel_progress_on_panel_dismissed(unique_name) end

--- Returns the turn number, including any modifier set with campaign_manager:set_turn_number_modifier
function campaign_manager:turn_number() end

--- Returns the region designated as the province capital, for the supplied region's province.
---@param region REGION_SCRIPT_INTERFACE region
function campaign_manager:get_province_capital_for_region(region) end

--- Checks for a scriptedvalueregistry string with the supplied name, and attempts to apply the health values it contains to the units in the military force specified by the supplied cqi. These svr strings would be set by either campaign_manager:save_army_state_to_svr in campaign or <a href="../battle/script_unit.html#function:script_units:save_state_to_svr">script_units:save_state_to_svr in battle.<br />
--- This is primarily intended to spoof casualties on a campaign army that is coming back from battle, but where the army in battle is not logically related to the army in campaign (such as when loading back from a scripted xml battle).<br />
--- The function returns whether the application was successful. A successful application is one that modifies all units in the military force (a "modification" from 100% health to 100% health would count), unless the allow_partial flag is set, in which case even a partial application would be considered successful. If the application is not successful then no changes are applied. Output is generated in all cases.
---@param name string Name of string saved in the scriptedvalueregistry.
---@param mf_cqi number CQI of military force to apply state to.
---@param allow_partial boolean Allow a partial application of the state string. If this is set to true</code then the application will be successful even if not all units in the military force end up being touched.
function campaign_manager:load_army_state_from_svr(name, mf_cqi, allow_partial) end

--- Saves a string which represents the serialised state of the military force specified by the supplied military force cqi to the scriptedvalueregistry. campaign_manager:serialise_army_state is used to generate the state string, and core:svr_save_string is used to save the string. This string can then be loaded by <a href="../battle/script_unit.html#function:script_units:load_state_from_svr">script_units:load_state_from_svr, allowing scripted battles loaded from a campaign, but not logically related to that campaign (e.g. an xml battle) to spoof the starting state of a battle army to be approximately the same as it was in the campaign.
---@param mf_cqi number mf cqi
---@param name string Name for this svr entry, to be passed to core:svr_save_string.
function campaign_manager:save_army_state_to_svr(mf_cqi, name) end

--- Returns the number of military forces that are not armed-citizenry in the supplied military force list. 
---@param military_force_list MILITARY_FORCE_LIST_SCRIPT_INTERFACE military force list
function campaign_manager:num_mobile_forces_in_force_list(military_force_list) end

--- Scrolls the camera in a cutscene to the specified character in a cutscene. The character is specified by its command queue index (cqi). Cinematic borders will be shown (unless disabled with campaign_manager:set_use_cinematic_borders_for_automated_cutscenes), the UI hidden, and interaction with the game disabled while the camera is scrolling. The player will be able to skip the cutscene with the ESC key, in which case the camera will jump to the target.
---@param time number Time in seconds over which to scroll.
---@param callback function Optional callback to call when the cutscene ends.
---@param cqi number CQI of target character.
function campaign_manager:scroll_camera_with_cutscene_to_character(time, callback, cqi) end

--- Cancels a running monitor started with campaign_manager:progress_on_camera_movement_finished.
function campaign_manager:cancel_progress_on_camera_movement_finished() end

--- Enables movement for the supplied character. Characters are specified by lookup string. This wraps the cm:enable_movement_for_character function on the underlying episodic scripting interface, but adds validation and output.
---@param char_lookup_string string char lookup string
function campaign_manager:enable_movement_for_character(char_lookup_string) end

--- Forceably adds experience to a character. This wraps the cm:add_agent_experience function on the underlying episodic scripting interface, but adds validation and output.
---@param character_string string Character string of the target character, using the standard character string lookup system.
---@param experience number Experience to add.
---@param by_level boolean If set to true, the level/rank can be supplied instead of an exact amount of experience which is looked up from a table in the campaign manager
function campaign_manager:add_agent_experience(character_string, experience, by_level) end

--- Caches the current camera position, so that the camera position may be compared to it later to determine if it has moved. An optional name may be specified for this cache entry so that multiple cache entries may be created. If the camera position was previously cached with the supplied cache name then that cache will be overwritten.
---@param cache_name string cache name
function campaign_manager:cache_camera_position(cache_name) end

--- Draws debug text in the 3D space.
---@param text string Text to write.
---@param x number Display x co-ordinate.
---@param y number Display y co-ordinate.
---@param z number Display z co-ordinate (height).
---@param duration number Duration in seconds to display the text on screen for.
---@param r number Red value (0-255).
---@param g number Green value (0-255).
---@param b number Blue value (0-255).
---@param a number Alpha value (0-255).
function campaign_manager:draw_text(text, x, y, z, duration, r, g, b, a) end

--- Returns the key and value of the highest value corruption in the specified region object. The region may be specified by string key or supplied as a region script interface object. False is returned if no corruption is present.
---@param region any Region script interface or string region key.
function campaign_manager:get_highest_corruption_in_region(region) end

--- Returns the number of units that a specified defender in the cached pending battle took into battle, or will take into battle.
---@param index_of_defender number index of defender
function campaign_manager:pending_battle_cache_num_defender_units(index_of_defender) end

--- Returns true if the faction was involved in the cached pending battle as either attacker or defender.
---@param faction_key string faction key
function campaign_manager:pending_battle_cache_faction_is_involved(faction_key) end

--- Shows a benchmark constructed from supplied parameters if benchmarking mode is active, otherwise calls a supplied callback which should continue the campaign as normal. The intention is for this to be called on or around the first tick, at a critical early point within the benchmark faction's script (each campaign benchmark being associated with a certain faction). If benchmark mode is currently set, this function plays the supplied cindy scene then quits the campaign. If benchmark mode is not set then the supplied callback is called - this should cause the campaign to continue as normal.<br />
--- An initial position for the camera prior to the cindy scene starting may be set with a set of five numerical arguments specifying camera co-ordinates. All five arguments must be supplied for the camera position to be used.<br />
--- A duration for the cindy scene may optionally be set. If a duration is not set then the 
---@param cindy_file function Function to call if this campaign has not been loaded in benchmarking mode.
---@param cam_x string Cindy file to show for the benchmark.
---@param cam_y number Start x position of camera.
---@param cam_d number Start y position of camera.
---@param cam_b number Start distance of camera.
---@param cam_h number Start bearing of camera (in radians).
---@param benchmark_duration number Start height of camera.
function campaign_manager:show_benchmark_if_required(cindy_file, cam_x, cam_y, cam_d, cam_b, cam_h, benchmark_duration) end

--- Creates and returns a campaign manager. If one has already been created it returns the existing campaign manager. Client scripts should not need to call this as it's already called, and a campaign manager set up, within the script libraries. However the script libraries cannot know the name of the campaign, so client scripts will need to set this using campaign_manager:set_campaign_name.
---@param campaign_name string campaign name
function campaign_manager:new(campaign_name) end

--- This fuction starts a listener for hero actions committed against a specified faction and sends out further events based on the outcome of those actions. It is of most use for listening for hero actions committed against a player faction.<br />
--- This function called each time the script starts for the monitors to continue running. Once started, the function triggers the following events:<br />
--- Event NameContext FunctionsDescriptionScriptEventAgentActionSuccessAgainstCharactercharactertarget_characterA foreign agent (character) committed a successful action against a character (target_character) of the subject faction.ScriptEventAgentActionFailureAgainstCharactercharactertarget_characterA foreign agent (character) failed when attempting an action against a character (target_character) of the subject faction.ScriptEventAgentActionSuccessAgainstCharactercharactergarrison_residenceA foreign agent (character) committed a successful action against a garrison residence (garrison_residence) of the subject faction.ScriptEventAgentActionFailureAgainstCharactercharactergarrison_residenceA foreign agent (character) failed when attempting an action against a garrison residence (garrison_residence) of the subject faction.
---@param faction_key string faction key
function campaign_manager:start_hero_action_listener(faction_key) end

--- Randomly sorts a numerically-indexed table. This is safe to use in multiplayer, and will preserve the original table, but it is slower than campaign_manager:random_sort as it copies the table first.<br />
--- Note that records in the source table that are not arranged in an ascending numerical index will not be copied (they will not be deleted, however).
function campaign_manager:random_sort_copy() end

--- Disables movement for the supplied faction. This wraps the cm:disable_movement_for_faction function on the underlying episodic scripting interface, but adds validation and output.
---@param faction_key string faction key
function campaign_manager:disable_movement_for_faction(faction_key) end

--- Returns true if any of the defending factions involved in the cached pending battle were human controlled (whether local or not).
function campaign_manager:pending_battle_cache_human_is_defender() end

--- Teleports a character to a logical position on the campaign map. This function is a wrapper for the cm:teleport_to function on the underlying episodic scripting interface. This wrapper adds debug output and argument validation.<br />
--- This function can also reposition the camera, so it's best used on game creation to move characters around at the start of the campaign, rather than on the first tick or later.
---@param character_string string Character string of character to teleport. This uses the standard character string lookup system.
---@param x number Logical x co-ordinate to teleport to.
---@param y number Logical y co-ordinate to teleport to.
function campaign_manager:teleport_to(character_string, x, y) end

--- Starts a monitor for a faction which, on turn start for that faction, triggers a event with the faction and the region they control with the lowest public order attached. This is useful for advice scripts that may wish to know where the biggest public order problems for a faction are. This function will need to be called by client scripts each time the script starts.<br />
--- The event triggered is ScriptEventFactionTurnStartLowestPublicOrder, and the faction and region may be returned by calling faction() and region() on the context object supplied with it.
---@param faction_key string faction key
function campaign_manager:find_lowest_public_order_region_on_turn_start(faction_key) end

--- Stops a running region change monitor for a faction.
---@param faction_key string faction key
function campaign_manager:stop_faction_region_change_monitor(faction_key) end

--- Returns true if the pending battle has been won by the defender, false otherwise.
function campaign_manager:pending_battle_cache_defender_victory() end

--- Calls the supplied callback when a battle sequence is fully completed. A battle sequence is completed once the pre or post-battle panel has been dismissed and any subsequent camera animations have finished. This mechanism should now work in multiplayer.
---@param name string Unique name for this monitor. Multiple such monitors may be active at once.
---@param callback function Callback to call.
---@param delay number Delay in ms after the battle sequence is completed before calling the callback.
function campaign_manager:progress_on_battle_completed(name, callback, delay) end

--- Returns the total value of all corruption types in the specified region object. It may also be supplied a region key in place of a region object.
---@param region_or_region_key any region or region key
function campaign_manager:get_total_corruption_value_in_region(region_or_region_key) end

--- Registers a function to be called when the ui is created in any multiplayer game. Be sure not to make any calls to the model from within this callback.
---@param callback function callback
function campaign_manager:add_ui_created_callback_mp_each(callback) end

--- Returns the Time of Legends campaign key. If the current campaign is not a Time of Legends campaign, then nil is returned.
function campaign_manager:tol_campaign_key() end

--- Returns the name of the campaign.
function campaign_manager:get_campaign_name() end

--- Returns true if the supplied military force was a defender in the cached pending battle.
---@param cqi number Command-queue-index of the military force to query.
function campaign_manager:pending_battle_cache_mf_is_defender(cqi) end

--- Returns the average strength of all units in the military force. This is expressed as a percentage (0-100), so a returned value of 75 would indicate that the military force had lost 25% of its strength through casualties.
---@param military_force MILITARY_FORCE_SCRIPT_INTERFACE military force
function campaign_manager:military_force_average_strength(military_force) end

--- Removes all custom battle overrides previously set with cm:add_custom_battlefield.<br />
--- If a pending battle sequence is already active, and the battle has been fought, then this call is deferred until after the battle is completed to avoid tampering with the running battle.
function campaign_manager:clear_custom_battlefields() end

--- Returns records relating to a particular attacker in the cached pending battle. The attacker is specified by numerical index, with the first being accessible at record 1. This function returns the cqi of the commanding character, the cqi of the military force, and the faction name.<br />
--- To get records of the units related to an attacker, use campaign_manager:pending_battle_cache_num_attacker_units and campaign_manager:pending_battle_cache_get_attacker_unit.
---@param index_of_attacker number index of attacker
function campaign_manager:pending_battle_cache_get_attacker(index_of_attacker) end

--- Removes a custom battle override previously set with cm:add_custom_battlefield.<br />
--- If a pending battle sequence is already active, and the battle has been fought, then this call is deferred until after the battle is completed to avoid tampering with the running battle.
---@param id string id
function campaign_manager:remove_custom_battlefield(id) end

--- Returns true if the faction was an attacker (primary or reinforcing) in the cached pending battle.
---@param faction_key string faction key
function campaign_manager:pending_battle_cache_faction_is_attacker(faction_key) end

--- Registers a turn countdown script message. The supplied script message will be triggered after the specified number of turns has passed, when the FactionTurnStart event is received for the specified faction.<br />
--- See the script_messager documentation for more information about script messages.
---@param faction_key string Key of the faction on whose turn start the event will be triggered, from the factions database table.
---@param turns number Number of turns from now to trigger the event.
---@param message string Message to trigger.
---@param context_string string Optional context string to trigger with the event.
---@param is_narrative_message boolean Sets this message to be a narrative message. If this is set then the context string is actually a faction key, and will be exposed on the context supplied when the message is triggered in the way that the narrative system expects.
function campaign_manager:add_turn_countdown_message(faction_key, turns, message, context_string, is_narrative_message) end

--- Returns whether the advice history indicates that a specific help page has been viewed by the player.
---@param help_page_name string help page name
function campaign_manager:help_page_seen(help_page_name) end

--- Registers a turn coutdown event to trigger on a specified absolute turn. The supplied script event will be triggered when the faction specified starts the supplied turn. If no faction is specified, the script event is triggered when the round starts for the supplied turn.
---@param faction_key string Key of the faction on whose turn start the event will be triggered, from the factions database table. If no faction key is specified the event will be triggered when the round starts.
---@param turns number Number of turns from now to trigger the event.
---@param event string Event to trigger. By convention, script event names begin with "ScriptEvent"
---@param context_string string Optional context string to trigger with the event.
function campaign_manager:add_absolute_turn_countdown_event(faction_key, turns, event, context_string) end

--- Instructs the campaign director to attempt to trigger a specified incident, based on record from the database. The incident will be triggered if its conditions, defined in the cdir_events_incident_option_junctions, pass successfully. The function returns whether the incident was successfully triggered or not.<br />
--- This function wraps the cm:trigger_incident function on the game interface, adding debug output and event type whitelisting.
---@param faction_key string Faction key.
---@param incident_key string Incident key, from the incidents table.
---@param fire_immediately boolean Fire immediately - if this is set, then any turn delay for the incident set in the cdir_event_incident_option_junctions table will be disregarded.
---@param whitelist boolean Supply true here to also whitelist the dilemma event type, so that it displays even if event feed restrictions are in place (see campaign_manager:suppress_all_event_feed_messages and campaign_manager:whitelist_event_feed_event_type).
function campaign_manager:trigger_incident(faction_key, incident_key, fire_immediately, whitelist) end

--- Registers a turn countdown event with campaign_manager:add_turn_countdown_event when the supplied trigger event is received by script. Note that while the turn countdown event is saved into the savegame when triggered, the trigger event listener is not, so it will need to be re-established on script load.
---@param trigger_event string Trigger event. When this event is received by script, the turn countdown event will be registered. If this is nil or a blank string then the turn countdown event is registered immediately.
---@param condition function Condition that must be met when the trigger event is received, for the turn countdown event to be registered. If the value specified is true then no conditional check is performed and the turn countdown event will be registered as soon as the trigger event is received.
---@param faction_key string Key of the faction on whose turn start the event will be triggered.
---@param turns number Number of turns from now to trigger the event.
---@param event string Event to trigger. By convention, script event names begin with "ScriptEvent"
---@param context_string string Optional context string to trigger with the event.
function campaign_manager:add_turn_countdown_event_on_event(trigger_event, condition, faction_key, turns, event, context_string) end

--- Awards an achievement by string key. This function calls the equivalent function on the episodic scripting interface, adding output and argument-checking.
---@param achievement_key string Achievement key, from the achievements database table.
function campaign_manager:award_achievement(achievement_key) end

--- Returns whether it's currently the turn of any human-controlled faction.
function campaign_manager:is_human_factions_turn() end

--- Returns the most recently-created character of a specified type and/or subtype for a given faction. This function makes the assumption that the character with the highest command-queue-index value is the most recently-created.
---@param faction_key string Faction specifier supply either a string faction key, from the factions database table, or a faction script interface.
---@param type string Character type. If no type is specified then all character types match.
---@param subtype string Character subtype. If no subtype is specified then all character subtypes match.
function campaign_manager:get_most_recently_created_character_of_type(faction_key, type, subtype) end

--- Disables event feed events by category, subcategory or individual event type. Unlike campaign_manager:suppress_all_event_feed_messages the events this call blocks are discarded. Use this function to prevent certain events from appearing.<br />
--- The function wraps the cm:disable_event_feed_events function on the underlying episodic scripting interface.
---@param should_disable boolean Should disable event type(s).
---@param event_categories string Event categories to disable. Event categories are listed in the event_feed_categories database table. Additionally, supply "" or false/nil to not suppress by category in this function call. Supply "all" to disable all event types.
---@param event_subcategories string Event subcategories to disable. Event subcategories are listed in the event_feed_subcategories database table. Supply "" or false/nil to not suppress by subcategory in this function call.
---@param event string Event to disable, from the event_feed_events database table. Supply "" or false/nil to not supress by events in this function call.
function campaign_manager:disable_event_feed_events(should_disable, event_categories, event_subcategories, event) end

--- While suppression has been activated with campaign_manager:suppress_all_event_feed_messages an event type may be whitelisted and allowed to be shown with this function. This allows scripts to hold all event messages from being displayed except those of a certain type. This is useful for advice scripts which may want to talk about those messages, for example.<br />
--- If event feed suppression is not active then calling this function will have no effect.
---@param event_type string Event type to whitelist. This is compound key from the event_feed_targeted_events table, which is the event field and the target field of a record from this table, concatenated together.
function campaign_manager:whitelist_event_feed_event_type(event_type) end

--- Suppresses or unsuppresses all event feed message from being displayed. With this suppression in place, event panels won't be shown on the UI at all but will be queued and then shown when the suppression is removed. The suppression must not be kept on during the end-turn sequence.<br />
--- When suppressing, we whitelist dilemmas as they lock the model, and also mission succeeded event types as the game tends to flow better this way.
---@param activate_suppression boolean activate suppression
function campaign_manager:suppress_all_event_feed_messages(activate_suppression) end

--- Returns the garrison commander character of the settlement in the supplied region. If no garrison commander can be found then nil is returned.
---@param region_object REGION_SCRIPT_INTERFACE region object
function campaign_manager:get_garrison_commander_of_region(region_object) end

--- Called by the campaign model when a key stolen by steal_user_input or steal_escape_key is pressed. Client scripts should not call this!
---@param key_pressed string key pressed
function campaign_manager:on_key_press_up(key_pressed) end

--- Steals or un-steals user input if the supplied script event is received, optionally with the specified condition. This function calls cm:steal_user_input().
---@param should_steal boolean Should steal user input or not.
---@param event string Event to listen for.
---@param condition function Event condition that must return true for the user input action to take place.
---@param delay number Delay in seconds before user input is stolen. Will sometimes need a slight delay after an event.
---@param listener_name string Optional name for the listener.
function campaign_manager:steal_user_input_on_event(should_steal, event, condition, delay, listener_name) end

--- Returns the general character stood at the supplied position, regardless of faction. Garrison commanders are not returned.
---@param x number Logical x co-ordinate.
---@param y number Logical y co-ordinate.
function campaign_manager:get_general_at_position_all_factions(x, y) end

--- Converts a set of display co-ordinates into logical co-ordinates.
---@param x number Display x co-ordinate.
---@param y number Display y co-ordinate.
function campaign_manager:dis_to_log(x, y) end

--- Directly triggers a dilemma with a specified key and one or more target game objects. This function is a raw wrapper for the cm:trigger_dilemma_with_targets function on the game interface, adding debug output and event type whitelisting, but not featuring the intervention-wrapping behaviour of trigger_dilemma_with_targets_internal.<br />
--- The game object or objects to associate the dilemma with are specified by command-queue index. The dilemma will need to pass any conditions set up in the cdir_events_dilemma_option_junctions table in order to trigger.<br />
--- Some parameters are mutually exclusive: for example, either character_cqi or family_member_cqi may be specified, but not both.
---@param faction_cqi number Command-queue index of the faction to which the dilemma is issued. This must be supplied.
---@param dilemma_key string Dilemma key, from the dilemmas table.
---@param target_faction_cqi number Command-queue index of a target faction.
---@param secondary_faction_cqi number Command-queue index of a second target faction.
---@param character_cqi number Command-queue index of a target character.
---@param family_member_cqi number Command-queue index of a target settlement.
---@param military_force_cqi number Command-queue index of a target military force.
---@param region_cqi number Command-queue index of a target region.
---@param settlement_cqi number Command-queue index of a target settlement.
---@param trigger_callback function Callback to call when the intervention actually gets triggered.
---@param whitelist boolean Allows the dilemma to bypass event supression.
function campaign_manager:trigger_dilemma_with_targets_raw(faction_cqi, dilemma_key, target_faction_cqi, secondary_faction_cqi, character_cqi, family_member_cqi, military_force_cqi, region_cqi, settlement_cqi, trigger_callback, whitelist) end

--- Triggers a dilemma with a specified key and one or more target game objects, including a family member CQI instead of a character CQI (since this should remain constant between character deaths and revivals), preferentially wrapped in an intervention.<br />
--- If calling from within an intervention, force_dilemma_immediately can be specified as true to prevent a nested intervention call. If in multiplayer, the dilemma will never be wrapped in an intervention.<br />
--- The game object or objects to associate the dilemma with are specified by command-queue index. The dilemma will need to pass any conditions set up in the cdir_events_dilemma_option_junctions table in order to trigger.
---@param faction_cqi number Command-queue index of the faction to which the dilemma is issued. This must be supplied.
---@param dilemma_key string Dilemma key, from the dilemmas table.
---@param target_faction_cqi number Command-queue index of a target faction.
---@param secondary_faction_cqi number Command-queue index of a second target faction.
---@param family_member_cqi number Command-queue index of a target character's family member interface.
---@param military_force_cqi number Command-queue index of a target military force.
---@param region_cqi number Command-queue index of a target region.
---@param settlement_cqi number Command-queue index of a target settlement.
---@param trigger_callback function Callback to call when the intervention actually gets triggered.
---@param trigger_callback_immediately boolean If true, will not wrap the dilemma in an intervention. If false, will only wrap the dilemma in an intervention if in singleplayer.
function campaign_manager:trigger_dilemma_with_targets_and_family_member(faction_cqi, dilemma_key, target_faction_cqi, secondary_faction_cqi, family_member_cqi, military_force_cqi, region_cqi, settlement_cqi, trigger_callback, trigger_callback_immediately) end

--- Sets whether or not to show cinematic borders when scrolling the camera in an automated cutscene (for example with campaign_manager:scroll_camera_with_cutscene). By default, cinematic borders are displayed.
---@param show_borders boolean show borders
function campaign_manager:set_use_cinematic_borders_for_automated_cutscenes(show_borders) end

--- Returns true if the supplied character is a general that has been victorious (when?), false otherwise.
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_manager:char_is_victorious_general(character) end

--- Lifts the shroud on all regions. This may be useful for cutscenes in general and benchmarks in-particular.
function campaign_manager:lift_all_shroud() end

--- Enables or disables the advice system.
---@param enable_advice boolean enable advice
function campaign_manager:set_advice_enabled(enable_advice) end

--- Removes a scripted objective from the scripted objectives panel. This function passes its arguments through objectives_manager:remove_objective on the objectives manager - see the documentation on that function for more information.
---@param objective_key string Objective key, from the scripted_objectives table.
function campaign_manager:remove_objective(objective_key) end

--- Picks a configuration previously added with campaign_manager:add_linear_sequence_configuration and loads it, based on certain values:<br />
--- The function first looks at svr boolean values for each configuration. If one is set then that configuration is chosen, and the boolean is set back to false. These booleans should be individually set to true by client scripts when they wish to transition from loading scripts in one configuration to another.<br />
--- If no svr boolean is set and it's a new game, the function checks the value of the tweaker specified by each configuration. If any tweaker is set then that configuration is loaded.<br />
--- If no svr boolean is set and it's a not a new game, the function checks to see if a saved value exists corresponding to any configuration. If one is found then that configuration is loaded.<br />
--- If no configuration has been loaded so far then a registry value derived from the name of each configuration is checked, which would indicate that the handler has been forceably reset. If any configuration matches then that configuration is loaded.<br />
--- If still no configuration has been loaded then all configurations are checked to see if there's a default. If there is a default configuration then it is loaded.
function campaign_manager:load_linear_sequence_configuration() end

--- Adds one or more lines of infotext simultaneously to the infotext panel, with a topic_leader. This function passes through to infotext_manager:add_infotext_simultaneously_with_leader - see the documentation on the infotext_manager page for more details.
---@param first_param any Can be a string key from the advice_info_texts table, or a number specifying an initial delay in ms after the panel animates onscreen and the first infotext item is shown.
---@vararg any
function campaign_manager:add_infotext_simultaneously_with_leader(first_param, additional_infotext_strings) end

--- Retrieves a value saved using the saved value system. Values saved using campaign_manager:set_saved_value are added to an internal register within the campaign manager, and are automatically saved and loaded with the game, so there is no need to register callbacks with campaign_manager:add_loading_game_callback or campaign_manager:add_saving_game_callback. Once saved with campaign_manager:set_saved_value, values can be accessed with this function.<br />
--- Values are stored and accessed by a string name. Values can be booleans, numbers or strings.
---@param value_name string value name
function campaign_manager:get_saved_value(value_name) end

--- Adds one or more lines of infotext simultaneously to the infotext panel. This function passes through to infotext_manager:add_infotext_simultaneously - see the documentation on the infotext_manager page for more details.
---@param first_param any Can be a string key from the advice_info_texts table, or a number specifying an initial delay in ms after the panel animates onscreen and the first infotext item is shown.
---@vararg any
function campaign_manager:add_infotext_simultaneously(first_param, additional_infotext_strings) end

--- Enables or disables the ability of the player to hide the UI.
---@param enable_hiding boolean enable hiding
function campaign_manager:enable_ui_hiding(enable_hiding) end

--- Applies an effect bundle to a military force by cqi for a number of turns (can be infinite).
---@param effect_bundle_key string Effect bundle key from the effect bundles table.
---@param number_cqi string Command queue index of the military force to apply the effect bundle to.
---@param turns number Number of turns to apply the effect bundle for. Supply 0 here to apply the effect bundle indefinitely (it can be removed later with campaign_manager:remove_effect_bundle_from_force if required).
function campaign_manager:apply_effect_bundle_to_force(effect_bundle_key, number_cqi, turns) end

--- Sets a value to be saved using the saved value system. Values saved using this function are added to an internal register within the campaign manager, and are automatically saved and loaded with the game, so there is no need to register callbacks with campaign_manager:add_loading_game_callback or campaign_manager:add_saving_game_callback. Once saved with this function, the value can be accessed at any time with campaign_manager:get_saved_value.<br />
--- Values are stored and accessed by a string name. Values can be of type boolean, number, string or table, where that table itself contains only booleans, numbers, string or other tables. Repeated calls to set_saved_value with the same name are legal, and will just overwrite the value of the value stored with the supplied name.
---@param value_name string Value name.
---@param value any Value. Can be a boolean, number, string or table.
function campaign_manager:set_saved_value(value_name, value) end

--- Adds one or more lines of infotext to the infotext panel, with a topic_leader. This function passes through to infotext_manager:add_infotext_with_leader - see the documentation on the infotext_manager page for more details.
---@param first_param any Can be a string key from the advice_info_texts table, or a number specifying an initial delay in ms after the panel animates onscreen and the first infotext item is shown.
---@vararg any
function campaign_manager:add_infotext_with_leader(first_param, additional_infotext_strings) end

--- Returns the value of the key specified corruption in the specified region object. It may also be supplied a region key in place of a region object.
---@param region_or_region_key any region or region key
---@param corruption_pooled_resource_key string corruption pooled resource key
function campaign_manager:get_corruption_value_in_region(region_or_region_key, corruption_pooled_resource_key) end

--- Steals the escape key and spacebar and registers a function to call when they are pressed.
---@param name string Unique name for this key-steal entry.
---@param callback function Function to call when one of the keys are pressed.
---@param is_persistent boolean Keys should remain stolen after callback is first called.
function campaign_manager:steal_escape_key_and_space_bar_with_callback(name, callback, is_persistent) end

--- Returns the display position of a supplied settlement by string name.
---@param settlement_name string settlement name
function campaign_manager:settlement_display_pos(settlement_name) end

--- RegionRebels events are sent as a faction ends their turn but before the FactionTurnEnd event is received. If called, this function listens for RegionRebels events for the specified faction, then waits for the FactionTurnEnd event to be received and sends a separate event. This flow of events works better for advice scripts.<br />
--- The event triggered is ScriptEventRegionRebels, and the faction and region may be returned by calling faction() and region() on the context object supplied with it.
---@param faction_key string faction key
function campaign_manager:generate_region_rebels_event_for_faction(faction_key) end

--- Cancels any running campaign_manager:progress_on_advice_dismissed process.
---@param name string Name of the progress on advice dismissed process to cancel.
function campaign_manager:cancel_progress_on_advice_dismissed(name) end

--- Adds a listener for the PooledResourceChanged event which triggers if a faction with the supplied key experiences a change in a pooled resource value.
---@param listener_name string Name by which this listener can be later cancelled using campaign_manager:remove_pooled_resource_changed_listener_by_faction if necessary. It is valid to have multiple listeners with the same name.
---@param faction_name string Faction name to watch for, from the factions database table.
---@param callback function Callback to call if the specified faction experiences a pooled resource change.
---@param persistent boolean Is this a persistent listener. If this value is false the listener will stop the first time the callback is triggered. If true, the listener will continue until cancelled with campaign_manager:remove_pooled_resource_changed_listener_by_faction.
function campaign_manager:add_pooled_resource_changed_listener_by_faction(listener_name, faction_name, callback, persistent) end

--- Resets an objective chain so that it may be called again. This function passes its arguments through objectives_manager:reset_objective_chain on the objectives manager - see the documentation on that function for more information.
---@param chain_name string Objective chain name.
function campaign_manager:reset_objective_chain(chain_name) end

--- Ends an existing objective chain. This function passes its arguments through objectives_manager:end_objective_chain on the objectives manager - see the documentation on that function for more information.
---@param chain_name string Objective chain name.
function campaign_manager:end_objective_chain(chain_name) end

--- Returns a handle to the raw episodic scripting interface. Generally it's not necessary to call this function, as calls made on the campaign manager which the campaign manager doesn't itself provide are passed through to the episodic scripting interface, but a direct handle to the episodic scripting interface may be sought with this function if speed of repeated access.
function campaign_manager:get_game_interface() end

--- Returns true if the character is a general at the head of a moveable army (not a garrison), false otherwise.
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_manager:character_is_army_commander(character) end

--- Calls the supplied callback as soon as a character is determined to be stationary. This uses campaign_manager:is_character_moving to determine if the character moving so the callback will not be called the instant the character halts.
---@param cqi number Command-queue-index of the subject character.
---@param callback function Callback to call.
---@param must_move_first boolean If true, the character must be seen to be moving before this monitor will begin. In this case, it will only call the callback once the character has stopped again.
function campaign_manager:notify_on_character_halt(cqi, callback, must_move_first) end

--- Marks a scripted objective as failed for the player to see. Note that it will remain on the scripted objectives panel until removed with campaign_manager:remove_objective. This function passes its arguments through objectives_manager:fail_objective on the objectives manager - see the documentation on that function for more information.
---@param objective_key string Objective key, from the scripted_objectives table.
function campaign_manager:fail_objective(objective_key) end

--- Releases the escape key after it's been stolen with campaign_manager:steal_escape_key_with_callback.
---@param name string Unique name for this key-steal entry.
function campaign_manager:release_escape_key_with_callback(name) end

--- Returns true if any of the factions involved in the cached pending battle on either side match the supplied subculture.
---@param subculture_key string subculture key
function campaign_manager:pending_battle_cache_subculture_is_involved(subculture_key) end

--- Sets up a scripted objective for the player which appears in the scripted objectives panel, with a topic_leader. This objective can then be updated, removed, or marked as completed or failed by the script at a later time.<br />
--- A key to the scripted_objectives table must be supplied with set_objective, and optionally one or two numeric parameters to show some running count related to the objective. To update these parameter values later, set_objective may be re-called with the same objective key and updated values.<br />
--- This function passes its arguments through objectives_manager:set_objective_with_leader on the objectives manager - see the documentation on that function for more information.
---@param objective_key string Objective key, from the scripted_objectives table.
---@param param_a number First numeric objective parameter. If set, the objective will be presented to the player in the form [objective text]: [param a]. Useful for showing a running count of something related to the objective.
---@param param_b number Second numeric objective parameter. A value for the first must be set if this is used. If set, the objective will be presented to the player in the form [objective text]: [param a] / [param b]. Useful for showing a running count of something related to the objective.
---@param callback function Optional callback to call when the objective is shown.
function campaign_manager:set_objective_with_leader(objective_key, param_a, param_b, callback) end

--- Steals or un-steals the escape key if the supplied script event is received, optionally with the specified condition. This function calls cm:steal_escape_key.
---@param should_steal boolean Should steal the escape key or not.
---@param event string Event to listen for.
---@param condition function Event condition that must return true for the key steal action to take place.
---@param delay number Delay in seconds before key is stolen. Will sometimes need a slight delay after an event.
---@param listener_name string Optional name for the listener.
function campaign_manager:steal_escape_key_on_event(should_steal, event, condition, delay, listener_name) end

--- Sets up a scripted objective for the player, which appears in the scripted objectives panel. This objective can then be updated, removed, or marked as completed or failed by the script at a later time.<br />
--- A key to the scripted_objectives table must be supplied with set_objective, and optionally one or two numeric parameters to show some running count related to the objective. To update these parameter values later, set_objective may be re-called with the same objective key and updated values.<br />
--- This function passes its arguments through objectives_manager:set_objective on the objectives manager - see the documentation on that function for more information.
---@param objective_key string Objective key, from the scripted_objectives table.
---@param param_a number First numeric objective parameter. If set, the objective will be presented to the player in the form [objective text]: [param a]. Useful for showing a running count of something related to the objective.
---@param param_b number Second numeric objective parameter. A value for the first must be set if this is used. If set, the objective will be presented to the player in the form [objective text]: [param a] / [param b]. Useful for showing a running count of something related to the objective.
function campaign_manager:set_objective(objective_key, param_a, param_b) end

--- Grants one or more units, specified by string key(s), to a military force by character lookup. The military force is specified by its faction key and logical co-ordinates.
---@param faction_key string Faction key.
---@param x number Logical x co-ordinate.
---@param y number Logical y co-ordinate.
---@vararg any
function campaign_manager:grant_units_to_character_by_position_from_faction(faction_key, x, y, units) end

--- Debug output of all current stolen key records.
function campaign_manager:print_key_steal_entries() end

--- Returns the number of units that a specified attacker in the cached pending battle took into battle, or will take into battle.
---@param index_of_attacker number index of attacker
function campaign_manager:pending_battle_cache_num_attacker_units(index_of_attacker) end

--- Starts a pooled resource tracking monitor for the supplied faction. <br />
--- A pooled resource tracking monitor for a faction should only be started once per campaign. Once started, tracking monitors will save themselves in to the savegame and then automatically restart on load.
---@param faction_key string Key of the faction to track, from the factions database table.
function campaign_manager:start_pooled_resource_tracker_for_faction(faction_key) end

--- Registers a function to be called when the first tick occurs in a new singleplayer game.
---@param callback function callback
function campaign_manager:add_first_tick_callback_sp_new(callback) end

--- Returns a table of cqis of characters that are both at war with the specified faction and also trespassing on its territory.
---@param faction_object FACTION_SCRIPT_INTERFACE faction object
function campaign_manager:get_trespasser_list_for_faction(faction_object) end

--- Enables or disables all diplomatic options between all factions.
---@param enable_diplomacy boolean enable diplomacy
function campaign_manager:enable_all_diplomacy(enable_diplomacy) end

--- Restricts or unrestricts certain types of diplomacy between factions or groups of factions. Groups of factions may be specified with the strings "all", "faction:faction_key", "subculture:subculture_key" or "culture:culture_key". A source and target faction/group of factions must be specified.<br />
--- Note that this wraps the function cm:force_diplomacy_new on the underlying episodic scripting interface.
---@param source string Source faction/factions identifier.
---@param target string Target faction/factions identifier.
---@param type string Type of diplomacy to restrict. See the documentation for the Diplomacy section for available diplomacy types.
---@param can_offer boolean Can offer - set to false to prevent the source faction(s) from being able to offer this diplomacy type to the target faction(s).
---@param can_accept boolean Can accept - set to false to prevent the target faction(s) from being able to accept this diplomacy type from the source faction(s).
---@param directions both Causes this function to apply the same restriction from target to source as from source to target.
---@param not_enable_payments do The AI code assumes that the "payments" diplomatic option is always available, and by default this function keeps payments available, even if told to restrict it. Set this flag to true to forceably restrict payments, but this may cause crashes.
function campaign_manager:force_diplomacy(source, target, type, can_offer, can_accept, directions, not_enable_payments) end

--- Instructs the campaign director to attempt to trigger a mission of a particular type, based on a mission record from the database. The mission will be triggered if its conditions, defined in the cdir_events_mission_option_junctions, pass successfully. The function returns whether the mission was successfully triggered or not. Note that if the command is sent via the command queue then true will always be returned, regardless of whether the mission successfully triggers.<br />
--- This function wraps the cm:trigger_mission function on the game interface, adding debug output and event type whitelisting.
---@param faction_key string Faction key.
---@param mission_key string Mission key, from the missions table.
---@param fire_immediately boolean Fire immediately - if this is set, then any turn delay for the mission set in the cdir_event_mission_option_junctions table will be disregarded.
---@param whitelist boolean Supply false here to not whitelist the mission event type, so that it does not display if event feed restrictions are in place (see campaign_manager:suppress_all_event_feed_messages and campaign_manager:whitelist_event_feed_event_type).
function campaign_manager:trigger_mission(faction_key, mission_key, fire_immediately, whitelist) end

--- Returns the number of complete provinces controlled by the specified faction, as well as the number of provinces in which the faction owns territory and is only one settlement away from complete control.
---@param faction FACTION_SCRIPT_INTERFACE Faction to query. This is specified by FACTION_SCRIPT_INTERFACE - see the <a href="../../scripting_doc.html">game interface documentation for more information.
function campaign_manager:num_provinces_controlled_by_faction(faction) end

--- Releases the escape key and spacebar after they've been stolen with campaign_manager:steal_escape_key_and_space_bar_with_callback.
---@param name string Unique name for this key-steal entry
---@param callback function Function to call when one of the keys are pressed.
function campaign_manager:release_escape_key_and_space_bar_with_callback(name, callback) end

--- Removes an effect bundle from a region.
---@param effect_bundle_key string Effect bundle key from the effect bundles table.
---@param number_cqi string Command queue index of the character commander of the military force to remove the effect from.
function campaign_manager:remove_effect_bundle_from_region(effect_bundle_key, number_cqi) end

--- Returns the building level for the supplied building key, as looked up from the building_levels database table (i.e. 0 is a "level one" building, 1 is a "level two" building and so on). If no building could be found then nil is returned.
---@param building_key string Building key, from the building_levels database table.
function campaign_manager:building_level_for_building(building_key) end

--- Removes an effect bundle from a military force by its commanding character's cqi.
---@param effect_bundle_key string Effect bundle key from the effect bundles table.
---@param number_cqi string Command queue index of the character commander of the military force to remove the effect from.
function campaign_manager:remove_effect_bundle_from_characters_force(effect_bundle_key, number_cqi) end

--- Returns true if the supplied character is not a general, a colonel or a minister, false otherwise.
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_manager:char_is_agent(character) end

--- Returns true if any campaign_cutscene is running, false otherwise.
function campaign_manager:is_any_cutscene_running() end

--- Returns the general character in the supplied faction of the highest rank. The faction may be supplied as a faction object or may be specified by key.
---@param faction any Faction, either by faction object or by string key.
function campaign_manager:get_highest_ranked_general_for_faction(faction) end

--- Returns whether a camera position is currently cached for the (optional) supplied cache name.
---@param cache_name string cache name
function campaign_manager:cached_camera_position_exists(cache_name) end

--- Returns the superchain key for the supplied building key. If no building could be found then nil is returned.
---@param building_key string Building key, from the building_levels database table.
function campaign_manager:building_superchain_key_for_building(building_key) end

--- Kills all armies in the supplied faction.
---@param faction_object FACTION_SCRIPT_INTERFACE faction object
function campaign_manager:kill_all_armies_for_faction(faction_object) end

--- Returns a string summary description when passed certain campaign objects. Supported object types are character, region, faction, military force, and unit.
---@param campaign_object any campaign object
function campaign_manager:campaign_obj_to_string(campaign_object) end

--- Removes an effect bundle from a faction.
---@param effect_bundle_key string Effect bundle key from the effect bundles table.
---@param faction_key string Faction key of the faction to remove the effect from.
function campaign_manager:remove_effect_bundle(effect_bundle_key, faction_key) end

--- Returns true if the faction was a defender (primary or reinforcing) in the cached pending battle.
---@param faction_key string faction key
function campaign_manager:pending_battle_cache_faction_is_defender(faction_key) end

--- Creates a storm of a given type in a given region. This calls the cm:create_storm_for_region function of the same name on the underlying episodic scripting interface, but adds validation and output.
---@param region_key string region key
---@param storm_strength number storm strength
---@param duration number duration
---@param storm_type string storm type
function campaign_manager:create_storm_for_region(region_key, storm_strength, duration, storm_type) end

--- Returns the faction that has complete control of the supplied province. If no faction holds the entire province, then nil is returned.
---@param province PROVINCE_SCRIPT_INTERFACE province
function campaign_manager:get_owner_of_province(province) end

--- Returns the closest settlement from the specified subject faction to the camera. The function returns the region of the closest settlement, although nil is returned if the source faction contains no settlements.<br />
--- If this function is called in multiplayer mode the capital of the specified faction is returned, as testing the camera position in inherently unsafe in multiplayer.
---@param subject_faction any Subject faction specifier. This can be a faction object or a string faction key from the factions database table.
function campaign_manager:get_closest_settlement_from_faction_to_camera(subject_faction) end

--- Returns true if territories controlled by the supplied faction contain the supplied building. This won't work for horde buildings.
---@param faction_object FACTION_SCRIPT_INTERFACE faction object
---@param building_key string building key
function campaign_manager:faction_contains_building(faction_object, building_key) end

--- Returns the x/y logical position of the supplied character.
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_manager:char_logical_pos(character) end

--- Returns the closest character of the supplied culture to the supplied faction. The culture and faction are both specified by string key.<br />
--- Use this function sparingly, as it is quite expensive.
---@param faction_key string Faction key, from the factions database table.
---@param subculture_key string Culture key, from the cultures database table.
---@param filter function Filter function. If supplied, this filter function will be called for each potentially-eligible character, with the character being passed in as a single argument. The character will only be considered eligible if the filter function returns true.
function campaign_manager:get_closest_visible_character_of_culture(faction_key, subculture_key, filter) end

--- Returns a military force by it's command queue index. If no military force with the supplied cqi is found then false is returned.
---@param cqi number cqi
function campaign_manager:get_military_force_by_cqi(cqi) end

--- Applies a restriction to or removes a restriction from a faction recruiting one or more unit types.
---@param faction_name string Faction name.
---@param unit_list table Numerically-indexed table of string unit keys.
---@param should_restrict boolean Set this to true to apply the restriction, false to remove it.
function campaign_manager:restrict_units_for_faction(faction_name, unit_list, should_restrict) end

--- Removes a previously added hex based area trigger with the specified ID.
---@param id string The ID of the area trigger to remove.
function campaign_manager:remove_hex_area_trigger(id) end

--- Returns the hero character from the specified faction that's closest to the specified position. If no hero character is found then nil is returned. The position should be specified by logical co-ordinates unless the is-display-coordinates flag is set, in which case the position is specified by display co-ordinates.<br />
--- Optional list of character types and subtypes can be provided as tables of strings. If these lists are specified then a character's type/subtype must be present in the relevant list for it to be considered.
---@param faction any Faction specifier. This can be a faction object or a string faction name.
---@param x number x co-ordinate.
---@param y number y co-ordinate.
---@param character_types boolean Sets the function to use display co-ordinates instead of logical co-ordinates.
---@param character_subtypes table Table of string hero types. If no table of character types is supplied then all hero types are eligible.
function campaign_manager:get_closest_hero_to_position_from_faction(faction, x, y, character_types, character_subtypes) end

--- Converts a set of logical co-ordinates into display co-ordinates.
---@param x number Logical x co-ordinate.
---@param y number Logical y co-ordinate.
function campaign_manager:log_to_dis(x, y) end

--- Forceably adds a skill to a character. This wraps the cm:force_add_skill function on the underlying episodic scripting interface, but adds validation and output. This output will be shown in the Lua - Traits debug console spool.
---@param character_string string Character string of the target character, using the standard character string lookup system.
---@param skill_key string Skill key to add.
function campaign_manager:force_add_skill(character_string, skill_key) end

--- Adds one or more lines of infotext to the infotext panel. This function passes through to infotext_manager:add_infotext - see the documentation on the infotext_manager page for more details.
---@param first_param any Can be a string key from the advice_info_texts table, or a number specifying an initial delay in ms after the panel animates onscreen and the first infotext item is shown.
---@vararg any
function campaign_manager:add_infotext(first_param, additional_infotext_strings) end

--- Enables movement for the supplied faction. This wraps the cm:enable_movement_for_faction function on the underlying episodic scripting interface, but adds validation and output.
---@param faction_key string faction key
function campaign_manager:enable_movement_for_faction(faction_key) end

--- Disables movement for the supplied character. Characters are specified by lookup string. This wraps the cm:disable_movement_for_character function on the underlying episodic scripting interface, but adds validation and output.
---@param char_lookup_string string char lookup string
function campaign_manager:disable_movement_for_character(char_lookup_string) end

--- Returns a character by family member command queue index. If no family member interface with the supplied cqi could be found then false is returned.<br />
--- Returns the supplied character's full localised name as a string for output.
---@param family_member_cqi number family member cqi
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_manager:get_character_by_fm_cqi(family_member_cqi, character) end

--- Returns whether a local faction exists. This should only return false in an autotest without a local faction.
function campaign_manager:local_faction_exists() end

--- Registers a function to be called when the first tick occurs in a new multiplayer game.
---@param callback function callback
function campaign_manager:add_first_tick_callback_mp_new(callback) end

--- Returns whether the subculture is present in the campaign. By default, this will check the cached data of subcultures present on turn one of the campaign.
---@param subculture_key string Subculture key, from the cultures_subcultures database table.
---@param factions_present_now boolean Set to true to actively check the factions on the map right now, instead of looking in the cached data. This check is more expensive.
function campaign_manager:is_subculture_in_campaign(subculture_key, factions_present_now) end

--- Returns a numerically indexed table of character objects, each representing an enemy character of the supplied character in the cached pending battle. If the supplied character was not present in the pending battle then the returned table will be empty.
---@param character_to_query CHARACTER_SCRIPT_INTERFACE character to query
function campaign_manager:pending_battle_cache_get_enemies_of_char(character_to_query) end

--- Override function for scroll_camera_wiht_direction that provides output.
---@param correct_endpoint boolean Correct endpoint. If true, the game will adjust the final position of the camera so that it's a valid camera position for the game. Set to true if control is being released back to the player after this camera movement finishes.
---@param time number Time in seconds over which to scroll.
---@vararg any
function campaign_manager:scroll_camera_with_direction(correct_endpoint, time, positions) end

--- Returns an indexed table of all regions or region keys adjacent to those regions held by the supplied faction. The faction may be specified by string faction key or as a FACTION_SCRIPT_INTERFACE object.<br />
--- If an optional condition function is supplied then it is called for each region with the region supplied as a single argument. In this case, the condition function must return true for the region to be included in the results.
---@param faction_specifier FACTION_SCRIPT_INTERFACE Faction specifier - this can be a faction script interface object, or a string faction key from the factions database table.
---@param regions_as_keys return Populate the returned table with region keys, rather than REGION_SCRIPT_INTERFACE objects.
function campaign_manager:get_regions_adjacent_to_faction(faction_specifier, regions_as_keys) end

--- Stops any monitor started by campaign_manager:notify_on_character_halt, by character cqi.
---@param cqi number Command-queue-index of the subject character.
function campaign_manager:stop_notify_on_character_halt(cqi) end

--- Returns true if the supplied character is in a region their faction controls, false otherwise.
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_manager:char_in_owned_region(character) end

--- Pass-through function for objectives_manager:activate_objective_chain. Starts a new objective chain - see the documentation on the objectives_manager page for more details.
---@param chain_name string Objective chain name.
---@param objective_key string Key of initial objective, from the scripted_objectives table.
---@param number_param_a number First numeric parameter - see the documentation for campaign_manager:set_objective for more details
---@param number_param_b number Second numeric parameter - see the documentation for campaign_manager:set_objective for more details
function campaign_manager:activate_objective_chain(chain_name, objective_key, number_param_a, number_param_b) end

--- Returns true if the campaign is multiplayer.
function campaign_manager:is_multiplayer() end

--- Retuns a table containing all agent types as keys (the value of each record being true). Please copy this table instead of writing to it.
function campaign_manager:get_all_agent_types_lookup() end

--- Calls one callback if a specified character is currently moving, and another if it's not. It does this by recording the character's position, waiting half a second and then comparing the current position with that just recorded.
---@param cqi number Command-queue-index of the subject character.
---@param moving_callback function Function to call if the character is determined to be moving.
---@param not_moving_callback function Function to call if the character is determined to be stationary.
function campaign_manager:is_character_moving(cqi, moving_callback, not_moving_callback) end

--- Cancels any running monitors started by campaign_manager:move_character. This won't actually stop any characters currently moving.
function campaign_manager:cancel_all_move_character() end

--- Helper function to move a character.
---@param cqi number Command-queue-index of the character to move.
---@param x number x co-ordinate of the intended destination.
---@param y number y co-ordinate of the intended destination.
---@param should_replenish boolean Automatically replenish the character's action points in script should they run out whilst moving. This ensures the character will reach their intended destination in one turn (unless they fail for another reason).
---@param allow_post_movement boolean Allow the army to move after the order is successfully completed. Setting this to false disables character movement with campaign_manager:disable_movement_for_character should the character successfully reach their destination.
---@param success_callback function Callback to call if the character successfully reaches the intended destination this turn.
---@param fail_callback function Callback to call if the character fails to reach the intended destination this turn.
function campaign_manager:move_character(cqi, x, y, should_replenish, allow_post_movement, success_callback, fail_callback) end

--- Adds a repeating real callback to be called each time the supplied interval elapses. Real timers are synchronised to UI updates, not to the game model - see Real Timers for more information.<br />
--- This function call is passed through to timer_manager:repeat_real_callback - this campaign_manager alias is provided purely for convenience.
---@param callback function Callback to call.
---@param interval number Repeating interval after which to call the callback. This should be in milliseconds, regardless of game mode.
---@param name string Callback name, by which it may be later removed with campaign_manager:remove_real_callback. If omitted the repeating callback may not be cancelled.
function campaign_manager:repeat_real_callback(callback, interval, name) end

--- Spawns a specified force if a character (the subject) exists within a faction with an army. It is intended for use at the start of a campaign in a game-created callback (see campaign_manager:add_pre_first_tick_callback), in very specific circumstances.
---@param faction_key string Faction key of the subject character.
---@param forename_key string Forename key of the subject character from the names table using the full localisation format i.e. names_name_[key].
---@param faction_key string Faction key of the force to create.
---@param units string list of units to create force with (see documentation for campaign_manager:create_force for more information).
---@param region_key string Home region key for the created force.
---@param x number x logical target co-ordinate.
---@param y number y logical target co-ordinate.
---@param make_immortal boolean Set to true to make the created character immortal.
function campaign_manager:spawn_army_starting_character_for_faction(faction_key, forename_key, faction_key, units, region_key, x, y, make_immortal) end

--- Returns true if the supplied military force contains any units of a class contained in the supplied unit class list, false otherwise.
---@param military_force MILITARY_FORCE_SCRIPT_INTERFACE Military force.
---@param unit_class_list table Unit class list. This must be supplied as a numerically indexed table of strings.
function campaign_manager:military_force_contains_unit_class_from_list(military_force, unit_class_list) end

--- Creates an agent of a specified type on the campaign map. This function is a wrapper for the cm:create_agent function provided by the underlying episodic scripting interface. This wrapper function adds validation and success callback functionality.
---@param faction_key string Faction key of the faction to which the agent is to belong.
---@param character_type string Character type of the agent.
---@param character_subtype string Character subtype of the agent.
---@param x number x logical co-ordinate of agent.
---@param y number y logical co-ordinate of agent.
---@param id string Unique string for agent.
---@param success_callback function Callback to call once the character is created. The callback will be passed the created character's cqi as a single argument.
function campaign_manager:create_agent(faction_key, character_type, character_subtype, x, y, id, success_callback) end

--- Adds one or more buildings to a horde army. The army is specified by the command queue index of the military force. A single building may be specified by a string key, or multiple buildings in a table.
---@param military_force_cqi number Command queue index of the military force to add the building(s) to.
function campaign_manager:add_building_to_force(military_force_cqi) end

--- Instantly spawn an army with a specific existing general on the campaign map. This function is a wrapper for the cm:create_force_with_existing_general function provided by the underlying episodic scripting interface, adding debug output and success callback functionality. The general character is specified by character string lookup.
---@param character_lookup string Character lookup string for the general character.
---@param faction_key string Faction key of the faction to which the force is to belong.
---@param unit_list string Comma-separated list of keys from the land_units table. The force will be created with these units.
---@param region_key string Region key of home region for this force.
---@param x number x logical co-ordinate of force.
---@param y number y logical co-ordinate of force.
---@param success_callback function Callback to call once the force is created. The callback will be passed the created military force leader's cqi as a single argument.
function campaign_manager:create_force_with_existing_general(character_lookup, faction_key, unit_list, region_key, x, y, success_callback) end

--- Instantly upgrades the building in the supplied slot to the supplied building key.
---@param slot SLOT_SCRIPT_INTERFACE slot
---@param target_building_key string target building key
function campaign_manager:instantly_upgrade_building_in_region(slot, target_building_key) end

--- Instantly spawns an army with a specific general on the campaign map. This function is a wrapper for the cm:create_force_with_general function provided by the underlying episodic scripting interface, adding debug output and success callback functionality.
---@param faction_key string Faction key of the faction to which the force is to belong.
---@param unit_list string Comma-separated list of keys from the land_units table. The force will be created with these units. This can be a blank string, or nil, if an empty force is desired.
---@param region_key string Region key of home region for this force.
---@param x number x logical co-ordinate of force.
---@param y number y logical co-ordinate of force.
---@param agent_type string Character type of character at the head of the army (should always be "general"?).
---@param agent_subtype string Character subtype of character at the head of the army.
---@param forename string Localised string key of the created character's forename. This should be given in the localised text lookup format i.e. a key from the names table with "names_name_" prepended.
---@param clan_name string Localised string key of the created character's clan name. This should be given in the localised text lookup format i.e. a key from the names table with "names_name_" prepended.
---@param family_name string Localised string key of the created character's family name. This should be given in the localised text lookup format i.e. a key from the names table with "names_name_" prepended.
---@param other_name string Localised string key of the created character's other name. This should be given in the localised text lookup format i.e. a key from the names table with "names_name_" prepended.
---@param make_faction_leader boolean Make the spawned character the faction leader.
---@param success_callback function Callback to call once the force is created. The callback will be passed the created military force leader's cqi as a single argument.
---@param force_diplomatic_discovery boolean forces the created faction to have diplomatic discovery - set to true if you expect the faction to automatically declare war on factions it meets once spawned.
function campaign_manager:create_force_with_general(faction_key, unit_list, region_key, x, y, agent_type, agent_subtype, forename, clan_name, family_name, other_name, make_faction_leader, success_callback, force_diplomatic_discovery) end

--- Instantly spawn an army with a general on the campaign map. This function is a wrapper for the cm:create_force_with_full_diplomatic_discovery function provided by the episodic scripting interface, adding debug output and success callback functionality.
---@param faction_key string Faction key of the faction to which the force is to belong.
---@param unit_list string Comma-separated list of keys from the land_units table. The force will be created with these units.
---@param region_key string Region key of home region for this force.
---@param x number x logical co-ordinate of force.
---@param y number y logical co-ordinate of force.
---@param exclude_named_characters boolean Don't spawn a named character at the head of this force.
---@param success_callback function Callback to call once the force is created. The callback will be passed the created military force leader's cqi as a single argument.
---@param command_queue boolean Use command queue.
function campaign_manager:create_force_with_full_diplomatic_discovery(faction_key, unit_list, region_key, x, y, exclude_named_characters, success_callback, command_queue) end

--- Returns true if the supplied faction has a military force with 20 units in it, or false otherwise. Armed citizenry/garrison armies are excluded from this check.
---@param faction_object FACTION_SCRIPT_INTERFACE faction object
function campaign_manager:faction_has_full_military_force(faction_object) end

--- Scrolls the camera through the supplied list of camera points in a cutscene. Cinematic borders will be shown (unless disabled with campaign_manager:set_use_cinematic_borders_for_automated_cutscenes), the UI hidden, and interaction with the game disabled while the camera is scrolling. The player will be able to skip the cutscene with the ESC key, in which case the camera will jump to the end position.
---@param time number Time in seconds over which to scroll.
---@param callback function Optional callback to call when the cutscene ends.
function campaign_manager:cut_and_scroll_camera_with_cutscene(time, callback) end

--- Steals the escape key and registers a function to call when it is pressed. Unlike campaign_manager:steal_key_with_callback this automatically calls cm:steal_escape_key if the key is not already stolen.
---@param name string Unique name for this key-steal entry.
---@param callback function Function to call when the key is pressed.
---@param is_persistent boolean Key should remain stolen after callback is first called.
function campaign_manager:steal_escape_key_with_callback(name, callback, is_persistent) end

--- Returns a region object with the supplied region name. If no such region is found then false is returned.
---@param region_name string region name
function campaign_manager:get_region(region_name) end

--- Sets a turn number modifier. This offsets the result returned by campaign_manager:turn_number by the supplied modifier. This is useful for campaign setups which include optional additional turns (e.g. one or two turns at the start of a campaign to teach players how to play the game), but still wish to trigger events on certain absolute turns. For example, some script may wish to trigger an event on turn five of a standard campaign, but this would be turn six if a one-turn optional tutorial at the start of the campaign was played through - in this case a turn number modifier of 1 could be set if not playing through the tutorial.
---@param modifier number modifier
function campaign_manager:set_turn_number_modifier(modifier) end

--- Returns just the faction name of a particular defender in the cached pending battle. The defender is specified by numerical index, with the first being accessible at record 1.
---@param index_of_defender number index of defender
function campaign_manager:pending_battle_cache_get_defender_faction_name(index_of_defender) end

--- Returns the distance squared between two positions. The positions can be logical or display, as long as they are both in the same co-ordinate space. The squared distance is returned as it's faster to compare squared distances rather than taking the square-root.
---@param first_x number x co-ordinate of the first position.
---@param first_y number y co-ordinate of the first position.
---@param second_x number x co-ordinate of the second position.
---@param second_y number y co-ordinate of the second position.
function campaign_manager:distance_squared(first_x, first_y, second_x, second_y) end

--- Returns the highest-level settlement for the specified faction. If the faction has no settlements then nil is returned.
---@param faction FACTION_SCRIPT_INTERFACE faction
function campaign_manager:get_highest_level_settlement_for_faction(faction) end

--- Calls the supplied callback when the result of a multiplayer query is received from the network. Multiplayer queries allow the scripts on all machines in a multiplayer game to query information that normally on the script on one machine would have access to, such as advice history or the state of the UI.<br />
--- With each multiplayer query a faction key and some optional query data is specified. The query is run on the machine where the local player's faction matches the faction specified with the query. The results of the query are then broadcast with CampaignUI.TriggerCampaignScriptEvent for all machines in the multiplayer game to receive.<br />
--- A number of multiplayer queries are supported:<br />
--- CommandDescription<br />
--- all_advice_strings_seenReturns true if all the specified advice strings have been seen on the machine where the local player's faction matches the faction specified with the query. The query data should be a table containing a list of advice strings. The result of the query will be a boolean value.
--- any_advice_strings_seenReturns true if any of the specified advice strings have been seen on the machine where the local player's faction matches the faction specified with the query. The query data should be a table containing a list of advice strings. The result of the query will be a boolean value.
--- get_open_blocking_panelReturns the result of calling campaign_ui_manager:get_open_blocking_panel on the machine where the local player's faction matches the faction specified with the query. No query data is specified with this query. The result of the query will be a string panel name, or false if no panel is open.
--- When the query is completed, the function will be called on all machines with the result of the query supplied as a single argument.
---@param query_command string Query command to run. See documentation above for a supported list of query commands.
---@param faction_key string Faction key, from the factions database table. The query is run on the machine where the local player's faction matches this key.
---@param query_data table Data required to perform the query. This can be in different forms for different queries, but is often a table.
---@param callback function Callback that is called when the query is completed. The result of the query will be passed to the callback as a single argument.
function campaign_manager:progress_on_mp_query(query_command, faction_key, query_data, callback) end

--- This function uses CampaignUI.TriggerCampaignScriptEvent to trigger a UI event over the network which all clients receive. Once the event has been received from all clients then the progress callback is called. This can be used to progress the script in a synchronous manner in a multiplayer game only once an inherently-asynchronous event has been received. For example, a cutscene shown on multiple machines at once could be skipped on one machine and not another - progress_on_all_clients_ui_triggered can be used in this situation to only progress on all machines onces the cutscene has finished on all machines.<br />
--- The listening process associated with this function begins when the script is started, so it will pick up relevant events generated by progress_on_all_clients_ui_triggered() calls on remote machines even before progress_on_all_clients_ui_triggered() is called on this machine.
---@param name string Name for this process by which it may optionally be cancelled.
---@param callback function Progression callback.
function campaign_manager:progress_on_all_clients_ui_triggered(name, callback) end

--- Cancels a running monitor started with campaign_manager:progress_on_post_battle_panel_visible.
function campaign_manager:cancel_progress_on_post_battle_panel_visible() end

--- Calls the supplied callback when the campaign camera is seen to have finished moving. The function has to poll the camera position repeatedly, so the supplied callback will not be called the moment the camera comes to rest due to the model tick resolution.<br />
--- Only one such monitor may be active at once.
---@param callback function Callback to call.
---@param delay number Delay in ms after the camera finishes moving before calling the callback.
function campaign_manager:progress_on_camera_movement_finished(callback, delay) end

--- Returns a scripted-generated object that emulates a campaign null interface.
function campaign_manager:null_interface() end

--- Returns the closest character from the supplied faction to the supplied logical position. This includes characters such as politicians and garrison commanders that are not extant on the map.
---@param faction FACTION_SCRIPT_INTERFACE Faction script interface.
---@param x number Logical x position.
---@param y number Logical y position.
function campaign_manager:get_closest_character_from_faction(faction, x, y) end

--- Cancels a running monitor started with campaign_manager:progress_on_battle_completed by name.
---@param name string Name of monitor to cancel.
function campaign_manager:cancel_progress_on_battle_completed(name) end

--- Starts a region change monitor for a faction.
---@param faction_key string faction key
function campaign_manager:start_faction_region_change_monitor(faction_key) end

--- Registers a function to be called when the first tick occurs, but after any other first tick callbacks. Callbacks registered with this function will be called regardless of what mode the campaign is being loaded in.
---@param callback function callback
function campaign_manager:add_post_first_tick_callback(callback) end

--- This function provides an easy one-shot method of starting an intro flyby cutscene from a loading screen with a fade effect. Call this function on the first tick (or before), and pass to it a function which starts an intro cutscene.
---@param callback function Callback to call.
---@param fade_in_time number Time in seconds over which to fade in the camera from black.
function campaign_manager:start_intro_cutscene_on_loading_screen_dismissed(callback, fade_in_time) end

--- Cancels any running monitor started with campaign_manager:progress_on_blocking_panel_dismissed.
---@param callback function Callback to call.
---@param callback_delay number Time in seconds to wait after the panel dismissal before calling the supplied callback.
function campaign_manager:cancel_progress_on_blocking_panel_dismissed(callback, callback_delay) end

--- Saves a named value from the savegame. This may only be called as the game is being saved, and must be passed the context object supplied by the SavingGame event. Values are saved (and loaded) from the savegame with a string name, and the values themselves can be a boolean, a number, a string, or a table containing booleans, numbers or strings.
---@param value_name string Value name. This must be unique within the savegame, and will be used by campaign_manager:load_named_value later to load the value.
---@param value any Value to save.
---@param context userdata Context object supplied by the SavingGame event.
function campaign_manager:save_named_value(value_name, value, context) end

--- Skips any campaign cutscene currently running. 
function campaign_manager:skip_all_campaign_cutscenes() end

--- Compares the current position of the camera to that last cached with the (optional) specified cache name, and returns true if any of the camera co-ordinates have changed by the (optional) supplied distance, or false otherwise. If no camera cache has been set with the specified name then a script error is generated.
---@param cache_name string cache name
function campaign_manager:camera_has_moved_from_cached(cache_name) end

--- Returns true if the supplied military force was an attacker or defender in the cached pending battle.
---@param cqi number Command-queue-index of the military force to query.
function campaign_manager:pending_battle_cache_mf_is_involved(cqi) end

--- Returns the closest settlement from the specified subject faction to a foreign faction. The function returns the region of the closest settlement, although nil is returned if the source faction contains no settlements or the target faction no military forces.
---@param subject_faction any Subject faction specifier. This can be a faction object or a string faction key from the factions database table.
---@param foreign_faction any Foreign faction specifier. This can be a faction object or a string faction key from the factions database table.
function campaign_manager:get_closest_settlement_from_faction_to_faction(subject_faction, foreign_faction) end

--- Calls a supplied callback when all events panels are closed. Analagous to calling campaign_manager:progress_on_panel_dismissed with the panel name "events".
---@param unique_name string Unique descriptive string name for this process. Multiple progress_on_panel_dismissed monitors may be active at any one time.
---@param callback function Callback to call.
---@param callback_delay number Time in seconds to wait after the panel dismissal before calling the supplied callback.
function campaign_manager:progress_on_events_dismissed(unique_name, callback, callback_delay) end

--- Calls a supplied callback when a panel with the supplied name is closed.
---@param unique_name string Unique descriptive string name for this process. Multiple progress_on_panel_dismissed monitors may be active at any one time.
---@param panel_name string Name of the panel.
---@param callback function Callback to call.
---@param callback_delay number Time in seconds to wait after the panel dismissal before calling the supplied callback.
function campaign_manager:progress_on_panel_dismissed(unique_name, panel_name, callback, callback_delay) end

--- Registers a function to be called when the advisor is dismissed. Only one such function can be registered at a time.
---@param name string Process name, by which this progress listener may be later cancelled if necessary.
---@param callback function Callback to call.
---@param delay number Delay in seconds after the advisor is dismissed before calling the callback.
---@param highlight_on_finish boolean Highlight on advice finish. If set to true, this also establishes a listener for the advice VO finishing. When it does finish, this function then highlights the advisor close button.
function campaign_manager:progress_on_advice_dismissed(name, callback, delay, highlight_on_finish) end

--- Dismisses the advice. Prior to performing the dismissal, this function calls any pre-dismiss callbacks registered with campaign_manager:add_pre_dismiss_advice_callback. This function gets called internally when the player clicks the script-controlled advice progression button that appears on the advisor panel.
function campaign_manager:dismiss_advice() end

--- Restricts or unrestricts a faction from researching one or more technologies. 
---@param faction_name string Faction name.
---@param building_list table Numerically-indexed table of string technology keys.
---@param should_restrict boolean Set this to true to apply the restriction, false to remove it.
function campaign_manager:restrict_technologies_for_faction(faction_name, building_list, should_restrict) end

--- Immediately enables or disables the close button that appears on the advisor panel, or causes it to be highlighted.
---@param show_progress_button boolean show progress button
---@param highlight_progress_button boolean highlight progress button
function campaign_manager:modify_advice(show_progress_button, highlight_progress_button) end

--- Returns true if the advice system is enabled, or false if it's been disabled with campaign_manager:set_advice_enabled.
function campaign_manager:is_advice_enabled() end

--- Triggers a custom mission from a string passed into the function. The mission string must be supplied in a custom format - see the missions.txt that commonly accompanies a campaign for examples. Alternatively, use a mission_manager which is able to construct such strings internally.<br />
--- This wraps the cm:trigger_custom_mission_from_string function on the underlying episodic scripting interface, adding output and the optional whitelisting functionality.
---@param faction_key string faction key
---@param mission string Mission definition string.
---@param whitelist boolean Supply false here to not whitelist the mission event type, so that it does not display if event feed restrictions are in place (see campaign_manager:suppress_all_event_feed_messages and campaign_manager:whitelist_event_feed_event_type).
function campaign_manager:trigger_custom_mission_from_string(faction_key, mission, whitelist) end

--- Sets an x/y display location for the next triggered advice. Once that advice has triggered this position will be cleared, meaning further advice will trigger without a location unless this function is called again.
---@param x_position number X display position.
---@param y_position number Y display position.
function campaign_manager:set_next_advice_location(x_position, y_position) end

--- Registers a function to be called when the UI is created. Callbacks registered with this function will be called regardless of what mode the campaign is being loaded in.
---@param callback function callback
function campaign_manager:add_ui_created_callback(callback) end

--- Marks a scripted objective as completed for the player to see. Note that it will remain on the scripted objectives panel until removed with campaign_manager:remove_objective. This function passes its arguments through objectives_manager:complete_objective on the objectives manager - see the documentation on that function for more information.<br />
--- Note also that is possible to mark an objective as complete before it has been registered with campaign_manager:set_objective - in this case, it is marked as complete as soon as campaign_manager:set_objective is called.
---@param objective_key string Objective key, from the scripted_objectives table.
function campaign_manager:complete_objective(objective_key) end

--- Returns the closest foreign slot manager belonging to one faction, to the settlements from another faction. The two factions may be the same, in which case the closest foreign slot manager to the faction's own settlements is returned.
---@param owning_faction any Owning faction specifier. This can be a FACTION_SCRIPT_INTERFACE object or a string faction key from the factions database table.
---@param foreign_faction any Foreign faction specifier. This can be a FACTION_SCRIPT_INTERFACE object or a string faction key from the factions database table.
function campaign_manager:get_closest_foreign_slot_manager_from_faction_to_faction(owning_faction, foreign_faction) end

--- Instantly spawn an army with a general on the campaign map. This function is a wrapper for the cm:create_force function provided by the episodic scripting interface, adding debug output and success callback functionality.
---@param faction_key string Faction key of the faction to which the force is to belong.
---@param unit_list string Comma-separated list of keys from the land_units table. The force will be created with these units.
---@param region_key string Region key of home region for this force.
---@param x number x logical co-ordinate of force.
---@param y number y logical co-ordinate of force.
---@param exclude_named_characters boolean Don't spawn a named character at the head of this force.
---@param success_callback function Callback to call once the force is created. The callback will be passed the created military force leader's cqi and the military force cqi.
---@param command_queue boolean Use command queue.
function campaign_manager:create_force(faction_key, unit_list, region_key, x, y, exclude_named_characters, success_callback, command_queue) end

--- Returns the cqi and unit key of a specified unit on the specified attacker in the pending battle cache, by index.
---@param attacker_index number Index of attacking character within the pending battle cache.
---@param unit_unit number Index of unit belonging to the attacking character.
function campaign_manager:pending_battle_cache_get_attacker_unit(attacker_index, unit_unit) end

--- Returns a numerically-indexed table containing the string keys of all human player-controlled factions within the game. This includes idle human factions, which are factions that started as player-controlled but where the human player has dropped and not yet resumed.
function campaign_manager:get_human_factions() end

--- Activates or deactivates a highlight on the event panel dismiss button. This may not work in all circumstances.
---@param should_highlight boolean should highlight
function campaign_manager:highlight_event_dismiss_button(should_highlight) end

--- Returns a numerically-indexed table containing the string keys of all active human player-controlled factions in the game. This does not include idle human factions - see campaign_manager:get_human_factions.
function campaign_manager:get_active_human_factions() end

--- Calls the supplied callback when all fullscreen campaign panels are dismissed. Only one such monitor may be active at once - starting a second will cancel the first.
---@param callback function Callback to call.
---@param callback_delay number Time in seconds to wait after the panel dismissal before calling the supplied callback.
function campaign_manager:progress_on_blocking_panel_dismissed(callback, callback_delay) end

--- Returns true if the pending battle has been won by a human player, false otherwise.
function campaign_manager:pending_battle_cache_human_victory() end

--- Gets the total spent and gained of a pooled resource or pooled resource factor for a particular faction. A tracking monitor must be started for the specified faction before this function can be called.<br />
--- If a factor key is specified then the spent and gained values returned relate to the factor for the specified pooled resource. If no factor key is specified, then the total spent and gained for the pooled resource (for all factors) is returned.
---@param faction_key string Key of the faction to query, from the factions database table.
---@param pooled_resource_key string Key of the pooled resource to query, from the pooled_resources database table.
---@param factor_key string Key of the pooled resource factor to query, from the pooled_resource_factors database table.
function campaign_manager:get_total_pooled_resource_changed_for_faction(faction_key, pooled_resource_key, factor_key) end

--- Returns the region controlled by the specified faction that is closest to a supplied set of logical co-ordinates. If no co-ordinates are supplied then the logical position of the camera is used.<br />
--- An optional condition function may be supplied which each region must pass in order to be considered eligible in the result. If supplied, this condition function will be called for each region and will be supplied that region object as a single argument. The function should return a value that evaluates to a boolean to determine the result of the condition test.<br />
--- If the specified faction controls no regions, or none pass the condition, then nil will be returned.
---@param faction FACTION_SCRIPT_INTERFACE Faction object.
---@param x number Logical x co-ordinate.
---@param y number Logical y co-ordinate.
---@param condition function Conditional test.
function campaign_manager:get_closest_region_for_faction(faction, x, y, condition) end

--- Starts playback of a cindy scene. This is a wrapper for the cinematics:cindy_playback function, adding debug output.
---@param filepath string File path to cindy scene, from the working data folder.
---@param blend_in_duration number Time in seconds over which the camera will blend into the cindy scene when started.
---@param blend_out_duration number Time in seconds over which the camera will blend out of the cindy scene when it ends.
function campaign_manager:cindy_playback(filepath, blend_in_duration, blend_out_duration) end

--- Registers a callback to be called when/immediately before the advice gets dismissed.
---@param callback function callback
function campaign_manager:add_pre_dismiss_advice_callback(callback) end

--- Adds a real callback to be called after the supplied interval has elapsed. Real timers are synchronised to UI updates, not to the game model - see Real Timers for more information.<br />
--- This function call is passed through to timer_manager:real_callback - this campaign_manager alias is provided purely for convenience.
---@param callback function Callback to call.
---@param interval number Interval after which to call the callback. This should be in milliseconds, regardless of game mode.
---@param name string Callback name, by which it may be later removed with campaign_manager:remove_real_callback. If omitted the callback may not be cancelled.
function campaign_manager:real_callback(callback, interval, name) end

--- Returns true if the supplied faction has any agents in its character list, or false otherwise. The function may also be instructed to return a table of all agents in the faction, either by their character interfaces or their command-queue indexes.
---@param faction FACTION_SCRIPT_INTERFACE FACTION_SCRIPT_INTERFACE for the subject faction.
---@param return_list boolean Instructs the function to also return a table of either their character interfaces or cqi's (which of these to use is set by the third parameter to this function).
---@param return_by_cqi boolean Instructs the function to return a list of cqis instead of a list of character interfaces. If characters are stored by cqi their character interfaces may later be looked up using campaign_manager:get_character_by_cqi. Character interfaces are volatile and may not be stored over time. This argument is not used if the second argument is not set to true.
function campaign_manager:faction_contains_agents(faction, return_list, return_by_cqi) end

--- Returns false if ui hiding has been disabled with campaign_manager:enable_ui_hiding, true otherwise.
function campaign_manager:is_ui_hiding_enabled() end

--- Returns a string which represents the serialised state of the military force specified by the supplied military force cqi. This does not embody the full model state of the units but only selected information. It is mainly intended for use by campaign_manager:save_army_state_to_svr which will save the returned string into the scriptedvalueregistry.
---@param mf_cqi number mf cqi
function campaign_manager:serialise_army_state(mf_cqi) end

--- Returns true if a battle sequence is currently happening. Scripts can query whether a battle sequence is happening to know whether to proceed with gameplay events that should only happen outside of a battle. In particular, campaign_manager:progress_on_battle_completed uses this mechanism to know when to trigger its callback.<br />
--- A battle sequence starts when the PendingBattle event is received, and ends when either the BattleCompleted event is received for battles not involving a human participant, or two seconds after the BattleCompletedCameraMove event is received if the battle did involve a human participant. It is safe to use in multiplayer, and also works for battles that aren't fought (withdrawal, maintain siege etc).
function campaign_manager:is_processing_battle() end

--- Applies an effect bundle to a faction for a number of turns (can be infinite).
---@param effect_bundle_key string Effect bundle key from the effect bundles table.
---@param faction_key string Faction key of the faction to apply the effect to.
---@param turns number Number of turns to apply the effect bundle for. Supply 0 here to apply the effect bundle indefinitely (it can be removed later with campaign_manager:remove_effect_bundle if required).
function campaign_manager:apply_effect_bundle(effect_bundle_key, faction_key, turns) end

--- Scrolls the camera from the current camera position. This is the same as callling campaign_manager:scroll_camera_with_direction with the current camera position as the first set of co-ordinates.
---@param correct_endpoint boolean Correct endpoint. If true, the game will adjust the final position of the camera so that it's a valid camera position for the game. Set to true if control is being released back to the player after this camera movement finishes.
---@param time number Time in seconds over which to scroll.
---@vararg any
function campaign_manager:scroll_camera_from_current(correct_endpoint, time, positions) end

--- Returns true if the supplied character is a general, has an army, and can move around the campaign map, false otherwise.
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_manager:char_is_mobile_general_with_army(character) end

--- Returns true if the supplied faction has any agents of the supplied types or subtypes.
---@param faction FACTION_SCRIPT_INTERFACE FACTION_SCRIPT_INTERFACE for the subject faction.
function campaign_manager:faction_contains_characters_of_type(faction) end

--- Plays a fullscreen movie, by path from the data/Movies directory. This function wraps the underlying cm:register_instant_movie to play the movie and provide output.
---@param movie_path string movie path
function campaign_manager:register_instant_movie(movie_path) end

--- Returns true if the supplied unit key was involved in the cached pending battle as attacker.
---@param unit_key string unit key
function campaign_manager:pending_battle_cache_unit_key_exists_in_attackers(unit_key) end

--- Cancels a running process started with campaign_manager:progress_on_event with the supplied name.
---@param name string name
function campaign_manager:cancel_progress_on_event(name) end

--- Immediately exits to the frontend. Mainly used in benchmark scripts.
function campaign_manager:quit() end

--- Returns whether the supplied building exists in the supplied province.
---@param building_key string building key
---@param province_key string province key
function campaign_manager:building_exists_in_province(building_key, province_key) end

--- Returns faction object of the faction whose turn it is currently. This only works in singleplayer mode - in scripts that may be run in multiplayer mode call campaign_manager:whose_turn_is_it, which returns a particular faction of the many currently taking their turn.
function campaign_manager:whose_turn_is_it_single() end

--- Returns a family member by it's command queue index. If no family member with the supplied cqi is found then false is returned.
---@param cqi number cqi
function campaign_manager:get_family_member_by_cqi(cqi) end

--- This function attempts to load a lua script from all folders currently on the path, and, when loaded, sets the environment of the loaded file to match the global environment. This is used when loading scripts within a block (within if statement that is testing for the file's existence, for example) - loading the file with require would not give it access to the global environment.<br />
--- Call campaign_manager:require_path_to_campaign_folder and/or campaign_manager:require_path_to_campaign_faction_folder if required to include these folders on the path before loading files with this function, if required. Alternatively, use campaign_manager:load_local_faction_script for a more automated method of loading local faction scripts.<br />
--- If the script file fails to load cleanly, a script error will be thrown.
---@param script_name string script name
---@param single_player_only boolean single player only
function campaign_manager:load_global_script(script_name, single_player_only) end

--- Returns a FACTION_LIST_SCRIPT_INTERFACE of all factions whose turn it is currently. This can be used in singleplayer or multiplayer.
function campaign_manager:whose_turn_is_it() end

--- Returns the unary proportion (0-1) of units in the supplied military force which are of the supplied unit class.
---@param military_force MILITARY_FORCE_SCRIPT_INTERFACE military force
---@param unit_class string unit class
function campaign_manager:proportion_of_unit_class_in_military_force(military_force, unit_class) end

--- Returns whether or not we're actively processing the first tick callbacks.
function campaign_manager:is_first_tick() end

--- Returns true if it's the supplied faction turn. The faction is specified by key.
---@param faction_key string Faction key, from the factions database table.
function campaign_manager:is_factions_turn_by_key(faction_key) end

--- Instantly dismantles the building in the supplied slot number of the supplied region.
---@param slot SLOT_SCRIPT_INTERFACE slot
function campaign_manager:instantly_dismantle_building_in_region(slot) end

--- Loads a script file in the factions subfolder that corresponds to the name of the local player faction, with the supplied string appellation attached to the end of the script filename. This function is the preferred method for loading in local faction-specific script files. It calls campaign_manager:require_path_to_campaign_faction_folder internally to set up the path, and uses campaign_manager:load_global_script to perform the loading. It must not be called before the game is created.
---@param script_name_appellation string script name appellation
function campaign_manager:load_local_faction_script(script_name_appellation) end

--- Returns the character within the supplied faction that's closest to the supplied logical co-ordinates. If the is-display-coordinates flag is set then the supplied co-ordinates should be display co-ordinates instead.
---@param faction any Faction specifier. This can be a faction object or a string faction name.
---@param x number Logical x co-ordinate, or Display x co-ordinate if the is-display-coordinates flag is set.
---@param y number Logical y co-ordinate, or Display y co-ordinate if the is-display-coordinates flag is set.
---@param general_characters_only boolean Restrict search results to generals.
---@param include_garrison_commanders boolean Includes garrison commanders in the search results if set to true.
---@param visible_to_faction boolean Sets the function to use display co-ordinates instead of logical co-ordinates.
function campaign_manager:get_closest_character_to_position_from_faction(faction, x, y, general_characters_only, include_garrison_commanders, visible_to_faction) end

--- Randomly sorts a numerically-indexed table. This is safe to use in multiplayer, but will destroy the supplied table. It is faster than campaign_manager:random_sort_copy.<br />
--- Note that records in this table that are not arranged in an ascending numerical index will be lost.<br />
--- Note also that the supplied table is overwritten with the randomly-sorted table, which is also returned as a return value.
function campaign_manager:random_sort() end

--- Assembles and returns a random integer between 1 and 100, or other supplied values. The result returned is inclusive of the supplied max/min. This is safe to use in multiplayer scripts.
---@param max integer Maximum value of returned random number.
---@param min integer Minimum value of returned random number.
function campaign_manager:random_number(max, min) end

--- Returns true if the supplied unit key was involved in the cached pending battle as defender.
---@param unit_key string unit key
function campaign_manager:pending_battle_cache_unit_key_exists_in_defenders(unit_key) end

--- Repositions a specified character (the target) for a faction at start of a campaign, but only if another character (the subject) exists in that faction and is in command of an army. Like campaign_manager:teleport_to which underpins this function it is for use at the start of a campaign in a game-created callback (see campaign_manager:add_pre_first_tick_callback). It is intended for use in very specific circumstances.<br />
--- The characters involved are specified by forename key.
---@param faction_key string Faction key of the subject and target characters.
---@param forename_key string Forename key of the subject character from the names table using the full localisation format i.e. names_name_[key].
---@param forename_key string Forename key of the target character from the names table using the full localisation format i.e. names_name_[key].
---@param x number x logical target co-ordinate.
---@param y number y logical target co-ordinate.
function campaign_manager:reposition_starting_character_for_faction(faction_key, forename_key, forename_key, x, y) end

--- Returns the gold value of defending forces in the cached pending battle.
function campaign_manager:pending_battle_cache_defender_value() end

--- Hides any subtitles currently displayed with campaign_manager:show_subtitle.
function campaign_manager:hide_subtitles() end

--- Removes a listener that was previously added with campaign_manager:add_pooled_resource_regular_income_listener_by_faction.
---@param listener_name string listener name
function campaign_manager:remove_pooled_resource_regular_income_listener_by_faction(listener_name) end

--- Returns whether the cinematic UI is currently enabled. The cinematic UI is enabled from script with CampaignUI.ToggleCinematicBorders, and is commonly activated/deactivated by cutscenes.
function campaign_manager:is_cinematic_ui_enabled() end

--- Returns the local player faction object.
---@param force_result boolean Force the result to be returned instead of erroring in multiplayer.
function campaign_manager:get_local_faction(force_result) end

--- Returns just a table containing the unit keys of a particular defender in the cached pending battle. The defender is specified by numerical index, with the first being accessible at record 1.
---@param index_of_defender number index of defender
function campaign_manager:pending_battle_cache_get_defender_units(index_of_defender) end

--- Gets the total amount of a pooled resource or pooled resource factor spent/lost by a particular faction. A tracking monitor must be started for the specified faction before this function can be called.<br />
--- If a factor key is specified then the spent value returned relates to the factor for the specified pooled resource. If no factor key is specified, then the total spent/lost for the pooled resource (for all factors) is returned.
---@param faction_key string Key of the faction to query, from the factions database table.
---@param pooled_resource_key string Key of the pooled resource to query, from the pooled_resources database table.
---@param factor_key string Key of the pooled resource factor to query, from the pooled_resource_factors database table.
function campaign_manager:get_total_pooled_resource_spent_for_faction(faction_key, pooled_resource_key, factor_key) end

--- Returns true if any of the participating factions in the pending battle are quest battle factions, false otherwise.
function campaign_manager:pending_battle_cache_is_quest_battle() end

--- Returns a numerically indexed table of family member objects, each representing an enemy character of the supplied family member in the cached pending battle. If the supplied family member was not present in the pending battle then the returned table will be empty.
---@param family_member_to_query FAMILY_MEMBER_SCRIPT_INTERFACE family member to query
function campaign_manager:pending_battle_cache_get_enemy_fms_of_char_fm(family_member_to_query) end

--- Calls the supplied callback as soon as a character is determined to be moving.
---@param process_name string name for this movement monitor, by which it can be cancelled later with campaign_manager:stop_notify_on_character_movement. It is valid to have multiple notification processes with the same name.
---@param cqi number Command-queue-index of the subject character.
---@param callback function Callback to call.
function campaign_manager:notify_on_character_movement(process_name, cqi, callback) end

--- Returns the logical position of a supplied settlement by string name.
---@param settlement_name string settlement name
function campaign_manager:settlement_logical_pos(settlement_name) end

--- Cancels a monitor started with campaign_manager:progress_on_events_dismissed (or campaign_manager:progress_on_panel_dismissed) by name.
---@param unique_name string Unique descriptive string name for this process.
function campaign_manager:cancel_progress_on_events_dismissed(unique_name) end

--- Returns true if the supplied military force was an attacker in the cached pending battle.
---@param cqi number Command-queue-index of the military force to query.
function campaign_manager:pending_battle_cache_mf_is_attacker(cqi) end

--- Returns true if the supplied family member was a defender in the cached pending battle.
---@param family_member any Character to query. May be supplied as a family member object or as a cqi number.
function campaign_manager:pending_battle_cache_fm_is_defender(family_member) end

--- Returns true if the supplied family member was an attacker in the cached pending battle.
---@param family_member any Character to query. May be supplied as a family member object or as a cqi number.
function campaign_manager:pending_battle_cache_fm_is_attacker(family_member) end

--- Loads a named value from the savegame. This may only be called as the game is being loaded, and must be passed the context object supplied by the LoadingGame event. Values are saved and loaded from the savegame with a string name, and the values themselves can be a boolean, a number, a string, or a table containing booleans, numbers or strings.
---@param value_name string Value name. This must be unique within the savegame, and should match the name the value was saved with, with campaign_manager:save_named_value.
---@param default_value any Default value, in case the value could not be loaded from the savegame. The default value supplied here is used to determine/must match the type of the value being loaded.
---@param context userdata Context object supplied by the LoadingGame event.
function campaign_manager:load_named_value(value_name, default_value, context) end

--- Removes all units from the military force the supplied general character commands.
---@param general_character CHARACTER_SCRIPT_INTERFACE general character
function campaign_manager:remove_all_units_from_general(general_character) end

--- Pass-through function for infotext_manager:clear_infotext. Clears the infotext panel.
function campaign_manager:clear_infotext() end

--- Returns true if the supplied family member fought in the cached pending battle.
---@param family_member any Character to query. May be supplied as a family member object or as a cqi number.
function campaign_manager:pending_battle_cache_fm_is_involved(family_member) end

--- Returns the cqi and unit key of a specified unit on the specified defender in the pending battle cache, by index.
---@param defender_index number Index of attacking character within the pending battle cache.
---@param unit_unit number Index of unit belonging to the attacking character.
function campaign_manager:pending_battle_cache_get_defender_unit(defender_index, unit_unit) end

--- Returns the character within the supplied faction that's closest to the camera. An optional filter function may be supplied which is called for each character in the faction - the function will be passed the character and should return true if the character is eligible to returned.<br />
--- This function is inherently unsafe to use in multiplayer mode - in this case, the position of the specified faction's faction leader character is used as the position to test from.
---@param faction any Faction specifier. This can be a faction object or a string faction name.
---@param filter function Character filter callback. If supplied, this function will be called for each character in the faction and should return true if the character is to be considered in the results.
function campaign_manager:get_closest_character_from_filter_to_camera_from_faction(faction, filter) end

--- This function applies an effect bundle to a military force for a number of turns (can be infinite). It differs from campaign_manager:apply_effect_bundle_to_force by referring to the force by its commanding character's cqi.
---@param effect_bundle_key string Effect bundle key from the effect bundles table.
---@param number_cqi string Command queue index of the military force's commanding character to apply the effect bundle to.
---@param turns number Number of turns to apply the effect bundle for. Supply 0 here to apply the effect bundle indefinitely (it can be removed later with campaign_manager:remove_effect_bundle_from_characters_force if required).
function campaign_manager:apply_effect_bundle_to_characters_force(effect_bundle_key, number_cqi, turns) end

--- Returns whether a pooled resource tracker has been started for the specified faction.
---@param faction_key string Key of the faction to query, from the factions database table.
function campaign_manager:are_pooled_resources_tracked_for_faction(faction_key) end

--- Returns true if any of the factions involved in the cached pending battle on either side were human controlled (whether local or not).
function campaign_manager:pending_battle_cache_human_is_involved() end

--- Removes a real callback previously added with campaign_manager:real_callback or campaign_manager:repeat_real_callback by name. All callbacks with a name matching that supplied will be cancelled and removed.<br />
--- This function call is passed through to timer_manager:remove_real_callback - this campaign_manager alias is provided purely for convenience.
---@param name string Name of callback to remove.
function campaign_manager:remove_real_callback(name) end

--- Returns true if the supplied character is a general, has an army, and that army is armed citizenry (i.e. a garrison).
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_manager:char_is_garrison_commander(character) end

--- Returns records relating to a particular defender in the cached pending battle. The defender is specified by numerical index, with the first being accessible at record 1. This function returns the cqi of the commanding character, the cqi of the military force, and the faction name.
---@param index_of_defender number index of defender
function campaign_manager:pending_battle_cache_get_defender(index_of_defender) end

--- Various game interface functions lookup characters using a lookup string. This function converts a character into a lookup string that can be used by code functions to find that same character. It may also be supplied a character cqi in place of a character object.
---@param character_or_character_cqi any character or character cqi
function campaign_manager:char_lookup_str(character_or_character_cqi) end

--- Returns true if any of the attacking factions in the cached pending battle are of the supplied subculture.
---@param subculture_key string subculture key
function campaign_manager:pending_battle_cache_subculture_is_attacker(subculture_key) end

--- Returns the local player faction name.
---@param force_result boolean Force the result to be returned instead of erroring in multiplayer.
function campaign_manager:get_local_faction_name(force_result) end

--- Registers a function to be called when the first tick occurs in a new game, whether singleplayer or multiplayer.
---@param callback function callback
function campaign_manager:add_first_tick_callback_new(callback) end

--- Prints information about certain campaign objects (characters, regions, factions or military force) to the debug console spool. Preferably don't call this - just call out(object) insead.
---@param campaign_object any campaign object
function campaign_manager:output_campaign_obj(campaign_object) end

--- Returns true if the campaign is new. A campaign is "new" if it has been saved only once before - this save occurs during startpos processing.<br />
--- Note that if the script fails during startpos processing, the counter will not have been saved and it's value will be 0 - in this case, the game may report that it's not new when it is. If you experience a campaign that behaves as if it's loading into a savegame when starting from fresh, it's probably because the script failed during startpos processing.
function campaign_manager:is_new_game() end

--- Returns the closest settlement from the specified subject faction to a specified position. The function returns the region of the closest settlement, although nil is returned if the source faction contains no settlements.<br />
--- By default the supplied co-ordinates should specify a logical position to test against. If the use-display-coordinates flag is set, then the supplied co-ordinates should be a display position.
---@param subject_faction any Subject faction specifier. This can be a faction object or a string faction key from the factions database table.
---@param x number x co-ordinate. This should be a logical co-ordinate by default, or a display co-ordinate if the use-display-coordinates flag is set.
---@param y number y co-ordinate. This should be a logical co-ordinate by default, or a display co-ordinate if the use-display-coordinates flag is set.
function campaign_manager:get_closest_settlement_from_faction_to_position(subject_faction, x, y) end

--- Returns true if any of the defending factions in the cached pending battle are of the supplied culture.
---@param culture_key string culture key
function campaign_manager:pending_battle_cache_culture_is_defender(culture_key) end

--- Instruct a character at the head of a military force to attack another. This function is a wrapper for the cm:attack function on the underlying episodic scripting interface. The wrapper also enables movement for the character and prints debug output.
---@param attacker string Attacker character string, uses standard character lookup string system.
---@param defender string Defender character string, uses standard character lookup string system.
---@param lay_siege boolean Should the force lay siege.
---@param ignore_shroud_restrictions boolean Should the attack command ignore shroud restrictions. If this is set to false, the attacker must be able to see the target for the attack to commence.
function campaign_manager:attack(attacker, defender, lay_siege, ignore_shroud_restrictions) end

--- Returns whether a pending battle is active (i.e. we are immediately pre-battle or post-battle). If the pending battle is active the function will also return whether the battle has been fought (note however that on the first tick when returning from battle this will still be false).
function campaign_manager:is_pending_battle_active() end

--- Returns the cached subculture key of the local human player. If no local faction has been set then a blank string is returned - this should only happen in autoruns.
---@param force_result boolean Force the result to be returned instead of erroring in multiplayer.
function campaign_manager:get_local_faction_subculture(force_result) end

--- Adds the player faction's script folder for the current campaign to the lua path (script/campaign/%campaign_name%/factions/%player_faction_name%/), so that scripts related to the faction can be loaded with the require command. Unlike campaign_manager:require_path_to_campaign_folder this can only be called after the game state has been created. A name for this campaign must have been set with campaign_manager:new or campaign_manager:set_campaign_name prior to calling this function.
function campaign_manager:require_path_to_campaign_faction_folder() end

--- Returns true if the supplied character was an attacker in the cached pending battle.
---@param character any Character to query. May be supplied as a character object or as a cqi number.
function campaign_manager:pending_battle_cache_char_is_attacker(character) end

--- Displays some advice. The advice to display is specified by advice_thread key.
---@param advice_key string Advice thread key.
---@param show_progress_button boolean Show progress/close button on the advisor panel.
---@param highlight_progress_button boolean Highlight the progress/close button on the advisor panel.
---@param callback function End callback to call once the advice VO has finished playing.
---@param playtime number Minimum playtime for the advice VO in seconds. If this is longer than the length of the VO audio, the end callback is not called until after this duration has elapsed. If no end callback is set this has no effect. This is useful during development before recorded VO is ready for simulating the advice being played for a certain duration - with no audio, the advice would complete immediately, or not complete at all.
---@param delay number Delay in seconds to wait after the advice has finished before calling the supplied end callback. If no end callback is supplied this has no effect.
function campaign_manager:show_advice(advice_key, show_progress_button, highlight_progress_button, callback, playtime, delay) end

--- Returns true if the supplied character is a general and has an army, false otherwise. This includes garrison commanders - to only return true if the army is mobile use campaign_manager:char_is_mobile_general_with_army.
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_manager:char_is_general_with_army(character) end

--- Returns the family member cqi of a particular attacker in the cached pending battle. The attacker is specified by numerical index, with the first being accessible at record 1.
---@param index_of_attacker number index of attacker
function campaign_manager:pending_battle_cache_get_attacker_fm_cqi(index_of_attacker) end

--- Returns true if the supplied faction has any armies in the supplied region, false otherwise.
---@param faction FACTION_SCRIPT_INTERFACE faction
---@param region REGION_SCRIPT_INTERFACE region
function campaign_manager:faction_has_nap_with_faction(faction, region) end

--- Returns true if the supplied character is of type 'general', false otherwise.
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_manager:char_is_general(character) end

--- Returns the number of attacking armies in the cached pending battle.
function campaign_manager:pending_battle_cache_num_attackers() end

--- Returns true if the pending battle has been won by the attacker, false otherwise.
function campaign_manager:pending_battle_cache_attacker_victory() end

--- Registers a function to be called when the first tick occurs in a multiplayer game, whether new or loaded from a savegame.
---@param callback function callback
function campaign_manager:add_first_tick_callback_mp_each(callback) end

--- Adds a listener for the FactionTurnStart event which triggers if a faction with the supplied culture key starts a turn.
---@param listener_name string Name by which this listener can be later cancelled using campaign_manager:remove_faction_turn_start_listener_by_culture if necessary. It is valid to have multiple listeners with the same name.
---@param culture_key string Culture key to watch for, from the cultures database table.
---@param callback function Callback to call if a faction of the specified culture starts a turn.
---@param persistent boolean Is this a persistent listener. If this value is false the listener will stop the first time the callback is triggered. If true, the listener will continue until cancelled with campaign_manager:remove_faction_turn_start_listener_by_culture.
function campaign_manager:add_faction_turn_start_listener_by_culture(listener_name, culture_key, callback, persistent) end

--- Returns the number of characters of the supplied type in the supplied faction.
---@param faction_object FACTION_SCRIPT_INTERFACE faction object
---@param character_type string character type
function campaign_manager:num_characters_of_type_in_faction(faction_object, character_type) end

--- Returns the closest settlement from the specified table of region keys to a foreign faction. The function returns the region of the closest settlement, although nil is returned if no closest region could be found.
---@param region_keys table Table of region keys, each a key from the campaign_map_regions database table.
---@param foreign_faction any Foreign faction specifier. This can be a faction object or a string faction key from the factions database table.
function campaign_manager:get_closest_settlement_from_table_to_faction(region_keys, foreign_faction) end

--- Removes the cache for the supplied cache name. If no cache name is specified the default cache (cache name "default") is deleted.
---@param cache_name string cache name
function campaign_manager:delete_cached_camera_position(cache_name) end

--- Returns true if the supplied garrison residence contains a building with the supplied key, false otherwise.
---@param garrison_residence GARRISON_RESIDENCE_SCRIPT_INTERFACE garrison residence
---@param building_key string building key
function campaign_manager:garrison_contains_building(garrison_residence, building_key) end

--- Removes a listener that was previously added with campaign_manager:add_faction_turn_start_listener_by_culture. Calling this won't affect other faction turn start listeners.
---@param listener_name string listener name
function campaign_manager:remove_faction_turn_start_listener_by_culture(listener_name) end

--- Returns whether the supplied region object is adjacent to regions owned by the supplied faction. If the region is owned by the faction then false is returned.
---@param region REGION_SCRIPT_INTERFACE region
---@param region FACTION_SCRIPT_INTERFACE region
function campaign_manager:region_adjacent_to_faction(region, region) end

--- Registers a function to be called before any other first tick callbacks. Callbacks registered with this function will be called regardless of what mode the campaign is being loaded in.
---@param callback function callback
function campaign_manager:add_pre_first_tick_callback(callback) end

--- Returns the force whose commanding general has the passed cqi. If no force is found then false is returned.
---@param general_cqi number general cqi
function campaign_manager:force_from_general_cqi(general_cqi) end

--- Updates an existing objective chain. This function passes its arguments through objectives_manager:update_objective_chain on the objectives manager - see the documentation on that function for more information.
---@param chain_name string Objective chain name.
---@param objective_key string Key of initial objective, from the scripted_objectives table.
---@param number_param_a number First numeric parameter - see the documentation for <a href="../battle/battle_manager.html#function:battle_manager:set_objective">battle_manager:set_objective for more details
---@param number_param_b number Second numeric parameter - see the documentation for <a href="../battle/battle_manager.html#function:battle_manager:set_objective">battle_manager:set_objective for more details
function campaign_manager:update_objective_chain(chain_name, objective_key, number_param_a, number_param_b) end

--- Returns true if a general with a mobile military force exists in the supplied faction with the supplied forename. Faction and forename are specified by string key.
---@param faction_key string Faction key.
---@param forename_key string Forename key in the full localisation lookup format i.e. [table]_[column]_[record_key].
function campaign_manager:general_with_forename_exists_in_faction_with_force(faction_key, forename_key) end

--- Forces war between two factions. This wraps the cm:force_declare_war function of the same name on the underlying episodic scripting interface, but adds validation and output. This output will be shown in the Lua - Design console spool.
---@param faction_key string Faction A key
---@param faction_key string Faction B key
---@param invite_faction_a_allies boolean Invite faction A's allies to the war
---@param invite_faction_b_allies boolean Invite faction B's allies to the war
function campaign_manager:force_declare_war(faction_key, faction_key, invite_faction_a_allies, invite_faction_b_allies) end

--- Returns the closest military force from the specified faction to a specified logical position. Nil is returned if the faction contains no military forces.
---@param faction_key string Faction key, from the factions table.
---@param x number Logical x co-ordinate.
---@param y number Logical y co-ordinate.
---@param include_garrisons boolean Include garrison armies from the subject faction.
function campaign_manager:get_closest_military_force_from_faction(faction_key, x, y, include_garrisons) end

--- Returns the character within the supplied faction that's closest to the camera. This function is inherently unsafe to use in multiplayer mode - in this case, the position of the specified faction's faction leader character is used as the position to test from.
---@param faction any Faction specifier. This can be a faction object or a string faction name.
---@param general_characters_only boolean Restrict search results to generals.
---@param include_garrison_commanders boolean Includes garrison commanders in the search results if set to true.
---@param visible_to_faction string Restricts search results to characters visible to the specified faction, by key from the factions database table.
function campaign_manager:get_closest_character_to_camera_from_faction(faction, general_characters_only, include_garrison_commanders, visible_to_faction) end

--- Registers a function to be called when the ui is created in any singleplayer game.
---@param callback function callback
function campaign_manager:add_ui_created_callback_sp_each(callback) end

--- Returns the number of regions controlled by a specified faction in a supplied province.
---@param province PROVINCE_SCRIPT_INTERFACE Province to query. This is specified by PROVINCE_SCRIPT_INTERFACE - see the <a href="../../scripting_doc.html">game interface documentation for more information.
---@param faction FACTION_SCRIPT_INTERFACE Faction to query. This is specified by FACTION_SCRIPT_INTERFACE - see the <a href="../../scripting_doc.html">game interface documentation for more information.
function campaign_manager:num_regions_controlled_in_province_by_faction(province, faction) end

--- Removes an effect bundle from a military force by cqi.
---@param effect_bundle_key string Effect bundle key from the effect bundles table.
---@param number_cqi string Command queue index of the military force to remove the effect from.
function campaign_manager:remove_effect_bundle_from_force(effect_bundle_key, number_cqi) end

--- Returns a character by it's command queue index. If no character with the supplied cqi is found then false is returned.
---@param cqi number cqi
function campaign_manager:get_character_by_cqi(cqi) end

--- Returns true if the supplied character is currently in any region from a supplied list, false otherwise.
---@param character CHARACTER_SCRIPT_INTERFACE character
---@param table_of_region_keys table table of region keys
function campaign_manager:char_is_in_region_list(character, table_of_region_keys) end

--- Releases a key stolen with campaign_manager:steal_key_with_callback, by unique name.
---@param name string Unique name for this key-steal entry.
---@param key string Key name.
function campaign_manager:release_key_with_callback(name, key) end
