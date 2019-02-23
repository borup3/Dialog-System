/// @desc User input

// Select branch, if any
if(options != 0)
{
	if (keyboard_check_pressed(vk_up))
	{
		if(selected_branch > 0) selected_branch += -1;
	}
	else if (keyboard_check_pressed(vk_down))
	{
		if(selected_branch < options - 1) selected_branch += 1;
	}
}

// Are interact/escape keys pressed?
var interact = keyboard_check_pressed(vk_space);
var escape = false;
if (!interact) escape = keyboard_check_pressed(vk_escape);

// Skip to end of dialog, if applicable, if the interact key is pressed
// This skips the typewriter effect
var skiptoend = interact;

// If we're waiting for user input to progress the dialog, do that now
if(multiline_wait_for_player && interact) {
	// Progress dialog
	multiline_wait_for_player = false;
	++_curstring_arr;
	_curstring_index = 1;
	_curstring = "";
	alarm_set(0, DIALOG_SYSTEM_INCREMENT_DELAY);
	exit;
}

// Is the dialog done?
if(_curstring_arr == array_length_1d(_strings) - 1 && _curstring_index > string_length(_strings[_curstring_arr]))
{
	// Did the user select a branch?
	if(interact && options != 0)
	{
		was_escaped = false;
		var scope = calling_instance;
		
		// Get the selected branch (this is a script)
		var branch = dialog_get_branch(key, selected_branch);
		
		// Destroy obj_dialog
		instance_destroy();
		
		// Does the branch exist?
		if(branch != undefined && branch > -1) {
			// Any dialogs added from branches go immediately to the top of the queue
			var dialog_stack = dialog_stash();
			
			// If the instance no longer exists then it is executed from the scope of obj_dialog
			if(!instance_exists(scope)) {
				if(scope == calling_instance) calling_instance = id;
				script_execute(branch);
			}
			else with(scope) script_execute(branch);
			
			// Now append the old stack to the end of the list
			dialog_stash_append(dialog_stack);
			ds_list_destroy(dialog_stack);
		}
	}
	else if(interact || (escape && dialog_can_escape())) {
		// The dialog has either ended or has been escaped by the user
		was_escaped = !interact;
		
		// Destroy obj_dialog
		instance_destroy();
	}
}

if(skiptoend)
{
	// Skip to the end of dialog
	_curstring_arr = array_length_1d(_strings) - 1;
	_curstring = _strings[_curstring_arr];
	_curstring_index = string_length(_strings[_curstring_arr]) + 1;
	if(_curstring_arr < array_length_1d(_strings) - 1) multiline_wait_for_player = true;
}