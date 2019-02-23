// @desc Wraps a string if it exceeds a given width

var str = argument0;
var max_width = argument1;
var curline = "";
var lineindex = 0;
var wrapped_array;
var index = 0;

if(max_width < 0) {
	// Handle invalid argument safely
	return [str];
}

// Iterate over the string to wrap it
while (index < string_length(str)) {
	++index;
	var ch = string_char_at(str, index);
	curline += ch;
	
	if(ch == "\n")
	{
		// Commit the linebreak
		++lineindex;
		wrapped_array[lineindex] = "";
		curline = "";
	}
	else if(string_width(curline) >= max_width) {
		// Backtrack to find a whitespace where we can wrap
		var whitespace = index;
		while ((whitespace > 0)) {
			if(string_char_at(curline, whitespace) == " ") break;
			--whitespace;
		}
		
		// Commit the wrapped string
		wrapped_array[lineindex] = string_copy(curline, 0, whitespace);
		curline = string_copy(curline, whitespace + 1, string_length(curline) - (whitespace + 1));
		++lineindex;
		--index;
	}

	wrapped_array[lineindex] = curline;
}

// Return the array of strings after wrapping it
return wrapped_array;