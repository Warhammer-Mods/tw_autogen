--- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT EDIT MANUALLY.

---@class random_army_manager
local random_army_manager = {}

--- Adds a new force to the random army manager
---@param force_key string #a unique key for this new force
---@return boolean #Returns true if the force was created successfully 
function random_army_manager:new_force(force_key) end

--- Clones an existing force to the random army manager
---@param old_force_key string #the key of the force to be cloned
---@param new_force_key string #a unique key for this new force
---@return boolean #Returns true if the force was cloned successfully 
function random_army_manager:clone_force(old_force_key, new_force_key) end

--- Combines existing forces to the random army manager. If all specified forces have the same faction, then that faction is given to the new force. Otherwise, the faction of the new force is left blank.
---@param new_force_key string #a unique key for this new force
---@param ... any #One or more existing force keys
---@return boolean #Returns true if the forces were combined successfully 
function random_army_manager:combine_forces(new_force_key, ...) end

--- Adds a unit to a force, making it available for random selection if this force is generated. The weight value is an arbitrary figure that should be relative to other units in the force
---@param key_of_the_force string #key of the force
---@param key_of_the_unit string #key of the unit
---@param weight_value number #weight value
function random_army_manager:add_unit(key_of_the_force, key_of_the_unit, weight_value) end

--- Adds a mandatory unit to a force composition, making it so that if this force is generated this unit will always be part of it
---@param key_of_the_force string #key of the force
---@param key_of_the_unit string #key of the unit
---@param amount_of_these_units number #amount of these units
function random_army_manager:add_mandatory_unit(key_of_the_force, key_of_the_unit, amount_of_these_units) end

--- Sets the faction key associated with this force - Allows you to store the faction key used to spawn the army from the force
---@param key_of_the_force string #key of the force
---@param key_of_the_faction string #key of the faction
function random_army_manager:set_faction(key_of_the_force, key_of_the_faction) end

--- This generates a force randomly, first taking into account the mandatory unit and then making random selection of units based on weighting. Returns an array of unit keys or a comma separated string for use in the create_force function if the last boolean value is passed as true
---@param Number_of_units_to_spawn string #Key of the force.
---@param Return_as_table number? #optional, default value=nil If you have no non-mandatory units specified, this must equal the sum of all mandatory units (since no optional units are available for generating additional units). If unspecified, only the sum of your mandatory units will be spawned.
---@return any
function random_army_manager:generate_force(Number_of_units_to_spawn, Return_as_table) end

--- Remove an existing force from the force list
---@param key_of_the_force string #key of the force
function random_army_manager:remove_force(key_of_the_force) end

--- Returns the amount of mandatory units specified in this force
---@param key_of_the_force string #key of the force
function random_army_manager:mandatory_unit_count(key_of_the_force) end

--- Returns the force of the specified key, false if it's not found
---@param key_of_the_force string #key of the force
---@return table #Returns the force 
function random_army_manager:get_force_by_key(key_of_the_force) end
