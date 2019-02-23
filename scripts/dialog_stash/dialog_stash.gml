/// @desc Return a copy of the dialog queue and clear the tick list
/// @returns A copy of the dialog queue

var stash = ds_list_create();
ds_list_copy(stash, global.dialog_list);
ds_list_clear(global.dialog_list);
return stash;
