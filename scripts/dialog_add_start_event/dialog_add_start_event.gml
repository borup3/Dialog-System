/// @desc Add a script to execute when this dialog starts
/// @func dialog_add_start_event
/// @arg dialog The dialog to add the event to
/// @arg script The script to add

var __map = global.dialog_start_events;
var __list = ds_map_find_value(__map, argument0);

if(__list == undefined)
{
	__list = ds_list_create();
	ds_map_set(__map, argument0, __list);
}

ds_list_add(__list, argument1);