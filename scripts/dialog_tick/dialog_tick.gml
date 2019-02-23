/*
	Tick the dialog system.
*/

var force = argument0;

// If no dialog is active, and the stack has pending dialogs, start the next pending dialog
if(force || !instance_exists(obj_dialog))
{
	var list = global.dialog_list;
	// keep ticking until we spawn a dialog that satisfied its start conditions, or ran out
	while(!instance_exists(obj_dialog) && ds_list_size(list) > 0) {
		var pending_args = ds_list_find_value(list, 0);
		ds_list_delete(list, 0);
		var dialog_key = pending_args[0];
		var argcount = array_length_1d(pending_args) - 1;
		global.begin_called_from_dialog_tick = true;
		switch(argcount)
		{
			case 0: dialog_begin(dialog_key); break;
			case 1: dialog_begin(dialog_key, pending_args[1]); break;
			case 2: dialog_begin(dialog_key, pending_args[1], pending_args[2]); break;
			case 3: dialog_begin(dialog_key, pending_args[1], pending_args[2], pending_args[3]); break;
			case 4: dialog_begin(dialog_key, pending_args[1], pending_args[2], pending_args[3], pending_args[4]); break;
			case 5: dialog_begin(dialog_key, pending_args[1], pending_args[2], pending_args[3], pending_args[4], pending_args[5]); break;
			case 6: dialog_begin(dialog_key, pending_args[1], pending_args[2], pending_args[3], pending_args[4], pending_args[5], pending_args[6]); break;
			case 7: dialog_begin(dialog_key, pending_args[1], pending_args[2], pending_args[3], pending_args[4], pending_args[5], pending_args[6], pending_args[7]); break;
			case 8: dialog_begin(dialog_key, pending_args[1], pending_args[2], pending_args[3], pending_args[4], pending_args[5], pending_args[6], pending_args[7], pending_args[8]); break;
			default: show_debug_message("dialog_tick has more arguments than supported (8)"); dialog_begin(dialog_key); break;
		}
		global.begin_called_from_dialog_tick = false;
	}
}