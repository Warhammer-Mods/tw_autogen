
---@class campaignui
local campaignui = {}

--- Sets the overlay mode to display by numeric id with a mode mask, and one or more regions to display it across by region key. Multiple region keys may be specified with separate arguments. Calling this function has no effect until the overlay is subsequently enabled with CampaignUI.SetOverlayVisible.<br />
--- Valid overlay mode ids:<br />
--- overlay mode iddescription<br />
--- 0DIPLOMACY_STATUS
--- 1DIPLOMACY_ATTITUDE_FACTION
--- 2DIPLOMACY_ATTITUDE_OWNER
--- 3RADAR
--- 4HISTORICAL_OWNERSHIP
--- 5REGION_GROWTH
--- 6REGION_HAPPINESS
--- 7REGION_SLAVES
--- 8REGION_FOOD
--- 9REGION_CORRUPTION
--- 10WINDS_OF_MAGIC
--- 11CLIMATE_SUITABILITY
--- 12GEOMATIC_WEB
--- 13TUTORIAL_REGION_HIGHLIGHT
--- 14ATTRITION_FOR_SELECTED_CHARACTER
---@param overlay_mode number Overlay mode (see lookup table above).
---@param overlay_mode_mask number When showing the corruption overlay, this value specifies a corruption type (in order within the corruption_types table). When showing the happiness overlay, supplying a value other than 0 shows happiness trending rather than current happiness.
function campaignui:SetOverlayMode(overlay_mode, overlay_mode_mask) end

--- Shows the campaign victory screen, optionally corresponding to a specified mission. All three arguments must be specified, or none can be specified.
---@param is_victory boolean is victory
---@param can_continue boolean can continue
---@param mission_key string mission key
function campaignui:ShowVictoryScreen(is_victory, can_continue, mission_key) end

--- Clears the current ui selection, ensuring that no settlements or characters are selected by the player.
function campaignui:ClearSelection() end

--- Zooms the game camera to the specified display co-ordinates using smooth movement. x and y must be provided. If no bearing and distance values are provided then the current camera bearing and distance values are used.
---@param x number x display position.
---@param y number y display position.
---@param horizontal_distance number Horizontal distance from camera to camera target.
---@param bearing number Bearing in radians from camera to camera target.
---@param vertical_distance number Vertical distance from camera to camera target.
function campaignui:ZoomToSmooth(x, y, horizontal_distance, bearing, vertical_distance) end

--- Closes an open UI panel by name.
---@param panel_name string panel name
function campaignui:ClosePanel(panel_name) end

--- Returns whether or not an event of the specified type exists in the display queue (i.e. is being displayed or is pending to be displayed). Event types are specified by a compound key from the event_feed_targeted_events table - the key must be specified by concatenating the event and target> field values for a given record from that table.
---@param event_type string event type
function campaignui:DoesEventTypeExist(event_type) end

--- Enables or disables a suppression lock that prevents any event messages being shown on the UI. Once the lock is enabled, individual event types may be whitelisted for display with CampaignUI.WhiteListEventTypeInUI, at which point they will bypass the suppression.
---@param enable_suppression boolean enable suppression
function campaignui:SuppressAllEventTypesInUI(enable_suppression) end

--- Adds a unit to the blacklist
---@param main_unit_record_key string main unit record key
function campaignui:AddUnitToBlacklist(main_unit_record_key) end

--- Updates any settlement effect icons on the campaign interface. This should be called after the script does anything that might modify settlement effects.
function campaignui:UpdateSettlementEffectIcons() end

--- Triggers an incident for the local player, specified by incident key. If called on one machine in a multiplayer game this will trigger the incident on all machines - as such, it can be called in script that is triggered from a UI event in a multiplayer game.
---@param incident_key string incident key
function campaignui:TriggerIncident(incident_key) end

--- Sets the campaign overlay to be visible or not. The campaign overlay colourises regions on the campaign map display for various purposes (it is used by the tactical map, for example). The overlay mode to display, and what regions to display it on, should be set with CampaignUI.SetOverlayMode before activating the overlay with this function.
---@param activate_overlay boolean activate overlay
function campaignui:SetOverlayVisible(activate_overlay) end

--- Adds building chains to whitelist.
---@param building_chain_key string building chain key
function campaignui:AddBuildingChainToWhitelist(building_chain_key) end

--- Returns true if campaign_minimal_view_mode enabled (set in userscript to speed up campaign loading)
function campaignui:IsMinimalViewModeEnabled() end

--- Clears the unit blacklist.
function campaignui:ClearUnitBlacklist() end

--- Clears the building chain whitelist.
function campaignui:ClearBuildingChainWhitelist() end

--- Creates or destroys a black screen cover (when not eyefinity).
---@param enable_cover boolean enable cover
function campaignui:ToggleScreenCover(enable_cover) end

--- Allows the script running on one machine in a multiplayer game to cause a scripted event, UITrigger, to be triggered on all machines in that game. By listening for this event, scripts on all machines in a multiplayer game can therefore respond to a UI event occuring on just one of those machines.<br />
--- An optional string event id and number faction cqi may be specified. If specified, these values are passed from the triggering script through to all listening scripts, using the context objects supplied with the events. The event id may be accessed by listening scripts by calling &lt;context&gt;:trigger() on the supplied context object, and can be used to identify the script event being triggered. The faction cqi may be accessed by calling &lt;context&gt;:faction_cqi() on the context object, and can be used to identify a faction associated with the event. Both must be specified, or neither. 
---@param faction_cqi number faction cqi
---@param event_id string event id
function campaignui:TriggerCampaignScriptEvent(faction_cqi, event_id) end

--- Creates or destroys top and bottom cinematic borders.
---@param enable_borders boolean enable borders
function campaignui:ToggleCinematicBorders(enable_borders) end

--- Exits the game. This is used for autotesting.
function campaignui:QuitToWindows() end

--- Whitelists an event type to bypass suppression activated by CampaignUI.SuppressAllEventTypesInUI. Event types to be whitelisted are specified by a compound key from the event_feed_targeted_events table - the key must be specified by concatenating the event and target> field values for a given record from that table. Currently valid examples might include "faction_event_mission_issuedevent_feed_target_mission_faction" or "scripted_persistent_located_eventevent_feed_target_faction". Whitelisting an event type has no effect if suppression has not been enabled.
---@param event_type string event type
function campaignui:WhiteListEventTypeInUI(event_type) end

--- Returns whether or not an event of the specified type exists in the display queue (i.e. is being displayed or is pending to be displayed) and requires a response. Event types are specified by a compound key from the event_feed_targeted_events table - the key must be specified by concatenating the event and target> field values for a given record from that table.<br />
--- This is of most use for testing if a dilemma is currently active.
---@param event_type string event type
function campaignui:DoesEventTypeRequireResponse(event_type) end
