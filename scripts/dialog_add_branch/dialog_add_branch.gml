/// @desc Add a branch to a dialog
/// @arg dialog The dialog the add the branch to
/// @arg branch The branch number (this must be a linear sequence of numbers)
/// @arg script The script to execute when this branch is chosen
/// @arg text The text to show for this branch

var __map = global.dialog_map_branches;
ds_map_set(__map, string(argument0) + string(argument1), argument2);

var __map = global.dialog_map_names;
ds_map_set(__map, string(argument0) + string(argument1), argument3);