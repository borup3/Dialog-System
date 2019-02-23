/// @desc Finish/escape event and free

// Any dialogs added from escape/finish events go immediately to the top of the queue
// Branches are executed after this event, so it just works
var dialog_stack = dialog_stash();

// If the instance no longer exists then it is executed from the scope of obj_dialog
if(calling_instance == undefined || !instance_exists(calling_instance)) calling_instance = id;

// Run finish events
var __events = dialog_get_finish_events(key);
if(__events != undefined)
{
	with(calling_instance) {
		var index = 0;
		var event_count = ds_list_size(__events);
		while ((index < event_count)) {
			var event = ds_list_find_value(__events, index);
			script_execute(event);
			++index;
		}
	}
}

if(was_escaped) {
	// Run escape events
	var __events = dialog_get_escape_events(key);
	if(__events != undefined)
	{
		with(calling_instance) {
			var index = 0;
			var event_count = ds_list_size(__events);
			while ((index < event_count)) {
				var event = ds_list_find_value(__events, index);
				script_execute(event);
				++index;
			}
		}
	}
}

// Now append the old stack to the end of the list
dialog_stash_append(dialog_stack);
ds_list_destroy(dialog_stack);