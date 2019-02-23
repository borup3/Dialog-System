/// @desc Draw a nine slice from a sprite
/// @arg sprite The sprite to use
/// @arg subimg The sub image to use
/// @arg x The X coordinate
/// @arg y The Y coordinate
/// @arg w The width
/// @arg h The height
/// @arg corner_w The corner width
/// @arg corner_h The corner height

var spr = argument0;
var subimg = argument1;
var xx = argument2;
var yy = argument3;
var w = argument4;
var h = argument5;
var corner_w = argument6;
var corner_h = argument7;

var xscale_middle = (w - corner_w * 2) / corner_w;
var yscale_middle = (h - corner_h * 2) / corner_h;

// top left
draw_sprite_part(spr, subimg, 0, 0, corner_w, corner_h, xx, yy);
// top
draw_sprite_part_ext(spr, subimg, corner_w, 0, corner_w, corner_h, xx + corner_w, yy, xscale_middle, 1, c_white, draw_get_alpha());
// top right
draw_sprite_part(spr, subimg, corner_w * 2, 0, corner_w, corner_h, xx + w - corner_w, yy);

// left
draw_sprite_part_ext(spr, subimg, 0, corner_h, corner_w, corner_h, xx, yy + corner_h, 1, yscale_middle, c_white, draw_get_alpha());
// middle
draw_sprite_part_ext(spr, subimg, corner_w, corner_h, corner_w, corner_h, xx + corner_w, yy + corner_h, xscale_middle, yscale_middle, c_white, draw_get_alpha());
// right
draw_sprite_part_ext(spr, subimg, corner_w * 2, corner_h, corner_w, corner_h, xx + w - corner_w, yy + corner_h, 1, yscale_middle, c_white, draw_get_alpha());

// bottom left
draw_sprite_part(spr, subimg, 0, corner_h * 2, corner_w, corner_h, xx, yy + h - corner_h);
// bottom
draw_sprite_part_ext(spr, subimg, corner_w, corner_h * 2, corner_w, corner_h, xx + corner_w, yy + h - corner_h, xscale_middle, 1, c_white, draw_get_alpha());
// bottom right
draw_sprite_part(spr, subimg, corner_w * 2, corner_h * 2, corner_w, corner_h, xx + w - corner_w, yy + h - corner_h);
