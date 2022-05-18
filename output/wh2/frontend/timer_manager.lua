--- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT EDIT MANUALLY.

---@class timer_manager
local timer_manager = {}

--- Creates a timer_manager object. It is unnecessary for battle scripts to call this as one is created automatically by the battle manager, and stored internally.
---@param tick_time number Model tick time in ms. Defaults to 100ms.
---@return timer_manager   
function timer_manager:new(tick_time) end

--- Instructs the timer manager to call a supplied function after a supplied delay. A string name for the callback may also be supplied with which the callback may be later cancelled using timer_manager:remove_callback (note that in battle it's much more common to use <a href="../battle/battle_manager.html#function:battle_manager:remove_process">battle_manager:remove_process).
---@param callback_to_call function callback to call
---@param delay_in_ms number delay in ms
---@param callback_name string callback name
function timer_manager:callback(callback_to_call, delay_in_ms, callback_name) end

--- Instructs the timer manager to call a supplied function after a supplied delay, and then repeatedly after the same delay. A string name for the callback may also be supplied with which the callback may be later cancelled using timer_manager:remove_callback (note that in battle it's much more common to use <a href="../battle/battle_manager.html#function:battle_manager:remove_process">battle_manager:remove_process).
---@param callback_to_call function callback to call
---@param delay_in_ms number delay in ms
---@param callback_name string callback name
function timer_manager:repeat_callback(callback_to_call, delay_in_ms, callback_name) end

--- Instructs the timer manager to remove any active callback with the supplied name. This is the main method at the level of timer_manager to remove callbacks, however on the <a href="../battle/battle_manager.html#class:battle_manager">battle_manager it's more common to call <a href="../battle/battle_manager.html#function:battle_manager:remove_process">battle_manager:remove_process instead (which also removes matching <a href="../battle/battle_manager.html#section:battle_manager:Watches">Watches).
---@param name_name_to_remove string name name to remove
---@return boolean  any callbacks removed 
function timer_manager:remove_callback(name_name_to_remove) end

--- Registers a handler name (function name) to be called and a period in ms after which to call it. Do not use this unless strictly necessary - it's only provided for legacy support. Use timer_manager:callback instead.
---@param function_name string function name
---@param time_in_ms number time in ms
function timer_manager:register_singleshot_timer(function_name, time_in_ms) end

--- Registers a handler name (function name) to be called and a period in ms after which to repeatedly call it. Do not use this unless strictly necessary - it's only provided for legacy support. Use timer_manager:repeat_callback instead.
---@param function_name string function name
---@param time_in_ms number time in ms
function timer_manager:register_repeating_timer(function_name, time_in_ms) end

--- Cancels a timer registered with timer_manager:register_singleshot_timer or timer_manager:register_repeating_timer. As is the case with those functions, don't use this unless strictly necessary.
---@param function_name string function name
function timer_manager:unregister_timer(function_name) end

--- Writes the current timer list to the console, for debugging purposes.
function timer_manager:print_timer_list() end

--- Writes the current callback list to the console, for debugging purposes.
function timer_manager:print_callback_list() end

--- Clears all callbacks. This shouldn't really be used for client scripts, if you need to do this you're probably doing something wrong.
function timer_manager:clear_callback_list() end
