/// @desc Gets whether the current dialog can be escaped
/// @func dialog_can_escape
/// @returns True if it can be escaped, otherwise false

var curr = dialog_current();
for(var i = 0; i < array_length_1d(global.dialogs_you_cant_escape); ++i) {
	if(i == 0 && global.dialogs_you_cant_escape[0] == DIALOG_SYSTEM_CANT_ESCAPE_ANY) {
		// You can't escape out of any dialogs
		return false;
	}
	
	if(global.dialogs_you_cant_escape[i] == curr)
		return false;
}

return true;