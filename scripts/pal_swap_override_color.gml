///pal_swap_override_color(index,new color)
//replaces the indicated palette with the new color.
var _row=ds_grid_add_row(Pal_Override_Grid);
Pal_Override_Grid[# 0,_row]=id;
Pal_Override_Grid[# 1,_row]=argument[0];
Pal_Override_Grid[# 2,_row]=argument[1];
