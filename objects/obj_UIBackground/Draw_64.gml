/// @description Insert description here
// You can write your code in this editor
draw_sprite(sprite_index,-1,x,y);
//draw_sprite_stretched(sprite_index,-1,x,y,544,124);
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
