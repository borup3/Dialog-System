/// @description Begin a dialog
/// @function dialog_begin
/// @arg key The key of the dialog to start
/// @arg [args,...] Optional arguments to pass on to the dialog

var key = argument[0];

if(!instance_exists(obj_dialog))
{
	// Are all start conditions satisfied for this dialog?
	var start_conditions = dialog_get_start_conditions(key);
	if(start_conditions != undefined) {
		for(var i = 0; i < ds_list_size(start_conditions); ++i) {
			var allow_dialog = script_execute(ds_list_find_value(start_conditions, i));
			if(!allow_dialog) return; // can't start this dialog, conditions not satisfied
		}
	}
	
	var __id = instance_create_layer(0, 0, DIALOG_SYSTEM_ROOM_LAYER, obj_dialog);
	__id.key = key;
	
	// Did this come from dialog_tick?
	var from_tick = global.begin_called_from_dialog_tick;
	
	with(__id) {
		var __arg = 1;
		var __off = 0;
		arg_count = argument_count;
		
		// Keep a reference to the calling instance for macro expansion to variables
		if(!from_tick) {
			// Not coming from dialog_tick, so calling instance is the id
			arg[0] = other;
		}
		else {
			// Coming from dialog_tick, so calling instance is argument[1]
			arg[0] = argument[1];
			__off = 1;
		}
		
		while (__arg < argument_count - __off) {
			arg[__arg] = argument[__arg + __off];
			++__arg;
		}
		
		event_user(0);
		event_user(1); // start events
	}
}
else
{
	var temp = global.dialog_list;
	var __args = 1;
	var args;
	args[0] = key;
	args[1] = id; // Keep a reference to the calling instance for macro expansion to variables
	while (__args < argument_count) {
		args[__args + 1] = argument[__args];
		++__args;
	}

	ds_list_add(temp, args);
}