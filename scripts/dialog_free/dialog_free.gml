/// @desc Free all resources used by the dialog system

var temp = global.dialog_map_strings;
ds_map_destroy(temp);

var temp = global.dialog_map_branches;
ds_map_destroy(temp);

var temp = global.dialog_map_names;
ds_map_destroy(temp);

var temp = global.dialog_finish_events;
ds_map_destroy(temp);

var temp = global.dialog_escape_events;
ds_map_destroy(temp);

var temp = global.dialog_list;
ds_list_destroy(temp);

ds_map_destroy(global.dialog_start_events);