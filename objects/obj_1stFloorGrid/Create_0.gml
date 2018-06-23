/// @description Insert description here
// You can write your code in this editor

globalvar myGrid;
grid_start_x = 32;
grid_start_y = 32;

grid_cell_count_x = 15;
grid_cell_count_y = 15;

grid_size_x = 32; // I tried smaller, but then it'd just kind of clip into the walls doing things.
grid_size_y = 32;

myGrid = mp_grid_create(grid_start_x, grid_start_y, grid_cell_count_x, grid_cell_count_y, grid_size_x, grid_size_y); // Grid currently alligned with the squares.	

scr_GenerateTileGridObstacles(id);