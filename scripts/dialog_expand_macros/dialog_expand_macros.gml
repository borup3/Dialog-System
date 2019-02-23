/// @desc Expand macros in the given dialog string to the corresponding variables
/// @arg string The string to expand macros in
/// @returns The macro expanded string

//
//	The macro ${item_name} will be replaced with the value of the item_name variable on the calling instance
//	if it exists
//

var str = argument0;
var len = string_length(str);

// Find all macros
var macros = ds_list_create();
var i = 0;
repeat(len) {
	var ch = string_char_at(str, i++);
	if(ch == "$") {
		repeat(len - i) {
			ch = string_char_at(str, i++);
			if(ch == "{") {
				var macro_name = "";
				repeat(len - i) {
					ch = string_char_at(str, i++);
					if(ch == "}") break;
					macro_name += ch;
				}
				if(string_length(macro_name) != 0) ds_list_add(macros, macro_name);
			}
		}
	}
}

// Replace all macros
len = ds_list_size(macros);
i = 0;
repeat(len) {
	var macro_name = ds_list_find_value(macros, i++);
	if(variable_instance_exists(id, macro_name)) {
		str = string_replace_all(str, "${" + macro_name + "}", variable_instance_get(id, macro_name));
	}
}

ds_list_destroy(macros);
return str;