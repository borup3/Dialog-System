/*
	Dialog strings can take parameters. A parameter is denoted by {n} where n defines the parameter index.
	Example string "You found a {0}!". This takes 1 parameter and inserts it before the exclamation mark. This is how the string "You found a Battle-Axe!" is created.

	All events and branches are executed from the scope of the instance that originally spawned the dialog.
	If the instance no longer exists then it is executed from the scope of obj_dialog.
	
	Macro expansion for instance variables is also supported, e.g. ${current_hp} will be replaced by the value of the "current_hp" variable on the calling instance if it exists, otherwise not.

*/

//
//	Fallback dialog if you haven't assigned one to a dialog giver
//

#macro MISSING -2
dialog_add_string(MISSING, "Missing dialog.");

//
//	A dialog without branches
//

#macro DIALOG_PORTAL_APERTURE 0
dialog_add_string(DIALOG_PORTAL_APERTURE, "The enrichment center would like to announce a new employee initiative of forced voluntary participation. " +
										  "If any Aperture Science employee would like to opt out of this new voluntary testing program, please remember; science rhymes with compliance." +
										  "\n\nDo you know what doesn't rhyme with compliance? Neurotoxin." +
										  "\n\nDue to high mortality rates, you may be reluctant to participate in the new initiative. " +
										  "The enrichtment center assures you this is a strictly selfish impulse on your part, and why can't you love science like [insert co-worker's name here]?");

//
//	A dialog with two branches, one of which calls a script action_cake_deny if selected
//	Script action_cake_deny starts another dialog
//

#macro DIALOG_PORTAL 1
dialog_add_string(DIALOG_PORTAL, "The cake is a lie.\nThe cake is a lie.\nThe cake is a lie.\nThe cake is a lie.");
dialog_add_branch(DIALOG_PORTAL, 0, action_cake_deny, "No, it can't be! I was told there was cake!");
dialog_add_branch(DIALOG_PORTAL, 1, DO_NOTHING, "Aw.");

//
//	Script action_cake_deny starts this dialog
//

#macro DIALOG_PORTAL_2 2
dialog_add_string(DIALOG_PORTAL_2, "The cake is a lie, a lie, it's a lie, THE CAKE IS A LIE!!");

//
//	A branching dialog that lets the user alter the next branch
//

#macro DIALOG_DIVINITY 3
dialog_add_string(DIALOG_DIVINITY, "No one has as many friends as the man with many what?");
dialog_add_branch(DIALOG_DIVINITY, 0, action_divinity_cheeses, "Cheeses");
dialog_add_branch(DIALOG_DIVINITY, 1, action_divinity_bowling, "Bowling balls");
dialog_add_branch(DIALOG_DIVINITY, 2, action_divinity_jokes, "Jokes");
dialog_add_branch(DIALOG_DIVINITY, 3, action_divinity_other, "Other...");

//
//	A dialog with a variable macro that is expanded to the value of the calling instance's value in that variable
//	This dialog has a finish event that restarts DIALOG_DIVINITY, causing an endless dialog loop for this demo
//

#macro DIALOG_DIVINITY_ITEM 4
dialog_add_string(DIALOG_DIVINITY_ITEM, "No one has as many friends as the man with many ${item_name}!");
dialog_add_finish_event(DIALOG_DIVINITY_ITEM, action_divinity_repeat);
