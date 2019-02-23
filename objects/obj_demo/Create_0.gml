/// @desc Start dialogs

// Initialize the system
dialog_init();
init_demo_dialogs();

// Queue up a bunch of dialogs we're demoing
// This also shows that the system correctly handles interleaving branching dialogues
dialog_begin(DIALOG_PORTAL_APERTURE);
dialog_begin(DIALOG_PORTAL);
dialog_begin(DIALOG_DIVINITY);