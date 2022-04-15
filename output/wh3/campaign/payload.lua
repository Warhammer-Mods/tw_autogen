
---@class payload
local payload = {}

--- Returns a mission reward string that adds the specified ancillary to the faction pool when the mission being constructed is completed.
---@param ancillary_key string Ancillary key, from the ancillaries database table.
---@param faction_key string Faction key, from the factions database table.
---@param ancillary_category string Ancillary category. Valid values are presently "armour", "enchanted_item">, "banner">, "talisman">, "weapon" and "arcane_item". Arcane items may only be equipped by spellcasters.
---@param ancillary_rarity string Ancillary rarity. Valid values are presently "common", "uncommon" and "rare".
function payload:ancillary_mission_payload(ancillary_key, faction_key, ancillary_category, ancillary_rarity) end

--- Returns a payload string which defines a Skulls reward for a Khorne string mission definition. No kind of equivalence is looked up.
---@param amount number amount
function payload:skulls(amount) end

--- Adds a payload remapping for a particular faction, for money. Once this remapping is established, payloads for this faction set up with payload.money will instead be replaced with an alternative. The alternative is determined by the callback that is supplied to this function.<br />
--- When a money payload is requested, the callback will be called and supplied three arguments - the amount of money to add, the faction key, and a table of arbitrary parameters supplied to payload.money that can be used to determine the equivalent payload. What goes in to this table of arbitrary parameters can be decided by the implementer, but what is added to each mission specification should match what the callback looks for.
---@param faction_key string faction key
---@param remapping_callback function remapping callback
function payload:add_money_equivalence_mapping(faction_key, remapping_callback) end

--- Returns a payload string which defines a Supporters reward for a Kislev string mission definition. No kind of equivalence is looked up.
---@param amount number amount
function payload:supporters(amount) end

--- Returns a payload string which defines an Infections reward for a Nurgle string mission definition. No kind of equivalence is looked up.
---@param amount number amount
function payload:infections(amount) end

--- Returns a mission reward string that adds the specified quantity of the specified pooled resource with the specified factor when the mission being constructed is completed.
---@param pooled_resource_key string Pooled resource key, from the pooled_resources database table.
---@param factor_key string Factor key, from the factor field in the pooled_resource_factor_junctions database table.
---@param quantity number Quantity of pooled resource to award.
function payload:pooled_resource_mission_payload(pooled_resource_key, factor_key, quantity) end

--- Returns a payload string which defines a Meat reward for an Ogre Kingdoms string mission definition. No kind of equivalence is looked up.
---@param amount number amount
function payload:meat(amount) end

--- Returns a payload string which defines a Khorne glory reward for a Daemons of Chaos string mission definition. No kind of equivalence is looked up.
---@param amount number amount
function payload:khorne_glory(amount) end

--- Returns a payload string which defines an agent reward for a string mission definition, for a faction. This differs from payload.agent in that this function takes a faction key, and looks up the home region of that faction. If the faction has no home region, then a script error is thrown and money is substituted.
---@param faction_key string Key of faction for which the agent is being spawned, from the factions table. This is used to specify the region in which the agent is spawned - the home region of the faction is used.
---@param agent_type string Agent type key, from the agents database table.
---@param agent_subtype string Agent subtype key, from the agent_subtypes database table.
---@param action_points number Percentage of action points that the spawned agent should start with. By default the agent starts with 100% action points.
function payload:agent_for_faction(faction_key, agent_type, agent_subtype, action_points) end

--- Returns a payload string which defines a Slaanesh glory reward for a Daemons of Chaos string mission definition. No kind of equivalence is looked up.
---@param amount number amount
function payload:slaanesh_glory(amount) end

--- Adds a payload remapping for a particular faction, for ancillary payloads. Once this remapping is established, payloads for this faction set up with payload.ancillary_mission_payload will instead be replaced with an alternative. The alternative is determined by the callback that is supplied to this function.<br />
--- When an ancillary payload is requested, the callback will be called and supplied three arguments - the faction key, the ancillary category string, and the ancillary rarity string.
---@param faction_key string faction key
---@param remapping_callback function remapping callback
function payload:add_ancillary_equivalence_mapping(faction_key, remapping_callback) end

--- Returns a payload string which defines a money reward (or equivalent) for a string mission definition. When this function is called, a money-equivalence mapping is looking up based on the supplied faction key. If one was previously added with payload.add_money_equivalence_mapping then the mapping callback that was supplied to that function is called, and the returned result of that callback is returned by this function. If no remapping for this faction is found, then a money payload string is returned.
---@param amount number amount
---@param faction_key string faction key
---@param equivalence_parameters table equivalence parameters
function payload:money(amount, faction_key, equivalence_parameters) end

--- Returns a payload string which defines a text override for the payload description. If a text override is specified, the mission panel will display that message as the mission reward instead of trying to generate one itself. This is useful in certain circumstances, such as if completing the mission brings some custom scripted reward that the game does not natively support.
---@param text_key string Key of text to display, from the campaign_payloads_ui_details database table.
function payload:text_display(text_key) end

--- Returns a mission reward string that applies the specified effect bundle to the faction when the mission being constructed is completed. An optional duration in turns may be specified.
---@param effect_bundle_key string Effect bundle key, from the effect_bundles database table.
---@param turns number Number of turns the effect should be applied for. If this is omitted 
function payload:effect_bundle_mission_payload(effect_bundle_key, turns) end

--- Returns a mission reward string that adds the specified quantity of the specified unit to the faction's mercenary pool when the mission being constructed is completed. This would only have an effect for faction's that feature a mercenary pool.
---@param unit_key string Unit key, from the main_units database table.
---@param quantity number Quantity of units to add.
function payload:mercenary_mission_payload(unit_key, quantity) end

--- Returns a payload string which defines a Devotees reward for a Slaanesh string mission definition. No kind of equivalence is looked up.
---@param amount number amount
function payload:devotees(amount) end

--- Returns a payload string which defines a Devotion reward for a Kislev string mission definition. No kind of equivalence is looked up.
---@param amount number amount
function payload:devotion(amount) end

--- Returns a payload string which defines a Tzeentch glory reward for a Daemons of Chaos string mission definition. No kind of equivalence is looked up.
---@param amount number amount
function payload:tzeentch_glory(amount) end

--- Returns a payload string which defines a money reward for a string mission definition. No money-equivalence is looked up when this function is called - use payload.money to return a money-equivalent reward when appropriate.
---@param amount number amount
function payload:money_direct(amount) end

--- Returns a payload string which defines an Undivided glory reward for a Daemons of Chaos string mission definition. No kind of equivalence is looked up.
---@param amount number amount
function payload:undivided_glory(amount) end

--- Returns a payload string which defines an agent reward for a string mission definition. No kind of equivalence is looked up.
---@param spawn_region string Key of region in which to spawn the agent, from the regions database table.
---@param agent_type string Agent type key, from the agents database table.
---@param agent_subtype string Agent subtype key, from the agent_subtypes database table.
---@param action_points number Percentage of action points that the spawned agent should start with. By default the agent starts with 100% action points.
function payload:agent(spawn_region, agent_type, agent_subtype, action_points) end

--- Returns a payload string which defines a Nurgle glory reward for a Daemons of Chaos string mission definition. No kind of equivalence is looked up.
---@param amount number amount
function payload:nurgle_glory(amount) end

--- Returns a payload string which defines a Grimoires reward for a Tzeentch string mission definition. No kind of equivalence is looked up.
---@param amount number amount
function payload:grimoires(amount) end
