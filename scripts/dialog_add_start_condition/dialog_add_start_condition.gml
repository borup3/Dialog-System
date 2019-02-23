/// @desc Add a script to execute that returns whether this dialog can start (true or false)
/// @func dialog_add_start_condition
/// @arg dialog The dialog to add the condition to
/// @arg script The script to add

var __map = global.dialog_start_condition;
var __list = ds_map_find_value(__map, argument0);

if(__list == undefined)
{
	__list = ds_list_create();
	ds_map_set(__map, argument0, __list);
}

ds_list_add(__list, argument1);