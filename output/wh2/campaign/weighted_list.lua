--- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT EDIT MANUALLY.

---@class weighted_list
local weighted_list = {}

--- Creates a new weighted list object
---@param o table Pass an object to the new function to use that instance of the object as this new one
---@return weighted_list  the new weighted list object 
function weighted_list:new(o) end

--- Allows adding of new items to the weighted list with a set weighting
---@param item any The item to add to the list
---@param weight number The weight of this item
function weighted_list:add_item(item, weight) end

--- Allows removal of an item from the weighted list
---@param i number The index of the item to remove
function weighted_list:remove_item(i) end

--- Selects an item from the weighted list with the chance of each item<br />
--- being selected being their weight relative to all other items
---@return any  the selected item 
function weighted_list:weighted_select() end

--- Randomly selects an item from the weighted list disregarding any weighting
---@return any  the selected item 
function weighted_list:random_select() end
