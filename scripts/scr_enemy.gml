//Goomba
if object_index = obj_newgoomba{
    if global.skin = 0{
        if global.theme = 1{
            if sprite_index = spr_smb1_goomba{
                sprite_index = spr_smb1_gooma_underground;
            }
        }
    }
    if global.skin = 1{
        if sprite_index = spr_smb1_goomba{
            sprite_index = spr_hell_goomba;
        }
    }
}

//Bullet Bill
if object_index = obj_newbill{
    if global.skin = 0{
        if global.theme = 0{
            sprite_index = spr_bulletbill;
        }
        if global.theme = 1{
            sprite_index = spr_bulletbill_underground;
        }
        if global.theme = 2{
            sprite_index = spr_bulletbill_snow;
        }
    }
    if global.skin = 1{
        if global.theme = 0{
            sprite_index = spr_hell_bulletbill;
        }
        if global.theme = 1{
            sprite_index = spr_hell_bulletbill;
        }
    }
}

//Bullet Bill Cannon
if object_index = obj_newcannon{
    if global.skin = 0{
        if sprite_index = spr_bullettower_top{
            if global.theme = 1{
                sprite_index = spr_bullettower_top_underground;
            }
            if global.theme = 2{
                sprite_index = spr_bullettower_top_snow;
            }
        }
        
        if sprite_index = spr_bullettowermid{
            if global.theme = 1{
                sprite_index = spr_bullettowermid_underground;
            }
            if global.theme = 2{
                sprite_index = spr_bullettowermid_snow;
            }
        }
        
        if sprite_index = spr_bullettower{
            if global.theme = 1{
                sprite_index = spr_bullettower_underground;
            }
            if global.theme = 2{
                sprite_index = spr_bullettower_snow;
            }
        }
    }
    if global.skin = 1{
        if sprite_index = spr_bullettower_top{
            sprite_index = spr_hell_bullettower_top;
        }
        
        if sprite_index = spr_bullettowermid{
            sprite_index = spr_hell_bullettower_mid;
        }
        
        if sprite_index = spr_bullettower{
            sprite_index = spr_hell_bullettower;
        }
    }
}

//Koopa Troopa
if object_index = obj_newkoopa{
    if global.skin = 1{
        if sprite_index = spr_smb1_koopa{
            sprite_index = spr_hell_koopa;
        }
        if sprite_index = spr_smb1_koopashell{
            sprite_index = spr_hell_koopashell;
        }
    }
}

//Red Koopa Troopa
if object_index = obj_newkoopared{
    if global.skin = 1{
        if sprite_index = spr_smb1_koopared{
            sprite_index = spr_hell_koopared;
        }
        if sprite_index = spr_smb1_kooparedshell{
            sprite_index = spr_hell_kooparedshell;
        }
    }
}

//Boo
if object_index = obj_bootile{
    if global.skin = 0{
        sprite_index = spr_smb1_bootile;
    }
    if global.skin = 1{
        if sprite_index = spr_smb1_bootile{
            sprite_index = spr_hell_bootile;
        }
    }
}

//Ladder
if object_index = obj_ladder{
    if global.skin = 0{
        sprite_index = spr_smb1_ladder;
    }
    if global.skin = 1{
        if sprite_index = spr_smb1_ladder{
            sprite_index = spr_hell_ladder;
        }
    }
}

