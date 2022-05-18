--- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT EDIT MANUALLY.

---@class battle_unitcontroller
local battle_unitcontroller = {}

--- Removes all units from the unitcontroller. Units that were under script control are still left in this state unless explicitly released with unitcontroller:release_control.
function battle_unitcontroller:clear_all() end

--- Adds all units in the battle_army that this unitcontroller is assocated with, as a group.
function battle_unitcontroller:add_all_units() end

--- Adds one or more units to the unitcontroller. Multiple battle_unit objects may be specified as individual arguments.
---@vararg any
function battle_unitcontroller:add_units(...) end

--- Adds one or more units to the unitcontroller as a group. Multiple battle_unit objects may be specified as individual arguments. Grouped units will move together.
---@vararg any
function battle_unitcontroller:add_group(...) end

--- Explicitly takes control of the assigned units. This removes them from player or AI control.
function battle_unitcontroller:take_control() end

--- Releases control of all units controlled by this unitcontroller to either the player or the AI.
function battle_unitcontroller:release_control() end

--- Releases the morale value of the units associated with this unitcontroller to be set by the game. Use this function after calling either unitcontroller:morale_behavior_fearless or unitcontroller:morale_behavior_rout to reset the morale to game control.
function battle_unitcontroller:morale_behavior_default() end

--- Sets the units associated with this unitcontroller to be fearless, meaning they can never rout.
function battle_unitcontroller:morale_behavior_fearless() end

--- Instructs the units associated with this unitcontroller to immediately rout.
function battle_unitcontroller:morale_behavior_rout() end

--- Sets the units associated with this unitcontroller to be invincible or not. Invincible units do not take damage.
---@param is_invincible boolean is invincible
function battle_unitcontroller:set_invincible(is_invincible) end

--- Makes all units associated with this unitcontroller invisible or not. Supply true as an argument to make units invisible, and false to make them visible again. Invisible units are still able to take part in the battle, unless also disabled with unitcontroller:change_enabled.<br />
--- The script_unit:set_enabled command on the script_unit interface sets invisibility and enables/disables the unit in one function call, so consider calling that function instead of this.
---@param set_invisible boolean Set invisible.
---@param update_ui boolean Update UI with invisibility change. Supply false to not update the UI with this visibility change - only do this in very specific circumstances.
function battle_unitcontroller:set_invisible_to_all(set_invisible, update_ui) end

--- Sets the units associated with this unitcontroller to be exempt or not from the terrain visibility test. If set to be visible the unit will still be able to hide in forests and vegetation.
---@param set_always_visible boolean set always visible
function battle_unitcontroller:set_always_visible_to_all(set_always_visible) end

--- Enables or disables the units associated with this unitcontroller. Disabled units will not take any part in the battle. However they will still be visible on the UI, unless also set to be invisible with unitcontroller:set_invisible_to_all.<br />
--- The script_unit:set_enabled command on the script_unit interface sets invisibility and enables/disables the unit in one function call, so consider calling that function instead of this.
---@param enabled boolean enabled
function battle_unitcontroller:change_enabled(enabled) end

--- Tells the UI to add or remove the units associated with this unitcontroller to or from the HUD based on the current invisibility flag. This is only for use in specific scripted circumstances.
function battle_unitcontroller:update_card_existance_on_HUD() end

--- Tells the UI to hide the units cards associated with this unitcontroller.
function battle_unitcontroller:hide_unit_card() end

--- Changes the fatigue level of the units associated with this unitcontroller to the supplied unary value, relative to their current level. For example, supplying 0.5 as an argument would half their fatigue level (making them fresher). Do not supply 0 to this function as this would cause a divide by zero error in the code - 0.01 or some equivalent will suffice.
---@param fatigue_level number Relative unary fatigue level.
function battle_unitcontroller:change_fatigue_amount(fatigue_level) end

--- Issues an order to the units associated with this unitcontroller to perform the supplied special ability. Special abilities are listed in the unit_special_abilities table. An optional unit target may be specified.
---@param ability_key string ability key
---@param target_unit battle_unit target unit
function battle_unitcontroller:perform_special_ability(ability_key, target_unit) end

--- Issues a queued order to the units associated with this unitcontroller to perform the supplied special ability. Special abilities are listed in the unit_special_abilities table. Queued orders start when the current order completes.<br />
--- An optional unit target may be specified with the second argument.
---@param ability_key string ability key
---@param target_unit battle_unit target unit
function battle_unitcontroller:perform_special_ability_q(ability_key, target_unit) end

--- Issues an order to the units associated with this unitcontroller to perform the supplied special ability on a specified position. Special abilities are listed in the unit_special_abilities table.
---@param ability_key string ability key
---@param position battle_vector position
function battle_unitcontroller:perform_special_ability_ground(ability_key, position) end

--- Issues an order to the units associated with this unitcontroller to change shot type to the supplied value. Shot types are listed in the projectile_shot_type_enum table - the key from an entry in that table should be supplied to this function.
---@param shot_type string shot type
function battle_unitcontroller:change_shot_type(shot_type) end

--- Issues a queued order to the units associated with this unitcontroller to change shot type to the supplied value. Shot types are listed in the projectile_shot_type_enum table - the key from an entry in that table should be supplied to this function.<br />
--- Queued orders start when the current order completes.
---@param shot_type string shot type
function battle_unitcontroller:change_shot_type_q(shot_type) end

--- Sets the supplied behaviour active or not for the units associated with this unitcontroller. Valid behaviours are as follows: defend, drop_siege_equipment, abandon_artillery_engines, change_formation_spacing, dismantle_artillery_piece, dismount, fire_at_will, skirmish, release_animals, unlimber, board_ship, and formed_attack.
---@param behaviour_key string behaviour key
---@param is_active boolean is active
function battle_unitcontroller:change_behaviour_active(behaviour_key, is_active) end

--- Enables or disables melee mode for the units associated with this unitcontroller.
---@param enable_melee_mode boolean enable melee mode
function battle_unitcontroller:melee(enable_melee_mode) end

--- Enables or disables fire-at-will behaviour for the units associated with this unitcontroller.
---@param enable boolean enable
function battle_unitcontroller:fire_at_will(enable) end

--- Instructs the units associated with this unitcontroller to halt.
function battle_unitcontroller:halt() end

--- Issues a withdraw order to the units associated with this unitcontroller, instructing them to leave the battlefield.
function battle_unitcontroller:withdraw() end

--- Issues a queued withdraw order to the units associated with this unitcontroller, instructing them to leave the battlefield. Queued orders start when the current order completes.
function battle_unitcontroller:withdraw_q() end

--- Instructs the units associated with this unitcontroller to take a step forwards.
function battle_unitcontroller:step_forward() end

--- Instructs the units associated with this unitcontroller to take a step backwards.
function battle_unitcontroller:step_backwards() end

--- Instructs the units associated with this unitcontroller to increase their formation width.
function battle_unitcontroller:increment_formation_width() end

--- Instructs the units associated with this unitcontroller to decrease their formation width.
function battle_unitcontroller:decrement_formation_width() end

--- Instructs the units associated with this unitcontroller to move fast or slow. Supply true as a single argument to instruct the units to move quickly, or false to instruct them to move slowly.
---@param move_fast boolean move fast
function battle_unitcontroller:change_move_speed(move_fast) end

--- Issues an order to the units associated with this unitcontroller to adopt a new formation. Valid formations are set in the formations table.
---@param formation_name string formation name
function battle_unitcontroller:change_group_formation(formation_name) end

--- Issues a queued order to the units associated with this unitcontroller to adopt a new formation. Valid formations are set in the formations table.<br />
--- Queued orders start when the current order completes.
---@param formation_name string formation name
function battle_unitcontroller:change_group_formation_q(formation_name) end

--- Issues an order to the units associated with this unitcontroller to move to a supplied location. No facing or width is specified.
---@param position battle_vector position
---@param move_fast boolean move fast
function battle_unitcontroller:goto_location(position, move_fast) end

--- Issues a queued order to the units associated with this unitcontroller to move to a supplied location. No facing or width is specified. Queued orders start when the current order completes.
---@param position battle_vector position
---@param move_fast boolean move fast
function battle_unitcontroller:goto_location_q(position, move_fast) end

--- Issues an order to the units associated with this unitcontroller to move to a supplied location and assume a position there facing a specified angle with a specified width.
---@param position battle_vector position
---@param facing_in_degrees number facing in degrees
---@param width_in_m number width in m
---@param move_fast boolean move fast
function battle_unitcontroller:goto_location_angle_width(position, facing_in_degrees, width_in_m, move_fast) end

--- Issues a queued order to the units associated with this unitcontroller to move to a supplied location and assume a position there facing a specified angle with a specified width. Queued orders start when the current order completes.
---@param position battle_vector position
---@param facing_in_degrees number facing in degrees
---@param width_in_m number width in m
---@param move_fast boolean move fast
function battle_unitcontroller:goto_location_angle_width_q(position, facing_in_degrees, width_in_m, move_fast) end

--- Immediately teleports units associated with this unitcontroller to a supplied location/angle/width.
---@param position battle_vector position
---@param facing_in_degrees number facing in degrees
---@param width_in_m number width in m
function battle_unitcontroller:teleport_to_location(position, facing_in_degrees, width_in_m) end

--- Issues an order to the units associated with this unitcontroller to occupy a vehicle.
---@param target battle_vehicle Target vehicle.
---@param move_fast boolean Move fast to building.
function battle_unitcontroller:occupy_vehicle(target, move_fast) end

--- Issues a queued order to the units associated with this unitcontroller to occupy a vehicle. Queued orders start when the current order completes.
---@param target battle_vehicle Target vehicle.
---@param move_fast boolean Move fast to building.
function battle_unitcontroller:occupy_vehicle_q(target, move_fast) end

--- Issues an order to the units associated with this unitcontroller to occupy a battlefield zone. Battlefield zones tend to be defensive positions associated with a building, most commonly on settlement walls.
---@param target battle_vector Target position.
---@param move_fast boolean Move fast to position.
function battle_unitcontroller:occupy_zone(target, move_fast) end

--- Issues a queued order to the units associated with this unitcontroller to occupy a battlefield zone. Battlefield zones tend to be defensive positions associated with a building, most commonly on settlement walls.<br />
--- Queued orders start when the current order completes.
---@param target battle_vector Target position.
---@param move_fast boolean Move fast to position.
function battle_unitcontroller:occupy_zone_q(target, move_fast) end

--- Issues an order to the units associated with this unitcontroller to rotate about their current heading by the supplied number of degrees.
---@param heading_change number Heading change in degrees.
---@param move_fast boolean Move quickly.
function battle_unitcontroller:rotate(heading_change, move_fast) end

--- Issues a queued order to the units associated with this unitcontroller to rotate about their current heading by the supplied number of degrees. Queued orders start when the current order completes.
---@param heading_change number Heading change in degrees.
---@param move_fast boolean Move quickly.
function battle_unitcontroller:rotate_q(heading_change, move_fast) end

--- Issues an order to the units associated with this unitcontroller to attack an enemy unit.
---@param target_unit battle_unit Target unit to attack. This must be an enemy unit.
---@param use_primary_attack boolean Use primary attack. Some units have more than one method of attacking - this flag allows the command to specify which to use.
---@param move_fast boolean Move fast/charge when attacking.
function battle_unitcontroller:attack_unit(target_unit, use_primary_attack, move_fast) end

--- Issues a queued order to the units associated with this unitcontroller to attack an enemy unit. Queued orders start when the current order completes.
---@param target_unit battle_unit Target unit to attack. This must be an enemy unit.
---@param use_primary_attack boolean Use primary attack. Some units have more than one method of attacking - this flag allows the command to specify which to use.
---@param move_fast boolean Move fast/charge when attacking.
function battle_unitcontroller:attack_unit_q(target_unit, use_primary_attack, move_fast) end

--- Issues an order to the units associated with this unitcontroller to attack a specified building.
---@param target battle_building Target building.
---@param piece_index number Index for building piece to target. The default value (1) targets the building as a whole.
---@param move_fast boolean Move fast/charge when attacking.
function battle_unitcontroller:attack_building(target, piece_index, move_fast) end

--- Issues a queued order to the units associated with this unitcontroller to attack a specified building. Queued orders start when the current order completes.
---@param target battle_building Target building.
---@param piece_index number Index for building piece to target. The default value (1) targets the building as a whole.
---@param move_fast boolean Move fast/charge when attacking.
function battle_unitcontroller:attack_building_q(target, piece_index, move_fast) end

--- Issues an order to the units associated with this unitcontroller to interact with a deployable object on the battlefield.
---@param deployable_position battle_vector Position of deployable object.
---@param move_fast boolean Move fast to position.
---@param melee_attack boolean Attack in melee or not.
function battle_unitcontroller:interact_with_deployable(deployable_position, move_fast, melee_attack) end

--- Issues an order to the units associated with this unitcontroller to interact with a deployable object on the battlefield. Queued orders start when the current order completes.
---@param deployable_position battle_vector Position of deployable object.
---@param move_fast boolean Move fast to position.
---@param melee_attack boolean Attack in melee or not.
function battle_unitcontroller:interact_with_deployable_q(deployable_position, move_fast, melee_attack) end

--- Issues an order to the units associated with this unitcontroller to besiege a building.
---@param target battle_building Target building.
---@param piece_index number Index for building piece to target. The default value (1) targets the building as a whole.
---@param move_fast boolean Move fast/charge when attacking.
function battle_unitcontroller:besiege_building(target, piece_index, move_fast) end

--- Issues a queued order to the units associated with this unitcontroller to besiege a building. Queued orders start when the current order completes.
---@param target battle_building Target building.
---@param piece_index number Index for building piece to target. The default value (1) targets the building as a whole.
---@param move_fast boolean Move fast/charge when attacking.
function battle_unitcontroller:besiege_building_q(target, piece_index, move_fast) end

--- Issues an order to the units associated with this unitcontroller to defend a building.
---@param target battle_building Target building.
---@param move_fast boolean Move fast/charge when defending.
function battle_unitcontroller:defend_building(target, move_fast) end

--- Issues an order to the units associated with this unitcontroller to defend a building. Queued orders start when the current order completes.
---@param target battle_building Target building.
---@param move_fast boolean Move fast/charge when defending.
function battle_unitcontroller:defend_building_q(target, move_fast) end

--- Issues an order to the units associated with this unitcontroller to leave the building they're in.
function battle_unitcontroller:leave_building() end

--- Issues an order to the units associated with this unitcontroller to attack a location.
---@param position battle_vector position
---@param move_fast boolean move fast
function battle_unitcontroller:attack_location(position, move_fast) end

--- Issues a queued order to the units associated with this unitcontroller to attack a location. Queued orders start when the current order completes.
---@param position battle_vector position
---@param move_fast boolean move fast
function battle_unitcontroller:attack_location_q(position, move_fast) end

--- Issues an order to the units associated with this unitcontroller to attack a line across the battlefield. The line is drawn between two supplied battle_vector positions.
---@param position_a battle_vector position a
---@param position_b battle_vector position b
---@param move_fast boolean move fast
function battle_unitcontroller:attack_line(position_a, position_b, move_fast) end

--- Issues a queued order to the units associated with this unitcontroller to attack a line across the battlefield. The line is drawn between two supplied battle_vector positions.<br />
--- Queued orders start when the current order completes.
---@param position_a battle_vector position a
---@param position_b battle_vector position b
---@param move_fast boolean move fast
function battle_unitcontroller:attack_line_q(position_a, position_b, move_fast) end

--- Sets the chance of units associated with this unitcontroller performing matched combat when attacking. The chance should be supplied as a percentage, between 0 and 100. Specify a negative number to st the chance back to default.
---@param chance number chance
function battle_unitcontroller:set_matched_combat_chance(chance) end

--- Instructs the units associated with this unitcontroller to start celebrating.
function battle_unitcontroller:start_celebrating() end

--- Instructs the units associated with this unitcontroller to start taunting.
function battle_unitcontroller:start_taunting() end

--- Triggers a VO sound for units associated with this unitcontroller.<br />
--- string sound event name
function battle_unitcontroller:trigger_sound_vo() end

--- Kills all the units associated with this unitcontroller.
function battle_unitcontroller:kill() end

--- Highlights units associated with this unitcontroller by showing tracker chevrons under their feet.
---@param highlight boolean highlight
function battle_unitcontroller:highlight(highlight) end

--- Changes the walk speed for the units associated with this unitcontroller. This is only for use in cutscenes where the movement of units must match a certain speed for cinematic reasons and should not be used during live gameplay. Any speed set here will be reset to default when another order is issued. As such, a movement command and then this command should be issued in order to apply the movement speed modification.<br />
--- The walk speed is specified as a scalar which is applied to the default walk speed. Therefore, supplying 2 as an argument would make the units walk twice as quickly as before. Beware of setting extreme values, as walk animations will quickly look unnatural if played too quickly or too slowly.
---@param speed_scalar number speed scalar
function battle_unitcontroller:change_current_walk_speed(speed_scalar) end
