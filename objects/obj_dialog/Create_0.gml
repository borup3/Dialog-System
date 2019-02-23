/// @desc Initialize

_string = "";			// The current string
_strings[0] = "";		// The wrapped strings that are drawn
arg_count = 0;			// The amount of arguments passed to this dialog
arg[0] = undefined;		// All arguments passed to this dialog, arg[0] is always the calling instance

_curstring_index = 1;	// Current string index for typewriter effect
_curstring_arr = 0;		// The current _strings array index for typewriter effect
_curstring = "";		// The currently building string for typewriter effect, from the current _strings entry
dialogHeight = 0;		// The height of this dialog, i.e. the height of all wrapped strings and linebreaks
branchesHeight = 0;		// The height of the branches dialog

_branches = 0;						// The branches as a ds_list
selected_branch = 0;				// The currently selected branch
options = 0;						// ds_list_size(_branches)
multiline_wait_for_player = false;	// Whether it's waiting for user input to progress in the current dialog, or not

// The instance that spawned this dialog
// Gets overwritten in User Event 0
calling_instance = id;

// In destroy event, if was_escaped is true also run escape events
was_escaped = false;