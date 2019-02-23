/// @desc Remove a branch from a dialog
/// @arg dialog The dialog the remove the branch from
/// @arg branch The branch number

var __map = global.dialog_map_branches;
ds_map_delete(__map, string(argument0) + string(argument1));
var __map = global.dialog_map_names;
ds_map_delete(__map, string(argument0) + string(argument1));