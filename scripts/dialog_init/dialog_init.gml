/// @desc Initializes the dialog system

// Instances of obj_dialog go onto this room layer
#macro DIALOG_SYSTEM_ROOM_LAYER "Dialogue_Layer"

// A delay that can be set to wait n frames before showing the dialog
#macro DIALOG_SYSTEM_START_DELAY 0

// A macro that tells the dialog system not to do anything if this branch is selected
#macro DO_NOTHING -1

// Delay before inserting a new character in a typewriter effect
#macro DIALOG_SYSTEM_INCREMENT_DELAY 2

// If this macro is assigned to global.dialogs_you_cant_escape[0] then it indicates that no dialogs can be "escaped" out of
// Otherwise only the dialogs in the array are dialogs that cannot be escaped from
#macro DIALOG_SYSTEM_CANT_ESCAPE_ANY -100

// This array contains dialogs you can't escape out of, i.e. you have to exit by ending the dialog
//global.dialogs_you_cant_escape[2] = SOME_DIALOG_KEY_3;
//global.dialogs_you_cant_escape[1] = SOME_DIALOG_KEY_2;
global.dialogs_you_cant_escape[0] = DIALOG_SYSTEM_CANT_ESCAPE_ANY;

//
//	Create all the data structures we make use of
//

var map = ds_map_create();
global.dialog_map_strings = map;				// All the dialog strings added with dialog_add_string

map = ds_map_create();
global.dialog_map_branches = map;				// All the dialog branches added with dialog_add_branch

map = ds_map_create();
global.dialog_map_names = map;					// All the dialog branch names added with dialog_add_branch

map = ds_map_create();
global.dialog_start_events = map;				// All the scripts to run for any dialog when that dialog is started

map = ds_map_create();
global.dialog_finish_events = map;				// All the scripts to run for any dialog when that dialog is finished

map = ds_map_create();
global.dialog_escape_events = map;				// All the scripts to run for any dialog when that dialog is escaped out of

map = ds_map_create();
global.dialog_start_condition = map;			// All the scripts to run for any dialog to determine if that dialog should be allowed to run or not

var list = ds_list_create();
global.dialog_list = list;						// A list of all the currently queued up dialogs

// Automatically progress the dialog system? If no, requires calling a script e.g. on user input
global.auto_tick_dialog = false;

// Did dialog_begin get called from dialog_tick? This is an internal variable
global.begin_called_from_dialog_tick = false;

// GUI foreground depth stack; this is used to put things correctly in the foreground by reordering their layer
global.gui_foreground_stack = 0;