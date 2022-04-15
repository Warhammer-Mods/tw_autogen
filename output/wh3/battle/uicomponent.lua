
---@class UIC
local UIC = {}

--- Returns the number of animations the uicomponent contains.
function UIC:NumAnimations() end

--- Highlights or unhighlights the uicomponent to the player with a flashing ring. 
---@param should_highlight boolean Set to true</code to activate the highlight, or false to deactivate.
---@param square boolean Set to true to show a square highlight, or false to show a circular highlight.
---@param priority_lock number Activates a priority lock along with the highlight with the specified priority. While a priority lock is active, any interactive uicomponents with a priority less than the supplied lock level will be rendered non-interactive. See the Priority and Locking section for more information.
function UIC:Highlight(should_highlight, square, priority_lock) end

--- Returns the width and height of a specified image associated with the current state of the uicomponent.
---@param state_image_index number The index of the image's association with the current uicomponent state.
function UIC:GetCurrentStateImageDimensions(state_image_index) end

--- Sets a docking offset for this component, which offsets where the component is drawn from the docking point set.
---@param x_offset number X offset in pixels.
---@param y_offset number Y offset in pixels.
function UIC:SetDockOffset(x_offset, y_offset) end

--- Divorces the supplied child uicomponent from the subject uicomponent. The child uicomponent should be supplied by its address, which may be retrieved with uicomponent:Address.<br />
--- Once divorced, the child uicomponent is not destroyed but goes into an orphan list, from where it may later be adopted by another uicomponent. Orphaned uicomponents are not rendered.
---@param child UIC_Address child
function UIC:Divorce(child) end

--- Sets the state of the uicomponent to the specified state name.
---@param state_name string state name
function UIC:SetState(state_name) end

--- Returns the number of images associated with the subject uicomponent.
function UIC:NumImages() end

--- Simulates a mouse-move event on the uicomponent. Relative co-ordinates at which the mouse move event is simulated on the component may optionally be specified. Both arguments must be supplied to specify a position.
---@param x number X co-ordinate of event on component.
---@param y number Y co-ordinate of event on component.
function UIC:SimulateMouseMove(x, y) end

--- Returns the name of the current state of the uicomponent.
function UIC:CurrentState() end

--- Creates a copy of this uicomponent with the supplied name. The component is created as a sibling of the copied component, so they both share the same parent.
---@param uicomponent_name string uicomponent name
function UIC:CopyComponent(uicomponent_name) end

--- Sets whether the width can be resized of the specified image associated with the current state of the uicomponent.
---@param state_image_index number The index of the image's association with the current uicomponent state.
---@param can_resize boolean Can resize.
function UIC:SetCanResizeCurrentStateImageWidth(state_image_index, can_resize) end

--- De-registers this uicomponent from being drawn topmost.
function UIC:RemoveTopMost() end

--- Allows or disallows the height of this uicomponent to be changed by code or script.
---@param can_resize boolean can resize&emsp;&emsp;&emsp;&emsp;
function UIC:SetCanResizeHeight(can_resize) end

--- Returns whether this uicomponent provides any interface functions.
function UIC:HasInterface() end

--- Destroys all children of this uicomponent.
function UIC:DestroyChildren() end

--- Returns the docking offset set for this component, which offsets where the component is drawn from the docking point set.
function UIC:GetDockOffset() end

--- Activates a pulsing highlight effect on a particular state of the subject uicomponent. This is useful for unobtrusively highlighting components with an area such as buttons and panels, but doesn't work so well for highlighting text. The script function pulse_uicomponent wraps this function.
---@param pulse_strength number Pulse strength override. A typical value might be a number between 1 and 10.
---@param state_name string State name to apply the pulsing effect to. If this is not supplied, the effect is applied to the current state.
function UIC:StartPulseHighlight(pulse_strength, state_name) end

--- Sets the horizontal text alignment setting of the current state to the supplied alignment. Valid string alignment values are "left", "centre" and "right".
---@param horizontal_text_alignment string horizontal text alignment
function UIC:SetTextHAlign(horizontal_text_alignment) end

--- Adds a ScriptEventReporter callback to the component to allow it to notify the script of more 'spammy' events such as ComponentMouseOn, ComponentMouseOff, an ComponentAnimationFinished
function UIC:AddScriptEventReporter() end

--- Returns a link to the parent of the uicomponent. This is provided as a component address that must be cast to be a usable uicomponent script object using the UIComponent function.
function UIC:Parent() end

--- Returns whether the specified image associated with the current state of the uicomponent is tiled or not.
---@param state_image_index number The index of the image's association with the current uicomponent state.
function UIC:GetCurrentStateImageTiled(state_image_index) end

--- Returns the string name of the animation currently playing on this uicomponent. If no animation is currently playing then a blank string is returned.
function UIC:CurrentAnimationId() end

--- Returns true if this UIComponent handle is valid (internal component ptr has NOT been deleted)
function UIC:IsValid() end

--- Sets the active shader technique on just the text of the uicomponent, applying a custom graphical shader effect. The shader may be specified as a string key or a number. Valid shader keys are given in the table at the top of this section.
---@param shader any Shader to apply. This may be a string key or a number.
---@param all_states boolean Apply the shader to all states of this uicomponent.
function UIC:TextShaderTechniqueSet(shader, all_states) end

--- Calls the layout function for the uicomponent, forcing it to refresh its display.
function UIC:Layout() end

--- Returns the position of the top-left corner of the uicomponent, from the top-left corner of the game window/screen.
function UIC:Position() end

--- Returns whether the height can be resized of the specified image associated with the current state of the uicomponent.
---@param state_image_index number The index of the image's association with the current uicomponent state.
function UIC:CanResizeCurrentStateImageHeight(state_image_index) end

--- Returns the text on the current state of the uicomponent along with its dimensions. This text will be localised.
function UIC:GetStateText() end

--- Sets the tooltip text of the current state of this uicomponent. An optional flag directs the function to apply this tooltip text to all states of the uicomponent. The text specified must already be localised - effect:get_localised_string can be used to retrieve localised text from anywhere in the database.
---@param text string Localised tooltip text.
---@param text_source string source of text in format of a stringtable key (tablename_recordname_key)
---@param set_all_states boolean Set all states.
function UIC:SetTooltipText(text, text_source, set_all_states) end

--- Returns the current opacity of the uicomponent. The returned value will be a number from 0-255.
function UIC:Opacity() end

--- Returns the margin values for the specified image associated with the current state of the uicomponent. The margins affect how the image resizes, allowing a border around the image to stay a static size while the centre portion of the image scales.
---@param state_image_index number The index of the image's association with the current uicomponent state.
function UIC:GetCurrentStateImageMargins(state_image_index) end

--- Resizes the uicomponent. The uicomponent may be need to set to be resizeable before calling this - this can be done with uicomponent:SetCanResizeHeight and uicomponent:SetCanResizeWidth.
---@param width number New width of uicomponent in pixels.
---@param height number New height of uicomponent in pixels.
---@param resize_children boolean Also resize children.
function UIC:Resize(width, height, resize_children) end

--- Destroys this uicomponent.
function UIC:Destroy() end

--- Sets the docking point of the uicomponent to the specified value. Valid values are given in the table at the top of this section.
---@param dock_point number dock point
function UIC:SetDockingPoint(dock_point) end

--- Sets this uicomponent to be moveable or not.
---@param is_moveable boolean is moveable
function UIC:SetMoveable(is_moveable) end

--- Returns the tooltip text of the current state of the uicomponent as a localised string.
function UIC:GetTooltipText() end

--- Sets the vertical text alignment setting of the current state to the supplied alignment. Valid string alignment values are "top", "centre" and "bottom".
---@param vertical_text_alignment string vertical text alignment
function UIC:SetTextVAlign(vertical_text_alignment) end

--- Returns the key of the shader currently active on the uicomponent.
function UIC:ShaderTechniqueGet() end

--- Returns the maximum width and height of this uicomponent, including any of its children.
function UIC:Bounds() end

--- Finds a component via its guid (globally unique identifier). A 16 digit hex code that is guranteed to be unique across the game. No good for finding dynamic things, but useful for finding things that exist in layouts.
---@param GUID_that_has_been_specified_in_the_layout string GUID that has been specified in the layout
function UIC:FindByGuid(GUID_that_has_been_specified_in_the_layout) end

--- Returns the x-flipped value for the specified image associated with the current state of the uicomponent. If set, this flips the image horizontally.
---@param state_image_index number The index of the image's association with the current uicomponent state.
function UIC:GetCurrentStateImageFlip(state_image_index) end

--- Returns whether the width can be resized of the specified image associated with the current state of the uicomponent.
---@param state_image_index number The index of the image's association with the current uicomponent state.
function UIC:CanResizeCurrentStateImageWidth(state_image_index) end

--- Compels this uicomponent to adopt a supplied uicomponent, which will then become a child of this uicomponent. The supplied uicomponent is removed from its previous parent. The target uicomponent must be supplied by its address, which may be retrieved with uicomponent:Address.<br />
--- An insertion index may optionally be supplied, which determines where in this uicomponent's list of children this new child will be inserted. This can determine the display order in certain circumstances. By default, the new child is added to the end of the list.
---@param uicomponent_address UIC_Address uicomponent address
---@param insertion_index number insertion index
function UIC:Adopt(uicomponent_address, insertion_index) end

--- Returns the width of a text line on the current uicomponent.
---@param text_line string text line
function UIC:WidthOfTextLine(text_line) end

--- Returns the width of a specified image associated with the current state of the uicomponent.
---@param state_image_index number The index of the image's association with the current uicomponent state.
function UIC:GetCurrentStateImageWidth(state_image_index) end

--- Sets a new image path for an image associated with the uicomponent, replacing the original image with something new. Multiple images can be associated with a uicomponent - the index of the image to overwrite can be set with the second parameter or by setting a "script_icon_index" user property on the uicomponent with uicomponent:SetProperty. If an index value is not set with either of these methods then the first image, image 0, is swapped.<br />
--- The uicomponent:GetImagePath and uicomponent:NumImages functions can be used to query images related to a uicomponent.
---@param image_path string Path of image to load, from the working data folder.
---@param image_index number Index of image associated with this uicomponent to overwrite the path of. This takes precedence over any set "script_icon_index" property.
---@param resize boolean Resize the image metric to the size of the image being specified. If this is not set, the incoming image will take the size of the old.
function UIC:SetImagePath(image_path, image_index, resize) end

--- Finds and returns a child of this uicomponent by a series of string names and numeric indexes. The function will step through each argument, attempting to find the uicomponent specified, and using that as the parent from which to find the next. A numeric index argument finds an immediate child of the current search subject, whereas a string name initiates a recursive search through all children/descendants of this uicomponent.
---@vararg any
function UIC:SequentialFind(identifiers) end

--- Returns the dimensions of the some supplied text, were it to be displayed on the uicomponent in its current state.
---@param text string text
function UIC:TextDimensionsForText(text) end

--- Triggers a keyboard shortcut on the uicomponent, by name. Keyboard shortcuts are listed in data\text\default_keys.xml.
---@param shortcut string shortcut
function UIC:TriggerShortcut(shortcut) end

--- Returns the horizontal text alignment setting of the current state as a string. Valid alignment values are "left", "centre" and "right".
function UIC:GetTextHAlign() end

--- Returns the number of frames in an animation of the specified name. If no animation with the supplied name could be found on the uicomponent then -1 is returned.
---@param animation_name string animation name
function UIC:NumAnimationFrames(animation_name) end

--- Sets the x-flipped value for the specified image associated with the current state of the uicomponent. If set, this flips the image horizontally.
---@param state_image_index number The index of the image's association with the current uicomponent state.
---@param flip boolean Image should be horizontally flipped.
function UIC:SetCurrentStateImageXFlip(state_image_index, flip) end

--- Returns the variables of the text shader currently active on the uicomponent.
function UIC:TextShaderVarsGet() end

--- Sets the text on the current state of the uicomponent to the supplied text. Localised text must be specified - common.get_localised_string can be used to look this up from anywhere in the database.
---@param localised_text string Localised text.
---@param text_source string source of text in format of a stringtable key (tablename_recordname_key)
function UIC:SetStateText(localised_text, text_source) end

--- Sets the margin values for the specified image associated with the current state of the uicomponent. This affects how the image resizes, allowing a border around the image to stay a static size while the centre portion of the image scales.
---@param state_image_index number The index of the image's association with the current uicomponent state.
---@param top_margin number The size of the top margin in pixels.
---@param right_margin number The size of the right margin in pixels.
---@param bottom_margin number The size of the bottom margin in pixels.
---@param left_margin number The size of the left margin in pixels.
function UIC:SetCurrentStateImageMargins(state_image_index, top_margin, right_margin, bottom_margin, left_margin) end

--- Finds and returns a child of this uicomponent by string name or by numeric index. If a numeric index is supplied, the immediate child uicomponent corresponding to this number is returned. If a string name is supplied, a recursive search is made through all children/descendants of this uicomponent. The first that is found with a matching name is returned.<br />
--- If the search target was not found then nil is returned. If it was found then it is returned as a component address, which must be cast to a uicomponent script object using the UIComponent function. The find_uicomponent function provided by the script libraries does this automatically, so it's recommended to use that function in place of this function.
---@param identifier any Search target, identified by index number or string name.
---@param assert_on_fail boolean Assert if no matching uicomponent could be found.
function UIC:Find(identifier, assert_on_fail) end

--- Sets the uicomponent to a new screen position, measured from the top-left corner of the game window/screen.
---@param x number X co-ordinate in pixels.
---@param y number Y co-ordinate in pixels.
function UIC:MoveTo(x, y) end

--- Sets the opacity of a specified image associated with the current state of the uicomponent.
---@param state_image_index number The index of the image's association with the current uicomponent state.
---@param opacity number Desired opacity value, from 0-255.
function UIC:SetCurrentStateImageOpacity(state_image_index, opacity) end

--- Simulates a double-left-click on the uicomponent. Relative co-ordinates at which the click is simulated on the component may optionally be specified. Both arguments must be supplied to specify a position.
---@param x number X co-ordinate of click on component.
---@param y number Y co-ordinate of click on component.
function UIC:SimulateDblLClick(x, y) end

--- Returns the height of a specified image associated with the current state of the uicomponent.
---@param state_image_index number The index of the image's association with the current uicomponent state.
function UIC:GetCurrentStateImageHeight(state_image_index) end

--- Returns the width and height of the uicomponent in pixels.
function UIC:Dimensions() end

--- Returns the visibility flag of this uicomponent. An optional argument also performs the test on all parent uicomponents up to the root, which will detect whether this uicomponent is visible but a parent is not.
---@param recursive boolean Also test all parents up to the root.
function UIC:Visible(recursive) end

--- Returns the number of immediate children this uicomponent has. These children can be individually retrieved by using uicomponent:Find and supplying a numeric value.
function UIC:ChildCount() end

--- Returns the dimensions of the text displayed on the uicomponent in its current state, if any.
function UIC:TextDimensions() end

--- Returns whether this uicomponent is currently being dragged around the screen by the player left-clicking and dragging.
function UIC:IsDragged() end

--- Performs a rotation of an image associated with the uicomponent. The image is specified by a 0-based numeric index of the images associated with this uicomponent. An optional pivot point can be specified, which sets a new pivot centre for the specified image.
---@param image_index number Index value of image associated with uicomponent to rotate.
---@param rotation number Amount by which to rotate the image in radians.
---@param pivot_x number X co-ordinate in pixels of the new pivot point of the image, relative to the top-left corner of the uicomponent.
---@param pivot_y number Y co-ordinate in pixels of the new pivot point of the image, relative to the top-left corner of the uicomponent.
function UIC:SetImageRotation(image_index, rotation, pivot_x, pivot_y) end

--- Returns the docking offset set for the specified image associated with the current state of the uicomponent.
---@param state_image_index number The index of the image's association with the current uicomponent state.
function UIC:GetCurrentStateImageDockOffset(state_image_index) end

--- Returns the number of images associated with the current state of this uicomponent.
function UIC:NumCurrentStateImages() end

--- Returns the docking point of this uicomponent. Valid returned values are given in the table at the top of this section.
function UIC:DockingPoint() end

--- Gets the context object (cco lua type) for the supplied type that is stored on the component
---@param context_type_id string context type id
function UIC:GetContextObject(context_type_id) end

--- Returns the string name of this uicomponent.
function UIC:Id() end

--- Starts an animation on the uicomponent by name. Available animations on a given uicomponent can be seen in the ui editor.
---@param animation_name string animation name
function UIC:TriggerAnimation(animation_name) end

--- Sets a context object on a component, to initialise any ContextCallbacks to show information for the supplied cco
---@param Takes_a_cco_to_set_on_the_component cco Takes a cco to set on the component
function UIC:SetContextObject(Takes_a_cco_to_set_on_the_component) end

--- Sets the opacity of this uicomponent and propagates the change to all its children. The opacity value should be specified as a number between 0 (transparent) and 255 (fully opaque). An optional flag also applies the opacity setting to all states of each uicomponent, as opposed to just the current state.
---@param opacity_value number opacity value
---@param to_all_states apply to all states
function UIC:PropagateOpacity(opacity_value, to_all_states) end

--- Simulates a keypress-up on the uicomponent. A string key id must be specified from the list documented at the top of this section.
---@param key_id string key id
function UIC:SimulateKeyUp(key_id) end

--- Allows or disallows the width of this uicomponent to be changed by code or script.
---@param can_resize boolean can resize
function UIC:SetCanResizeWidth(can_resize) end

--- Returns the value of the specified uicomponent property. The names of properties on any given uicomponent may be looked up in the ui editor.
---@param property_name string property name
function UIC:GetProperty(property_name) end

--- Returns the width and height in pixels of an image associated with the subject uicomponent. The image is specified by a 0-based index.
---@param image_index number Index of image to return the path of.
function UIC:GetImageDimensions(image_index) end

--- Sets the visibility state of this uicomponent.
---@param is_visible boolean is visible
function UIC:SetVisible(is_visible) end

--- Returns the index of an image's association with this uicomponent, based on the index of that image's association with the current state. All indexes are 0-based.
---@param state_image_index number The index of the image's association with the current uicomponent state.
function UIC:GetCurrentStateImageIndex(state_image_index) end

--- Gets the docking point of the specified image associated with the current state of the uicomponent. The value is returned as a number. Valid number values are given in the table in the Docking section of this documentation.
---@param state_image_index number The index of the image's association with the current uicomponent state.
function UIC:GetCurrentStateImageDockingPoint(state_image_index) end

--- Returns the value of the specified uicomponent property. The names of properties on any given uicomponent may be looked up in the ui editor.
---@param property_name string property name
---@param property_value any property value
function UIC:SetProperty(property_name, property_value) end

--- Simulates a keypress on the uicomponent. A string key id must be specified from the list documented at the top of this section.
---@param key_id string key id
function UIC:SimulateKey(key_id) end

--- Finds a component that has been tagged in a layout with the ScriptTag callback using the value of the Context Function id as the unique id to match against. It is a more robust mechanism of searching that sequential find as it is independant from layout order so is less likely to break from layout changes.
---@param script_tag_unique_id_that_has_been_specified_in_the_layout string script tag unique id that has been specified in the layout
function UIC:FindByScriptTag(script_tag_unique_id_that_has_been_specified_in_the_layout) end

--- Calls an interface function on the uicomponent, by string name. Interface functions are provided by some uicomponents to allow the script to activate specific functionality related to the uicomponent. Along with the string name of the interface function, multiple arguments to pass to that function may be specified.
---@param function_name string Name of interface function to call.
---@vararg any
function UIC:InterfaceFunction(function_name, varargs) end

--- Instructs this uicomponent to steal a game shortcut key, so that keypresses of that type are redirected to this uicomponent which will handle them. If a shortcut is stolen it must be released again at some suitable later time for the default keypress behaviour to be restored.<br />
--- Keyboard shortcuts are listed in data\text\default_keys.xml.
---@param should_steal boolean If set to true, the key must be specified as the second argument. If false, all keys stolen by this uicomponent will be released so no second argument is required.
---@param key_type string Key type to steal.
function UIC:StealShortcutKey(should_steal, key_type) end

--- Returns the current height of the uicomponent in pixels.
function UIC:Height() end

--- Returns whether or not the mouse cursor is currently over this uicomponent or any of its children.
function UIC:IsMouseOverChildren() end

--- Sets the opacity of the uicomponent. This should be specified as a number between 0 (transparent) and 255 (fully opaque). An optional flag also applies the opacity setting to all states of the uicomponent, as opposed to just the current state.
---@param opacity_value number opacity value
---@param to_all_states apply to all states
function UIC:SetOpacity(opacity_value, to_all_states) end

--- Returns whether this uicomponent is disabled or not. Disabled uicomponents do not respond to mouse clicks but still respond to the mouse cursor being placed over them.
function UIC:IsDisabled() end

--- Returns a table containing the names of each animation contained by the uicomponent. The table is indexed by number, but the ordering of animation names within the table is not guaranteed between different calls to this function.
function UIC:GetAnimationNames() end

--- Gets the context object id for the supplied type that is stored on the component, to allow you to perform queries/commands on the context with (get_context_value/call_context_command).
---@param context_type_id string context type id
function UIC:GetContextObjectId(context_type_id) end

--- Sets this uicomponent to be disabled or not. Disabled uicomponents do not respond to mouse clicks but still respond to the mouse cursor being placed over them.
---@param is_disabled boolean is disabled
function UIC:SetDisabled(is_disabled) end

--- Returns the priority of this uicomponent.
function UIC:Priority() end

--- Sets the component priority of this uicomponent and all its children to the supplied value. The old priority of the uicomponent is returned.
---@param priority number priority
function UIC:PropagatePriority(priority) end

--- Returns whether the uicomponent contains an animation with the supplied name.
---@param animation_name string animation name
function UIC:AnimationExists(animation_name) end

--- Sets whether the specified image associated with the current state of the uicomponent is tiled or not.
---@param state_image_index number The index of the image's association with the current uicomponent state.
---@param is_tiled boolean is tiled
function UIC:SetCurrentStateImageTiled(state_image_index, is_tiled) end

--- Returns the current width of the uicomponent in pixels.
function UIC:Width() end

--- Simulates a keypress-down on the uicomponent. A string key id must be specified from the list documented at the top of this section.
---@param key_id string key id
function UIC:SimulateKeyDown(key_id) end

--- Simulates a mouse-off event on the uicomponent.
function UIC:SimulateMouseOff() end

--- Activates a priority lock on the uicomponent. This disables all uicomponents with a priority value less than the priority of the lock. A priority may optionally be specified - if not, the uicomponent's own priority is used.<br />
--- uicomponent:UnLockPriority must be called after calling this function to restore normal ui functionality.
---@param priority number priority
function UIC:LockPriority(priority) end

--- Simulates a mouse-on event on the uicomponent. You MUST call SimulateMouseOff when done otherwise mouse on will be stuck on. Also note that you might have to wait a tick before expected functionality occurs (say a panel opening on mousing over this component), as some callbacks work by checking for mouseover each update tick and dont use OnMouseOn
function UIC:SimulateMouseOn() end

--- Simulates a double-left-click on the uicomponent. Relative co-ordinates at which the click is simulated on the component may optionally be specified. Both arguments must be supplied to specify a position.
---@param x number X co-ordinate of click on component.
---@param y number Y co-ordinate of click on component.
function UIC:SimulateDblRClick(x, y) end

--- Returns the text x offset values of the current state. This is the padding around the left and right side of any text displayed on the current state of the uicomponent. Offset values greater than 0 enforce a border around the edge of the text so that it does not run right up to the edge of the displayed component.
function UIC:TextXOffset() end

--- Simulates a right-click on the uicomponent. Relative co-ordinates at which the click is simulated on the component may optionally be specified. Both arguments must be supplied to specify a position.
---@param x number X co-ordinate of click on component.
---@param y number Y co-ordinate of click on component.
function UIC:SimulateRClick(x, y) end

--- Simulates a left-click on the uicomponent. Relative co-ordinates at which the click is simulated on the component may optionally be specified. Both arguments must be supplied to specify a position.
---@param x number X co-ordinate of click on component.
---@param y number Y co-ordinate of click on component.
function UIC:SimulateLClick(x, y) end

--- Sets whether the height can be resized of the specified image associated with the current state of the uicomponent.
---@param state_image_index number The index of the image's association with the current uicomponent state.
---@param can_resize boolean Can resize.
function UIC:SetCanResizeCurrentStateImageHeight(state_image_index, can_resize) end

--- Sets the text x offset values of the current state. This is the padding around the left and right side of any text displayed on the current state of the uicomponent. Offset values greater than 0 enforce a border around the edge of the text so that it does not run right up to the edge of the displayed component.
---@param left_offset number left offset
---@param right_offset number right offset
function UIC:SetTextXOffset(left_offset, right_offset) end

--- Deactivates a pulsing highlight effect on a particular state of the subject uicomponent that was previously started with uicomponent:StartPulseHighlight.
---@param state_name string State name to stop the pulsing effect on. If this is not supplied then the current state is used.
function UIC:StopPulseHighlight(state_name) end

--- Sets the text y offset values of the current state. This is the padding around the top and bottom of any text displayed on the current state of the uicomponent. Offset values greater than 0 enforce a border around the edge of the text so that it does not run right up to the edge of the displayed component.
---@param top_offset number top offset
---@param bottom_offset number bottom offset
function UIC:SetTextYOffset(top_offset, bottom_offset) end

--- Returns the text y offset values of the current state. This is the padding around the top and bottom of any text displayed on the current state of the uicomponent. Offset values greater than 0 enforce a border around the edge of the text so that it does not run right up to the edge of the displayed component.
function UIC:TextYOffset() end

--- Activates a fullscreen highlight around the subject uicomponent. This places a nearly opaque layer over the screen except for a window over the subject uicomponent, leaving it prominently displayed. Text may optionally be specified that gets displayed over the opaque layer.
---@param highlight_text string Text to display over the fullscreen highlight. If used, this should be set to the key of an entry from the random_localisation_strings table.
---@param once_only boolean Displays this fullscreen highlight once only. If this flag is set, an entry is stored in the registry when this fullscreen highlight is displayed, preventing it from ever being displayed again.
function UIC:FullScreenHighlight(highlight_text, once_only) end

--- Sets this uicomponent to be interactive or not. Non-interactive uicomponents do not respond to any mouse events.
---@param is_interactive boolean is interactive
function UIC:SetInteractive(is_interactive) end

--- Returns the path of an image associated with the subject uicomponent. The image is specified by a 0-based index.
---@param image_index number Index of image to return the path of.
function UIC:GetImagePath(image_index) end

--- Returns the opacity of a specified image associated with the current state of the uicomponent. The returned value will be between 0 and 255.
---@param state_image_index number The index of the image's association with the current uicomponent state.
function UIC:GetCurrentStateImageOpacity(state_image_index) end

--- Many uicomponents are set to resize based on the text they are displaying. Despite this, it is sometimes desireable to resize these uicomponents (to set a different width for a text box that can grow, for example). However, any attempt by script to resize these uicomponents will be overriden by the text resizing behaviour.<br />
--- This function provides a method of working around this, temporarily disabling the text-resizing behaviour so that the desired resize can be applied.
---@param width number Width in pixels.
---@param height number Height in pixels.
function UIC:ResizeTextResizingComponentToInitialSize(width, height) end

--- Sets variables on the text shader technique currently active on the uicomponent. What values can be set and what they do is specific to each shader - see the documented list at the top of this section. Up to four shader values can be specified, each one being a number.
---@param first_value number First shader value.
---@param second_value number Second shader value.
---@param third_value number Third shader value.
---@param fourth_value number Fourth shader value.
---@param all_states boolean Apply the shader to all states of this uicomponent.
function UIC:TextShaderVarsSet(first_value, second_value, third_value, fourth_value, all_states) end

--- Returns the callback id of this uicomponent.
function UIC:CallbackId() end

--- Returns the variables of the shader currently active on the uicomponent.
function UIC:ShaderVarsGet() end

--- Returns the vertical text alignment setting of the current state as a string. Valid alignment values are "top", "centre" and "bottom".
function UIC:GetTextVAlign() end

--- Sets the width and height of a specified image associated with the current state of the uicomponent.
---@param state_image_index number The index of the image's association with the current uicomponent state.
---@param width number Width in pixels.
---@param height number Height in pixels.
function UIC:ResizeCurrentStateImage(state_image_index, width, height) end

--- Sets variables on the shader technique currently active on the uicomponent. What values can be set and what they do is specific to each shader - see the documented list at the top of this section. Up to four shader values can be specified, each one being a number.
---@param first_value number First shader value.
---@param second_value number Second shader value.
---@param third_value number Third shader value.
---@param fourth_value number Fourth shader value.
---@param all_states boolean Apply the shader to all states of this uicomponent.
---@param include_text boolean Also apply the shader to the text of the uicomponent.
function UIC:ShaderVarsSet(first_value, second_value, third_value, fourth_value, all_states, include_text) end

--- Returns the name of the state at the specified index.
---@param state_index number state index
function UIC:GetStateByIndex(state_index) end

--- Creates a new uicomponent as the child of this uicomponent. A name for the new uicomponent must be supplied, as well as a filepath to a layout file containing a template for the new uicomponent. The address of the new uicomponent is returned - this must be cast to be a uicomponent using the UIComponent function.
---@param uicomponent_name string uicomponent name
---@param file_path string file path
function UIC:CreateComponent(uicomponent_name, file_path) end

--- Sets the active shader technique on the uicomponent, applying a custom graphical shader effect. The shader may be specified as a string key or a number. Valid shader keys are given in the table at the top of this section.
---@param shader any Shader to apply. This may be a string key or a number.
---@param all_states boolean Apply the shader to all states of this uicomponent.
---@param include_text boolean Also apply the shader to the text of the uicomponent.
function UIC:ShaderTechniqueSet(shader, all_states, include_text) end

--- Sets the docking point of the specified image associated with the current state of the uicomponent. Valid values are given in the table in the Docking section of this documentation.
---@param state_image_index number The index of the image's association with the current uicomponent state.
---@param dock_point number Dock point.
function UIC:SetCurrentStateImageDockingPoint(state_image_index, dock_point) end

--- Registers this uicomponent to be drawn topmost. Topmost uicomponents are drawn outside of the normal hierarchy on the top of all other uicomponents. This setting is useful for uicomponents such as tooltips that must always be drawn over the top of other visible parts of the UI.
function UIC:RegisterTopMost() end

--- Sets the visibility state of this uicomponent and all its children.
---@param is_visible boolean is visible
function UIC:PropagateVisibility(is_visible) end

--- Deactivates a priority lock on the uicomponent.
function UIC:UnLockPriority() end

--- Gets an animation frame property. Different interpolation types return different numbers of arguments. See UiEd animation menu.
---@param animation_name string Animation name.
---@param frame_number number Frame number. This number is 0-based, so a value of 1 would specify the second frame in the animation.
---@param interpolation_type string Interpolation type string. Valid values are "colour", "position", "scale", "shader_values", "rotation", "image", "opacity", "text", "interpolation_time", "font_scale" and "material_params".
function UIC:GetAnimationFrameProperty(animation_name, frame_number, interpolation_type) end

--- Sets an animation frame property. Different interpolation types require different numbers of arguments. See UiEd animation menu.
---@param animation_name string Animation name.
---@param frame_number number Frame number. This number is 0-based, so a value of 1 would specify the second frame in the animation.
---@param interpolation_type string Interpolation type string. Valid values are "colour", "position", "scale", "shader_values", "rotation", "image", "opacity", "text", "interpolation_time", "font_scale" and "material_params".
---@param first_value number First property value.
---@param second_value number Second property value.
---@param third_value number Third property value.
---@param fourth_value number Fourth property value.
function UIC:SetAnimationFrameProperty(animation_name, frame_number, interpolation_type, first_value, second_value, third_value, fourth_value) end

--- Returns whether this uicomponent is moveable or not.
function UIC:IsMoveable() end

--- Returns whether this uicomponent is interactive or not. Non-interactive uicomponents do not respond to any mouse events.
function UIC:IsInteractive() end

--- Returns the address of this uicomponent, which is used for certain other functions on this interface such as uicomponent:Adopt.
function UIC:Address() end

--- Returns the number of states this uicomponent contains.
function UIC:NumStates() end

--- Instructs this uicomponent to steal all keyboard input. All keypresses are therefore redirected to this uicomponent which will handle them. If input focus is stolen by a uicomponent then standard keyboard behaviour will be overridden until it is released with a second call to this function.
---@param should_steal boolean should steal
function UIC:StealInputFocus(should_steal) end

--- Sets the docking offset of the specified image associated with the current state of the uicomponent.
---@param state_image_index number The index of the image's association with the current uicomponent state.
function UIC:SetCurrentStateImageDockOffset(state_image_index) end

--- Sets the y-flipped value for the specified image associated with the current state of the uicomponent. If set, this flips the image vertically.
---@param state_image_index number The index of the image's association with the current uicomponent state.
---@param flip boolean Image should be vertically flipped.
function UIC:SetCurrentStateImageYFlip(state_image_index, flip) end
