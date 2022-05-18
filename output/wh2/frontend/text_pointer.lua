--- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT EDIT MANUALLY.

---@class text_pointer
local text_pointer = {}

--- Creates a text_pointer object. Text pointers must be given a unique name, an x/y position, a pointer.
---@param name string Name for the text pointer. Must be unique amongst text pointers.
---@param x_position number X position. This is either the absolute position on-screen, or the position in 3D space if the pointer display mode is set to worldspace. 
---@param y_position number Y position. This is either the absolute position on-screen, or the position in 3D space if the pointer display mode is set to worldspace.
---@param length number Length of the attached arrow pointer and line. Can be zero.
---@param display_mode string "subtitle", a special mode, whereby the text pointer appears and behaves as a cutscene subtitle in the lower cinematic bar. x/y positions are disregarded in this case.
---@return text_pointer   
function text_pointer:new(name, x_position, y_position, length, display_mode) end

--- Sets the path to the folder that contains the component layout file. Default value is "UI/Common UI/".
---@param path string path
function text_pointer:set_layout_path(path) end

--- Sets the name of the layout to use for this text pointer. Default value is "text_pointer_text_only".
---@param path string path
function text_pointer:set_layout(path) end

--- Returns the text label uicomponent
---@return UIC  text label 
function text_pointer:get_text_label() end

--- Sets the width of the pointer line. Default width is 5 pixels.
---@param pointer_width number pointer width
function text_pointer:set_pointer_width(pointer_width) end

--- Sets the width of the text panel on-screen. The default width is set by the component layout.
---@param panel_width number Width of panel on-screen in pixels.
---@param shrink_horizontally boolean Shrink text horizontally if on one line.
function text_pointer:set_panel_width(panel_width, shrink_horizontally) end

--- Sets the width of the text panel on-screen to be the screen width minus a supplied numeric value.
---@param difference number Width of panel on-screen will be the screen width minus this value, in pixels.
---@param shrink_horizontally boolean Shrink text horizontally if on one line.
function text_pointer:set_panel_width_to_screen(difference, shrink_horizontally) end

--- Sets the height of the terrain at the pointer position. This only needs to be set if the pointer is displaying in worldspace. The script has no way of determining the height of the terrain at a position in worldspace, so it must be supplied here.<br />
--- Without setting a height, a worldspace pointer will appear pointing to a height of 0, which will likely be beneath the terrain being pointed at.
---@param display_height number display height
function text_pointer:set_worldspace_display_height(display_height) end

--- Without setting a label offset, the text label with be centred to the position being pointed at e.g. centred directly above it if the display mode is set to "bottom", centred to the left if the display mode is set to "right" etc. Set a label offset to move the label relative to this position.
---@param x_offset number x offset in pixels.
---@param y_offset number y offset in pixels.
function text_pointer:set_label_offset(x_offset, y_offset) end

--- Sets the component priority of the text pointer. This determines what components the text pointer is drawn on top of, and what components it is drawn underneath.
---@param priority number priority
function text_pointer:set_priority(priority) end

--- Sets the text pointer components to be topmost in the UI heirarchy.
---@param topmost boolean topmost
function text_pointer:set_topmost(topmost) end

--- Sets the text pointer to pulse-highlight when it shows.
---@param pulse boolean Set to true to enable pulsing.
---@param pulse_strength number Pulse strength override. Supply a positive number here to modify the strength of the pulse. Default value is 5.
function text_pointer:set_should_pulse(pulse, pulse_strength) end

--- Sets the text pointer to stream its text, and optionally sets the duration over which the text is to be streamed.
---@param should_stream boolean should stream
---@param stream_duration number stream duration
function text_pointer:set_stream_by_char(should_stream, stream_duration) end

--- Sets just the duration over which the text is to be streamed.
---@param stream_duration number Stream duration in seconds
function text_pointer:set_stream_duration(stream_duration) end

--- Sets a different panel show animation. Any animation set here must be present on the panel component in the text pointer layout. Default is "show".
---@param animation_name string animation name
function text_pointer:set_panel_show_animation(animation_name) end

--- Sets a different panel hide animation. Any animation set here must be present on the panel component in the text pointer layout. Default is "hide".
---@param animation_name string animation name
function text_pointer:set_panel_hide_animation(animation_name) end

--- Sets a text show animation. Any animation set here must be present on the line component in the text pointer layout.
---@param animation_name string animation name
function text_pointer:set_text_show_animation(animation_name) end

--- Sets a text hide animation. Any animation set here must be present on the line component in the text pointer layout.
---@param animation_name string animation name
function text_pointer:set_text_hide_animation(animation_name) end

--- Sets a different state for the text pointer panel. Any state set here must be present on the panel component in the text pointer layout.
---@param state_name string state name
function text_pointer:set_panel_state_override(state_name) end

--- Sets a different state for each line of text pointer panel. Any state set here must be present on the line component in the text pointer layout.
---@param state_name string state name
function text_pointer:set_text_state_override(state_name) end

--- Shows a close button on the text pointer. By default a close button is not shown.
---@param show_button boolean show button
function text_pointer:set_show_close_button(show_button) end

--- Hides the text pointer when the close button is clicked. By default, this is enabled, so the panel closes when the button is clicked.
---@param close_on_click boolean close on click
function text_pointer:set_hide_on_close_button_clicked(close_on_click) end

--- Set a callback to call when the close button is clicked. An optional delay may also be set. This also sets the close button to show.
---@param callback function Callback
---@param delay number Delay before calling callback, in s (campaign) or ms (battle/frontend)
function text_pointer:set_close_button_callback(callback, delay) end

--- Overrides the component to use as the close button, by name.
---@param component_name string component name
function text_pointer:set_close_button_component(component_name) end

--- Instructs the text pointer to highlight the close button when it shows, with an optional delay between the time of showing and the time the close button is highlighted. Immediately highlights the close button if the text pointer is already showing.
function text_pointer:set_highlight_close_button() end

--- Sets the text pointer to position itself/behave as a cutscene subtitle, in the lower cinematic bar. This is akin to setting the pointer display mode to "subtitle" in text_pointer:new.
function text_pointer:set_subtitle() end

--- Sets a subtitle position string, which determines where the subtitle is displayed. This also sets the text pointer into subtitle mode. Valid subtitle modes are as follows:<br />
--- bottom_subtitle_bar<br />
--- top_subtitle_bar<br />
--- top_centre<br />
--- By default, subtitles show on the bottom subtitle bar unless set otherwise with this function.
---@param position string position
function text_pointer:set_subtitle_position(position) end

--- Sets the position of this text pointer relative to another pointer. Calling this function overrides this text pointer's display mode, and causes it to display relative to another text pointer's position when shown.
---@param text_pointer text_pointer Text pointer object to display relative to.
---@param x_offset number Supplying a value of 10 would mean a gap of 10 pixels between the two text pointers, with this text pointer on the right of the other, while a value of -10 would mean a gap of 10 pixels with this text pointer on the left.
---@param y_offset number Supplying a value of 10 would mean a gap of 10 pixels between the two text pointers, with this text pointer below the other (as a higher value of y means a position further down the screen), while a value of -10 would mean a gap of 10 pixels with this text pointer above the other.
function text_pointer:set_position_offset_to_text_pointer(text_pointer, x_offset, y_offset) end

--- Sets the text of the specified component on the text pointer to that looked up by a supplied db text key. Use this method to show customised text on the text pointer.
---@param component_name string Name of text component on the text pointer.
---@param override_text_key string Name of text component on the text pointer.
---@param from_streaming boolean Exempts this text from being streamed, if the text pointer is set to stream text.
function text_pointer:add_component_text(component_name, override_text_key, from_streaming) end

--- Makes the text pointer visible.
---@param display MILITARY_FORCE_SCRIPT_INTERFACE Forces the text pointer to display. This flag is only considered if the text pointer has been set to behave as a subtitle, in which case the text is always displayed and the player's subtitles preferences are ignored.
function text_pointer:show(display) end

--- Hides the text pointer. Supply true as a single argument to hide it immediately and prevent it from animating.
---@param immediately boolean immediately
function text_pointer:hide(immediately) end

--- Sets the style of this text pointer. Setting a style automatically sets a range of configuration options common to that style - inspect the script function to find out what exactly gets set or to add more styles. Current supported styles are:<br />
--- standard<br />
--- semitransparent_worldspace<br />
--- semitransparent<br />
--- semitransparent_large<br />
--- semitransparent_2_sec_highlight<br />
--- e3_subtitle_with_frame<br />
--- subtitle_with_frame<br />
--- top_centre_subtitle
---@param style string style
function text_pointer:set_style(style) end
