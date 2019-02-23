/// @desc Gets the given branch of a particular dialog key (this is a script)

return ds_map_find_value(global.dialog_map_branches, string(argument0) + string(argument1));