/// @description Run start events

// Run start events
var __events = dialog_get_start_events(key);
if(__events != undefined)
{
	// If the instance no longer exists then it is executed from the scope of obj_dialog
	if(calling_instance == undefined || !instance_exists(calling_instance)) calling_instance = id;
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