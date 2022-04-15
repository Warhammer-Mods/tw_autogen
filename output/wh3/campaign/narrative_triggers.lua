
---@class narrative_triggers
local narrative_triggers = {}

--- Creates and starts a narrative trigger that listens for a start message from another narrative object associated with one faction, and then sends one or more target messages associated with another faction. This can be useful if a desired narrative sequence flows over the player changing faction.<br />
--- The target messages are always triggered immediately, with no intervention being created in singleplayer mode.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table. This should be the originator faction.
---@param start_message string Message on which this narrative trigger should initiate the faction switch process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param target_message string Target message or messages to trigger when this narrative trigger fires. These target message(s) will be associated with the target faction. If multiple target messages are required then a table containing string message names can be supplied here instead. This message/these messages will be associated with the specified target faction rather than the source faction.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param target_faction_key string Key of the target faction, to which the outgoing target message(s) will be associated.
function narrative_triggers:faction_switch(unique_name, faction_key, start_message, target_message, cancel_message, target_faction_key) end

--- Creates and starts a narrative trigger that fires when a dilemma choice is made.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param dilemma_key string Key of dilemma to listen for, from the dilemmas database table.
---@param choice_value number Integer choice value.
function narrative_triggers:dilemma_choice_made(unique_name, faction_key, start_message, target_message, cancel_message, dilemma_key, choice_value) end

--- Creates and starts a narrative trigger that fires when a hero character in the specified faction has participated in a certain number of battle victories. An optional condition function may also be specified which is passed the context object supplied by the underlying CharacterCompletedBattle script event.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param victories number Threshold number of victories.
---@param condition function The condition function may also return a second boolean return value, which suppresses downstream output. This can be set if the condition function handles output itself.
function narrative_triggers:any_hero_won_x_battles(unique_name, faction_key, start_message, target_message, cancel_message, victories, condition) end

--- Creates and starts a narrative trigger that fires when the number of provinces the specified faction fully controls is greater than or equal to the supplied threshold.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param threshold number Provinces threshold.
function narrative_triggers:controls_provinces(unique_name, faction_key, start_message, target_message, cancel_message, threshold) end

--- Creates and starts a narrative trigger that fires when the specified faction establishes a foreign slot. Whether the foreign slot should be allied to the region it's embedded in or not may optionally be specified.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param should_be_allied boolean Should the foreign slot be allied to the region its embedded in or not. If nil (or no value) is supplied here then the trigger fires in either case.
function narrative_triggers:foreign_slot_established(unique_name, faction_key, start_message, target_message, cancel_message, should_be_allied) end

--- Creates and starts a narrative trigger that fires when the specified faction has an amount of a specified pooled resource equal to or greater than a specified threshold.<br />
--- An optional flag makes the narrative trigger instead fire when the pooled resource is less than or equal to the threshold.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param pooled_resource_key string Key of the pooled resource to monitor, from the pooled_resources database table. this can also be a table of multiple pooled resource keys.
---@param threshold_value number Threshold value that the pooled resoure must meet or exceed for subject faction for trigger to fire.
---@param less_than boolean Trigger when the pooled resource is less than or equal to the threshold value, rather than greater than.
function narrative_triggers:pooled_resource_gained(unique_name, faction_key, start_message, target_message, cancel_message, pooled_resource_key, threshold_value, less_than) end

--- Creates and starts a narrative trigger that listens for a message from another narrative object, and then waits a specified number of turns (for the specified faction) before sending one or more target messages.<br />
--- The target messages are always triggered immediately, with no intervention being created in singleplayer mode.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its turn countdown. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead. This message/these messages will be associated with the specified target faction rather than the source faction.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param turns number Number of turns to wait.
---@param Immediate boolean Trigger the target message(s) immediately when the event is received and the optional condition is met.
function narrative_triggers:turn_countdown(unique_name, faction_key, start_message, target_message, cancel_message, turns, Immediate) end

--- Creates and starts a narrative trigger that fires when the specified faction controls a settlement or camp where the level of the main settlement building is greater than or equal to a specified value.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param threshold number Settlement building level threshold.
function narrative_triggers:highest_level_settlement(unique_name, faction_key, start_message, target_message, cancel_message, threshold) end

--- Creates and starts a narrative trigger that fires when the specified faction starts a turn and any of its military forces can reach any of the settlements of a specified target faction to attack this turn. An optional flag also includes the target faction's armies in this assessment.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param target_faction_key string Key of the target faction, from the factions database table.
---@param include_armies boolean Includes the target faction's roving armies in the can-reach check, as well as their settlements.
function narrative_triggers:can_reach_faction(unique_name, faction_key, start_message, target_message, cancel_message, target_faction_key, include_armies) end

--- Creates and starts a narrative trigger that fires when the specified faction completes the research of a technology. A list of zero or more technology keys can be supplied which the technology must be in. Additionally, a condition function may be supplied which must be passed if the trigger is to fire.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param technology_key string Technology key, from the technologies database table, which the subject technology must match for the trigger to fire. A table of string technology keys may be supplied here, in which case the trigger will fire if the subject technology is in the list. Additionally, nil may be specified, in which case any technology matches.
---@param condition function An additional condition function which, if supplied, must be passed for the trigger to fire. The condition function will be passed the context object from the ResearchCompleted event and the narrative trigger as two separate arguments, and should return true if the trigger is allowed to fire.
function narrative_triggers:technology_research_completed(unique_name, faction_key, start_message, target_message, cancel_message, technology_key, condition) end

--- Creates and starts a narrative trigger that fires when the specified faction has gained a growth point in a specified province, or any controlled territory if no province is specified.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param upgrade_available_only boolean The narrative trigger should only fire when a growth point is earned in a player-controlled region and an upgrade of the main settlement chain is available.
---@param province_key string Key of province in which the growth point must be earned. This can also be a table of string province keys. If left blank, then any growth point earned by the specified faction is counted.
function narrative_triggers:growth_point_gained(unique_name, faction_key, start_message, target_message, cancel_message, upgrade_available_only, province_key) end

--- Creates and starts a narrative trigger that fires when a hero character performs a successful action for the specified faction. An optional condition function may also be specified which is passed the context object supplied by the underlying CharacterCharacterTargetAction script event.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param condition function The condition function may also return a second boolean return value, which suppresses downstream output. This can be set if the condition function handles output itself.
function narrative_triggers:hero_action_performed(unique_name, faction_key, start_message, target_message, cancel_message, condition) end

--- Creates and starts a narrative trigger that fires when the specified faction starts researching a technology. A list of zero or more technology keys can be supplied which the technology must be in. Additionally, a condition function may be supplied which must be passed if the trigger is to fire.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param technology_key string Technology key, from the technologies database table, which the subject technology must match for the trigger to fire. A table of string technology keys may be supplied here, in which case the trigger will fire if the subject technology is in the list. Additionally, nil may be specified, in which case any technology matches.
---@param condition function An additional condition function which, if supplied, must be passed for the trigger to fire. The condition function will be passed the context object from the ResearchStarted event and the narrative trigger as two separate arguments, and should return true if the trigger is allowed to fire.
function narrative_triggers:technology_research_started(unique_name, faction_key, start_message, target_message, cancel_message, technology_key, condition) end

--- Creates and starts a narrative trigger that fires when the specified faction performs a ritual. One or more optional ritual keys, ritual categories and target faction keys may be specified which the ritual performed must satisfy. Where a list of ritual keys/ritual categories/target faction keys is given, the ritual performed must match one of those in the list to qualify.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param ritual_keys string Key(s) of ritual(s), from the rituals database table. This can be a string ritual key or a table of strings. If no ritual keys are specified then any rituals match.
---@param ritual_categories string Key(s) of ritual category/categories, from the ritual_categories database table. This can be a string category key or a table of strings. If no categories are specified then any rituals match.
---@param target_faction_keys string Key(s) of any target factions, from the factions database table. This can be a string faction key or a table of strings. If no target factions are specified then any targets match.
function narrative_triggers:ritual_performed(unique_name, faction_key, start_message, target_message, cancel_message, ritual_keys, ritual_categories, target_faction_keys) end

--- Creates and starts a narrative trigger that fires when a character in the specified faction performs a character action (hero action). One or more optional action keys, performing character subtypes and/or target faction keys may be specified which the action performed must satisfy. It may also be specified whether the action must have succeeded to qualify.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param target_faction_keys string Key(s) of character ability/abilities, from the abilities database table. This can be a string ability key or a table of strings. If no ability keys are specified then any abilities match.
---@param char_subtypes string Key(s) of any target factions, from the factions database table. This can be a string faction key or a table of strings. If no target factions are specified then any targets match.
---@param must_be_success string Key(s) of character subtypes of the performing character, from the agent_subtypes database table. This can be a string subtype key or a table of strings. If no subtypes are specified then any performing characters match.
function narrative_triggers:character_action(unique_name, faction_key, start_message, target_message, cancel_message, target_faction_keys, char_subtypes, must_be_success) end

--- Creates and starts a narrative trigger that fires when the amount of corruption in any adjacent region to the specified faction reaches a specified threshold.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param corruption_type string Corruption type, from the pooled_resources database table.
---@param threshold_value number Threshold value which the corruption must meet or exceed in an adjacent region for the trigger condition to be met.
---@param culture_key string Culture key of region owner to exclude. If an eligible region has a faction owner with this culture, the region will not be included.
function narrative_triggers:corruption_in_adjacent_region(unique_name, faction_key, start_message, target_message, cancel_message, corruption_type, threshold_value, culture_key) end

--- Creates and starts a narrative trigger that fires when the specified faction starts a turn and any of its military forces can reach any of the specified settlements to attack this turn. An optional flag also includes the subject faction's agents in this assessment, as well as military forces.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param target_settlements string Key of the region containing the target settlement, from the campaign_map_regions database table. If multiple target settlements are desired then a table containing multiple string keys may be supplied here.
---@param include_agents boolean Include the source faction's agents/heroes in the can-reach assessment.
function narrative_triggers:can_reach_settlement(unique_name, faction_key, start_message, target_message, cancel_message, target_settlements, include_agents) end

--- Creates and starts a narrative trigger that fires when the specified faction starts construction on a building. An optional condition function may be specified which is passed the context object supplied by the underlying BuildingConstructionIssuedByPlayer script event.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param condition function The condition function may also return a second boolean return value, which suppresses downstream output. This can be set if the condition function handles output itself.
function narrative_triggers:building_construction_issued(unique_name, faction_key, start_message, target_message, cancel_message, condition) end

--- Creates and starts a narrative trigger that fires when the specified faction starts a turn with a net income greater than or equal to, or less than or equal to, a specified value.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param threshold number Net income threshold.
---@param trigger_when_lower boolean If set to true, the narrative trigger fires when the net income is less than or equal to the specified threshold instead of greater than or equal to.
function narrative_triggers:net_income(unique_name, faction_key, start_message, target_message, cancel_message, threshold, trigger_when_lower) end

--- Creates and starts a narrative trigger that fires when the specified faction has an amount of the skulls pooled resource equal to or greater than a specified threshold.<br />
--- An optional flag makes the narrative trigger instead fire when the pooled resource is less than or equal to the threshold.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param threshold_value number Threshold value that the pooled resoure must meet or exceed for subject faction for trigger to fire.
---@param less_than boolean Trigger when the pooled resource is less than or equal to the threshold value, rather than greater than.
function narrative_triggers:skulls_gained(unique_name, faction_key, start_message, target_message, cancel_message, threshold_value, less_than) end

--- Creates and starts a narrative trigger that fires when the specified faction has an amount of the devotion pooled resource equal to or greater than a specified threshold.<br />
--- An optional flag makes the narrative trigger instead fire when the pooled resource is less than or equal to the threshold.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param threshold_value number Threshold value that the pooled resoure must meet or exceed for subject faction for trigger to fire.
---@param less_than boolean Trigger when the pooled resource is less than or equal to the threshold value, rather than greater than.
function narrative_triggers:devotion_gained(unique_name, faction_key, start_message, target_message, cancel_message, threshold_value, less_than) end

--- Triggers a message when a different message is received for the specified faction. Instead of using this, it is encouraged to make the narrative entity triggering the incoming message to instead just trigger the target message as well/instead, making this intermediate narrative trigger redundant. However, there are circumstances which can make the creation of an intermediate trigger desirable.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param trigger_message string Message on which this narrative trigger should trigger. If multiple trigger messages are required then a table containing string message names can be supplied here instead.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel. If multiple messages are required then a table containing string message names can be supplied here instead.
function narrative_triggers:message(unique_name, faction_key, trigger_message, target_message, cancel_message) end

--- Creates and starts a narrative trigger that attempts to trigger when a specified event is received. An optional condition function may also be supplied, which must be passed for the narrative trigger to fire its target events. If supplied, the condition function will be called when the specified event is received, and will be passed the event context and the narrative trigger object as separate arguments. It must return a value that evaluates to true for the condition to pass. If no condition function is supplied then the condition always passes.<br />
--- If the immediate flag is set, or if it is a multiplayer game, then the narrative trigger will immediately trigger the target messages when the event is received and condition passes. If the flag is not set and it's a singleplayer game the narrative will instead create an intervention which will fire the target messages when it gets to trigger.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param event_name string Event name to listen for.
---@param condition function Condition function to call when the event is received. The event context and narrative trigger objects are provided to the function as arguments. If no condition function is supplied then the condition always passes.
---@param Immediate boolean Trigger the target message(s) immediately when the event is received and the optional condition is met.
function narrative_triggers:generic(unique_name, faction_key, start_message, target_message, cancel_message, event_name, condition, Immediate) end

--- Creates and starts a narrative trigger that fires when the specified faction starts construction on a building that unlocks a technology. An additional optional condition function may be specified which is passed the context object supplied by the underlying BuildingConstructionIssuedByPlayer script event.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param condition function The condition function may also return a second boolean return value, which suppresses downstream output. This can be set if the condition function handles output itself.
function narrative_triggers:technology_building_construction_issued(unique_name, faction_key, start_message, target_message, cancel_message, condition) end

--- Creates and starts a narrative trigger that fires when the specified faction has an amount of a specified pooled resource equal to or greater than a specified threshold. This differs from narrative_triggers.pooled_resource_gained as it allows the faction which is being monitored to be different from the faction with which the triggered messages are associated with.<br />
--- An optional flag makes the narrative trigger instead fire when the pooled resource is less than or equal to the threshold.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction with which the triggered messages are associated with, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param pooled_resource_faction_key string Key of the faction whose pooled resources are being monitored, from the factions database table.
---@param pooled_resource_key string Key of the pooled resource to monitor, from the pooled_resources database table. this can also be a table of multiple pooled resource keys.
---@param threshold_value number Threshold value that the pooled resoure must meet or exceed for subject faction for trigger to fire.
---@param less_than boolean Trigger when the pooled resource is less than or equal to the threshold value, rather than greater than.
function narrative_triggers:faction_pooled_resource_gained(unique_name, faction_key, start_message, target_message, cancel_message, pooled_resource_faction_key, pooled_resource_key, threshold_value, less_than) end

--- Creates and starts a narrative trigger that fires when a lord in the specified faction has participated in a certain number of battle victories. An optional condition function may also be specified which is passed the context object supplied by the underlying CharacterCompletedBattle script event.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param victories number Threshold number of victories.
---@param condition function The condition function may also return a second boolean return value, which suppresses downstream output. This can be set if the condition function handles output itself.
function narrative_triggers:any_general_won_x_battles(unique_name, faction_key, start_message, target_message, cancel_message, victories, condition) end

--- Creates and starts a narrative trigger that fires when a general/lord character is created for the specified faction. An optional condition function may also be specified which is passed the context object supplied by the underlying CharacterCreated script event.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param condition function The condition function may also return a second boolean return value, which suppresses downstream output. This can be set if the condition function handles output itself.
function narrative_triggers:general_created(unique_name, faction_key, start_message, target_message, cancel_message, condition) end

--- Creates and starts a narrative trigger that attempts to trigger on start of turn for the specified faction. An optional condition function may also be supplied, which must be passed for the narrative trigger to fire its target events. If supplied, the condition function will be called when the faction starts its turn and will be passed the context of the FactionTurnStart event and the narrative trigger object as separate arguments. It must return a value that evaluates to true for the condition to pass. If no condition function is supplied then the condition always passes.<br />
--- If the immediate flag is set, or if it is a multiplayer game, then the narrative trigger will immediately trigger the target messages when the turn start event is received. If the flag is not set and it's a singleplayer game the narrative will instead create an intervention which will fire the target messages when it gets to trigger.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param condition function If no condition function is supplied here then the condition always passes.
---@param faction_starting_turn string Key of the faction whose turn start we should listen for. If nil is supplied here then the key of the faction to which this narrative trigger applies is used.
---@param Immediate boolean Trigger the target message(s) immediately when the event is received and the optional condition is met.
function narrative_triggers:turn_start(unique_name, faction_key, start_message, target_message, cancel_message, condition, faction_starting_turn, Immediate) end

--- Creates and starts a narrative trigger that fires when an agent/hero character is created for the specified faction. An optional condition function may also be specified which is passed the context object supplied by the underlying CharacterCreated script event.
---@param unique_name string Unique name amongst other declared narrative triggers.
---@param faction_key string Key of the faction to which this narrative trigger applies, from the factions database table.
---@param start_message string Message on which this narrative trigger should start its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead. If no start messages are specified, then the trigger will start its main listeners when it is started.
---@param target_message string Target messages to trigger when this narrative trigger fires. If multiple target messages are required then a table containing string message names can be supplied here instead.
---@param cancel_message string Message on which this narrative trigger should cancel its main listening process. If multiple messages are required then a table containing string message names can be supplied here instead.
---@param condition function The condition function may also return a second boolean return value, which suppresses downstream output. This can be set if the condition function handles output itself.
function narrative_triggers:agent_created(unique_name, faction_key, start_message, target_message, cancel_message, condition) end
