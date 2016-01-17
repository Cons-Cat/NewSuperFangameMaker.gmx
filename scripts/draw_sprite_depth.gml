///draw_sprite_depth(sprite,image index,x,y,depth)
/*if(!instance_exists(obj_depth_drawer_manager))
{
    instance_create(0,0,obj_depth_drawer_manager);
}*/
var _inst=noone;
with(obj_depth_drawer)
{
    if(depth==argument[4])
    {   //add to this one
        _inst=id;       
    }
}
if(_inst==noone)
{
    _inst=instance_create(0,0,obj_depth_drawer);
    _inst.depth=argument[4];
}
with(_inst)
{
    var _row=ds_grid_add_row(sprite_grid);
    sprite_grid[#0,_row]=argument[0];
    sprite_grid[#1,_row]=argument[1];
    sprite_grid[#2,_row]=argument[2];
    sprite_grid[#3,_row]=argument[3];
    sprite_grid[#4,_row]=1;
    sprite_grid[#5,_row]=1;
    sprite_grid[#6,_row]=0;
    sprite_grid[#7,_row]=c_white;
    sprite_grid[#8,_row]=1;
    sprite_grid[#9,_row]=noone;
    sprite_grid[#10,_row]=0;
}
