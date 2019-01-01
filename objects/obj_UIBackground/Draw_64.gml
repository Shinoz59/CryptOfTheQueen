/// @description Insert description here
// You can write your code in this editor
// The draw sprite stuff didn't work, so just the text.
draw_set_font(UIFont);
var xx = x + 8;
var yy = y + 8;
var col = c_white;
var offset = 1;
var txt = "Enemy Health " + string(global.TrackedHealth);

draw_set_color(c_red);
draw_text(xx + offset, yy, txt);
draw_text(xx - offset, yy, txt);
draw_text(xx, yy + offset, txt);
draw_text(xx, yy - offset, txt);
draw_set_color(col);
draw_text(xx, yy, txt);
