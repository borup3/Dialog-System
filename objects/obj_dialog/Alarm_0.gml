/// @desc Typewriter effect

// Add character to typewriter effect
_curstring += string_char_at(_strings[_curstring_arr], _curstring_index);
_curstring_index += 1;

if(_curstring_index <= string_length(_strings[_curstring_arr]))
{
	// More characters in current string
	alarm_set(0, DIALOG_SYSTEM_INCREMENT_DELAY);
}
else if(_curstring_arr < array_length_1d(_strings) - 1) {
	// Current string has ended
	if(dialog_wait_for_user_input()) {
		// Wait for user input before progressing in dialog
		multiline_wait_for_player = true;
	}
	else {
		// Next line
		++_curstring_arr;
		_curstring_index = 1;
		_curstring = "";
		alarm_set(0, DIALOG_SYSTEM_INCREMENT_DELAY);
	}
}