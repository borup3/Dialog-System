/// @desc Adds the list to the end of the dialog queue
/// @arg list The list to append

var list = argument0;
for(var i = 0; i < ds_list_size(list); ++i)
	ds_list_add(global.dialog_list, ds_list_find_value(list, i));