/// @desc Draw dialog

// Back up state
var font = draw_get_font();
var color = draw_get_color();
var alpha = draw_get_alpha();

// Set dialog state
draw_set_font(fnt_dialog);
draw_set_color($63DAFF);
draw_set_alpha(image_alpha);

var line_height = string_height("a");
var dialog_width = dialog_get_width();

// Draw the dialog box
draw_9slice(spr_dialog_frame, 0, 0, 0, dialog_width, dialogHeight, 64, 64);

// Draw the dialog text
var text_x = 48;
var text_y = 32;
for(var i = 0; i <= _curstring_arr; ++i)
{
	var str;
	if(i < _curstring_arr) str = _strings[i];
	else str = _curstring;
	draw_text(text_x, text_y, str);
	text_y += line_height;
}

// Draw all branches
if(_branching)
{
	// Draw the branches box
	draw_9slice(spr_dialog_frame, 0, 0, dialogHeight, dialog_width, branchesHeight, 64, 64);
	
	text_y = dialogHeight + 32;
	for(var i = 0; i < options; ++i)
	{
		var name = dialog_get_branch_name(key, i);
		
		// Draw selection highlight
		if(i == selected_branch) draw_sprite(spr_dialog_selected, 0, 0, text_y);
		
		// Draw the branch
		draw_text(text_x, text_y, name);
		text_y += line_height;
	}
}

// Reset state
draw_set_font(font);
draw_set_color(color);
draw_set_alpha(alpha);