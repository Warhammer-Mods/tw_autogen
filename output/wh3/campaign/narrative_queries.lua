
---@class narrative_queries
local narrative_queries = {}

--- Creates a narrative query that queries whether the specified faction can recruit a hero of the supplied list of types, and acts on the result. If the faction can recruit a hero then the positive trigger message(s) are fired, otherwise the negative trigger message(s) are fired.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction can recruit a hero. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction cannot recruit a hero. This can be a single string or a table of strings if multiple messages are desired.
---@param hero_types table Indexed table of string hero types. If no table is supplied then all hero types are matched.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:can_recruit_hero_of_type(unique_name, faction_key, trigger_message, positive_message, negative_message, hero_types, additional_condition) end

--- Creates a narrative query that queries whether the specified faction contains any hero, and acts on the result. If the faction contains any heroes then the positive trigger message(s) are fired, otherwise the negative trigger message(s) are fired.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction can recruit a hero. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction cannot recruit a hero. This can be a single string or a table of strings if multiple messages are desired.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:contains_any_hero(unique_name, faction_key, trigger_message, positive_message, negative_message, additional_condition) end

--- Creates a narrative query that queries whether the specified faction currently has an income level above the specified amount and acts on the result.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction has the required income. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction does not have the required income. This can be a single string or a table of strings if multiple messages are desired.
---@param income number Income amount.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:has_income(unique_name, faction_key, trigger_message, positive_message, negative_message, income, additional_condition) end

--- Creates a narrative query that queries whether the specified faction contains heroes of the specified type(s), and acts on the result. If the faction contains any matching heroes then the positive trigger message(s) are fired, otherwise the negative trigger message(s) are fired.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction can recruit a hero. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction cannot recruit a hero. This can be a single string or a table of strings if multiple messages are desired.
---@param hero_types table Indexed table of string character types to test against. If the specified faction contains any heroes matching any of the supplied types then a positive result is returned.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:contains_any_hero_of_type(unique_name, faction_key, trigger_message, positive_message, negative_message, hero_types, additional_condition) end

--- Creates a narrative query that queries whether the specified faction can recruit any hero and acts on the result. If the faction can recruit a hero then the positive trigger message(s) are fired, otherwise the negative trigger message(s) are fired.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction can recruit a hero. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction cannot recruit a hero. This can be a single string or a table of strings if multiple messages are desired.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:can_recruit_any_hero(unique_name, faction_key, trigger_message, positive_message, negative_message, additional_condition) end

--- Creates a narrative query that queries whether the specified faction has a defensive alliance. Zero or more faction keys, faction culture keys or faction subculture keys may be specified. Should the subject faction have a defensive alliance with any of the specified factions/cultures/subcultures, or should they have a defensive alliance with any faction if no filters are specified, then the query will return a positive result.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction can capture territory. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction cannot capture territory. This can be a single string or a table of strings if multiple messages are desired.
---@param target_faction string Faction key of a target faction which the subject should have an agreement with, from the factions database table. A table of string faction keys may be specified if more than one target faction is desired. In this case, the query passes if an agreement exists with any of the target factions in the list.
---@param target_culture string Culture key of a target faction which the subject should have an agreement with, from the cultures database table. A table of string culture keys may be specified if more than one target culture is desired. In this case, the query passes if an agreement exists with a faction of any of the target cultures in the list.
---@param target_subculture string Subculture key of a target faction which the subject should have an agreement with, from the cultures_subcultures database table. A table of string subculture keys may be specified if more than one target subculture is desired. In this case, the query passes if an agreement exists with a faction of any of the target subcultures in the list.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:has_defensive_alliance(unique_name, faction_key, trigger_message, positive_message, negative_message, target_faction, target_culture, target_subculture, additional_condition) end

--- Creates a narrative query that queries whether the specified faction is currently researching a technology and acts on the result.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction is currently researching a technology. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction is not currently researching a technology. This can be a single string or a table of strings if multiple messages are desired.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:is_researching(unique_name, faction_key, trigger_message, positive_message, negative_message, additional_condition) end

--- Creates a narrative query that queries whether a narrative event with the supplied name for the supplied faction has triggered in this savegame, and acts upon the result. If the narrative event has triggered then the positive trigger message(s) are fired, otherwise the negative trigger message(s) are fired, if any were supplied.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_trigger_message string Positive trigger message to fire if the saved value exists. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_trigger_message string Negative trigger message to fire if the saved value does not exist. This can be a single string or a table of strings if multiple messages are desired.
---@param narrative_event_name string Name of narrative event to query. This may also be a table of strings if multiple narrative events are to be queried.
---@param pass_on_all boolean Trigger the positive message if all specified narrative events have fired. If false or nil is supplied here then the positive message will be triggered if any of the specified narrative events have fired.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:narrative_event_has_triggered(unique_name, faction_key, trigger_message, positive_trigger_message, negative_trigger_message, narrative_event_name, pass_on_all, additional_condition) end

--- Creates a narrative query that queries a value in the savegame, looked up by the supplied key, and acts upon the result. If the value exists then the positive trigger message(s) are fired, otherwise the negative trigger message(s) are fired, if any were supplied.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_trigger_message string Positive trigger message to fire if the saved value exists. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_trigger_message string Negative trigger message to fire if the saved value does not exist. This can be a single string or a table of strings if multiple messages are desired.
---@param value_key string Key of value to look up from the savegame. This is passed to campaign_manager:get_saved_value to retrieve the value.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:savegame_value_exists(unique_name, faction_key, trigger_message, positive_trigger_message, negative_trigger_message, value_key, additional_condition) end

--- Creates a narrative query that queries the specified faction's territorial holdings and acts upon the result. Should the faction already fully control at least the supplied number of provinces then the positive message(s) are fired. Otherwise, the negative message(s) are fired, if any were supplied.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction is one settlement from completing a province. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction is not one settlement from completing a province. This can be a single string or a table of strings if multiple messages are desired.
---@param provinces number Number of provinces the faction has to fully control for the positive message to be forced.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:controls_x_provinces(unique_name, faction_key, trigger_message, positive_message, negative_message, provinces, additional_condition) end

--- Creates a narrative query that queries whether the specified faction currently has technologies available for research and acts on the result.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction has technologies available. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction does not have technologies available. This can be a single string or a table of strings if multiple messages are desired.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:has_available_technologies(unique_name, faction_key, trigger_message, positive_message, negative_message, additional_condition) end

--- Creates a narrative query that queries the specified faction's territorial holdings and acts upon the result. Should the faction be exactly one settlement away from complete control of any province the positive message(s) are fired. Otherwise, the negative message(s) are fired, if any were supplied.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction is one settlement from completing a province. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction is not one settlement from completing a province. This can be a single string or a table of strings if multiple messages are desired.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:one_settlement_from_completing_province(unique_name, faction_key, trigger_message, positive_message, negative_message, additional_condition) end

--- Creates a narrative query that queries the player's advice history against a supplied set of advice strings and advice keys when triggered.<br />
--- Up to four sets of data can be passed to the function, representing any advice strings, all advice strings, any advice keys and all advice keys. When the narrative query is triggered the data collections are checked in this order. Where they are present, their contents are checked and the advice-experienced message may be triggered.<br />
--- If all four collections are checked and the advice-experienced message has not been triggered, then the advice-not-experienced message is triggered (if one has been supplied).<br />
--- If triggered in multiplayer mode the narrative query always behaves as if the advice has been experienced, as the advice history will be different on different machines in a multiplayer game so it would not be safe to do otherwise.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param experienced_message string Message to trigger if the player has experienced the supplied advice. This can be a single string or a table of strings if multiple messages are desired.
---@param not_experienced_message string Message to trigger if the player has not experienced the supplied advice. This can be a single string or a table of strings if multiple messages are desired.
---@param any_advice_strings table Any advice strings table. When triggered, the narrative trigger will check the history of advice strings supplied in this table using the function common.get_advice_history_string_seen. If any advice strings in this table have been experienced by the local player then the advice-experienced message is triggered.
---@param all_advice_strings table All advice strings table. When triggered, the narrative trigger will check the history of all advice keys supplied in this table using the function common.get_advice_history_string_seen. If all advice strings in this table have been experienced by the local player then the advice-experienced message is triggered.
---@param any_advice_keys table Any advice keys table. When triggered, the narrative trigger will check the history of advice keys supplied in this table using the function common.get_advice_thread_score. If any advice items represented by keys in this table have been experienced by the local player then the advice-experienced message is triggered.
---@param all_advice_keys table All advice keys table. When triggered, the narrative trigger will check the history of all advice keys supplied in this table using the function common.get_advice_thread_score. If all advice items represented by keys in this table have been experienced by the local player then the advice-experienced message is triggered.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:advice_history(unique_name, faction_key, trigger_message, experienced_message, not_experienced_message, any_advice_strings, all_advice_strings, any_advice_keys, all_advice_keys, additional_condition) end

--- Creates a narrative query that queries whether any regions adjacent to the specified faction contain corruption of the specified type equal to or above the supplied threshold, and acts on the result. If any adjacent region meets the corruption threshold then the positive trigger message(s) are fired, otherwise the negative trigger message(s) are fired.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction can recruit a hero. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction cannot recruit a hero. This can be a single string or a table of strings if multiple messages are desired.
---@param corruption_key string Message to trigger if the faction cannot recruit a hero. This can be a single string or a table of strings if multiple messages are desired.
---@param culture_key string Culture key of region owner to exclude. If an eligible region has a faction owner with this culture, the region will not be included.
---@param corruption_type string Corruption type, from the pooled_resources database table.
---@param threshold_value number Threshold value which the corruption must meet or exceed in an adjacent region for the query to pass.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:corruption_in_adjacent_region(unique_name, faction_key, trigger_message, positive_message, negative_message, corruption_key, culture_key, corruption_type, threshold_value, additional_condition) end

--- Creates a narrative query that queries whether the value of one or more pooled resources for a specified faction is equal to or greater than a specified value. If more than one pooled resource is specified, then the query triggers its positive message if any of the pooled resources meet or exceed the threshold.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction can capture territory. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction cannot capture territory. This can be a single string or a table of strings if multiple messages are desired.
---@param pooled_resource_key string Pooled resource key, from the pooled resources database table. If more than one pooled resource is to be queried then a table of strings may be specified here.
---@param threshold_value number Threshold value, which the pooled resource should meet or exceed for the positive message to be triggered.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:has_pooled_resource(unique_name, faction_key, trigger_message, positive_message, negative_message, pooled_resource_key, threshold_value, additional_condition) end

--- Creates a narrative query that interrogates the player's advice history for a narrative chain. If all of the supplied set of advice keys or any of the supplied set of advice strings are in the advice history, or it's a multiplayer game, or the campaign difficulty is very hard or above, then the positive target message(s) are triggered. Otherwise, the negative target message(s) are triggered, if any have been supplied.<br />
--- If triggered in multiplayer mode the narrative query always behaves as if the advice has been experienced, as the advice history will be different on different machines in a multiplayer game so it would not be safe to do otherwise.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param experienced_message string Target message to trigger if the player has experienced the supplied advice. This can be a single string or a table of strings if multiple messages are desired.
---@param not_experienced_message string Target message to trigger if the player has not experienced the supplied advice. This can be a single string or a table of strings if multiple messages are desired.
---@param all_advice_strings table All advice strings table. When triggered, the narrative trigger will check the history of advice strings supplied in this table using the function common.get_advice_history_string_seen. If all advice strings in this table have been experienced by the local player then the advice-experienced message is triggered.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:advice_history_for_narrative_chain(unique_name, faction_key, trigger_message, experienced_message, not_experienced_message, all_advice_strings, additional_condition) end

--- Creates a narrative query that queries whether the specified faction has a military alliance. Zero or more faction keys, faction culture keys or faction subculture keys may be specified. Should the subject faction have a military alliance with any of the specified factions/cultures/subcultures, or should they have a military alliance with any faction if no filters are specified, then the query will return a positive result.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction can capture territory. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction cannot capture territory. This can be a single string or a table of strings if multiple messages are desired.
---@param target_faction string Faction key of a target faction which the subject should have an agreement with, from the factions database table. A table of string faction keys may be specified if more than one target faction is desired. In this case, the query passes if an agreement exists with any of the target factions in the list.
---@param target_culture string Culture key of a target faction which the subject should have an agreement with, from the cultures database table. A table of string culture keys may be specified if more than one target culture is desired. In this case, the query passes if an agreement exists with a faction of any of the target cultures in the list.
---@param target_subculture string Subculture key of a target faction which the subject should have an agreement with, from the cultures_subcultures database table. A table of string subculture keys may be specified if more than one target subculture is desired. In this case, the query passes if an agreement exists with a faction of any of the target subcultures in the list.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:has_military_alliance(unique_name, faction_key, trigger_message, positive_message, negative_message, target_faction, target_culture, target_subculture, additional_condition) end

--- Creates a narrative query that queries whether the specified faction has concocted a threshold number of Nurgle plagues, and acts on the result.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction can capture territory. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction cannot capture territory. This can be a single string or a table of strings if multiple messages are desired.
---@param plagues number THreshold number of plagues.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:has_concocted_plagues(unique_name, faction_key, trigger_message, positive_message, negative_message, plagues, additional_condition) end

--- Creates a narrative query that queries whether the specified faction has a trade agreement. Zero or more faction keys, faction culture keys or faction subculture keys may be specified. Should the subject faction have a trade agreement with any of the specified factions/cultures/subcultures, or should they have a trade agreement with any faction if no filters are specified, then the query will return a positive result.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction can capture territory. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction cannot capture territory. This can be a single string or a table of strings if multiple messages are desired.
---@param target_faction string Faction key of a target faction which the subject should have an agreement with, from the factions database table. A table of string faction keys may be specified if more than one target faction is desired. In this case, the query passes if an agreement exists with any of the target factions in the list.
---@param target_culture string Culture key of a target faction which the subject should have an agreement with, from the cultures database table. A table of string culture keys may be specified if more than one target culture is desired. In this case, the query passes if an agreement exists with a faction of any of the target cultures in the list.
---@param target_subculture string Subculture key of a target faction which the subject should have an agreement with, from the cultures_subcultures database table. A table of string subculture keys may be specified if more than one target subculture is desired. In this case, the query passes if an agreement exists with a faction of any of the target subcultures in the list.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:has_trade_agreement(unique_name, faction_key, trigger_message, positive_message, negative_message, target_faction, target_culture, target_subculture, additional_condition) end

--- Creates a narrative query that queries whether the specified faction has a non-aggression pact. Zero or more faction keys, faction culture keys or faction subculture keys may be specified. Should the subject faction have a non-aggression pact with any of the specified factions/cultures/subcultures, or should they have a non-aggression pact with any faction if no filters are specified, then the query will return a positive result.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction can capture territory. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction cannot capture territory. This can be a single string or a table of strings if multiple messages are desired.
---@param target_faction string Faction key of a target faction which the subject should have an agreement with, from the factions database table. A table of string faction keys may be specified if more than one target faction is desired. In this case, the query passes if an agreement exists with any of the target factions in the list.
---@param target_culture string Culture key of a target faction which the subject should have an agreement with, from the cultures database table. A table of string culture keys may be specified if more than one target culture is desired. In this case, the query passes if an agreement exists with a faction of any of the target cultures in the list.
---@param target_subculture string Subculture key of a target faction which the subject should have an agreement with, from the cultures_subcultures database table. A table of string subculture keys may be specified if more than one target subculture is desired. In this case, the query passes if an agreement exists with a faction of any of the target subcultures in the list.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:has_non_aggression_pact(unique_name, faction_key, trigger_message, positive_message, negative_message, target_faction, target_culture, target_subculture, additional_condition) end

--- Creates a narrative query that queries whether the specified faction can capture territory, and acts on the result. If the faction cannot capture territory they are presumably a horde faction. If the faction can capture territory then the positive trigger message(s) are fired, otherwise the negative trigger message(s) are fired.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction can capture territory. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction cannot capture territory. This can be a single string or a table of strings if multiple messages are desired.
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:can_capture_territory(unique_name, faction_key, trigger_message, positive_message, negative_message, additional_condition) end

--- Creates a narrative query that queries the specified faction's highest-level settlement and acts on the result. Should the level of the highest-level settlement be equal to or greater than the supplied query level then the positive message(s) are fired. Otherwise, the negative message(s) are fired, if any were supplied.
---@param unique_name string Unique name amongst other declared narrative queries.
---@param faction_key string Key of the faction to which this narrative query applies, from the factions database table.
---@param trigger_message string Message on which this narrative query should trigger. If multiple trigger messages are required a table containing string message names can be supplied here instead.
---@param positive_message string Message to trigger if the faction has a settlement at or above the query level. This can be a single string or a table of strings if multiple messages are desired.
---@param negative_message string Message to trigger if the faction does not have a settlement at or above the query level. This can be a single string or a table of strings if multiple messages are desired.
---@param query_level number Minimum level the highest-level settlement of the faction must be in order to trigger the positive result message(s).
---@param additional_condition function The condition function may also return a string as a second return value, which will be used for output.
function narrative_queries:highest_level_settlement_for_faction(unique_name, faction_key, trigger_message, positive_message, negative_message, query_level, additional_condition) end
