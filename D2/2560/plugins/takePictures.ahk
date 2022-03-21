; take pictures of shit
    potionPics() {
        Global

        potionPicStr =
        (
            Press keys 0 - 9 to take pictures

            0 = menu stuff and orbs
            1 = posion orbs

            2 = belt rejuv potions
            3 = belt health potions 1 - 4
            4 = belt health potion 5 (takes pic at slot 1 again)
            5 = belt mana potions 1 - 4
            6 = belt mana potions 5 (takes pic at slot 1 again)

            7 = inventory rejuv potions (top row)
            8 = inventory health potions (top row)
            9 = inventory mana potions (top row)

            place potions in order of lowest type > highest type

            images will appear in the folder with start.ahk
            you have to move them to image folder
        )

        ToolTip, %potionPicStr%, 800, 800
        Input, var , l1

        if ( var == 0 ) {
            screenShot( "OrbR" , WHcOrbR )
            screenShot( "OrbH" , WHcOrbH )
            screenShot( "OrbM" , WHcOrbM )
            screenShot( "InvOpen" , WHcInvOpen )
            screenShot( "GReady" , WHcGReady )
        }
        if ( var == 1 ){
            screenShot( "OrbRP" , WHcOrbR )
            screenShot( "OrbHP" , WHcOrbH ) 
        }
        if ( var == 2 ) 
            loop, 2 
                screenShot( "br" A_Index , WHcBelt%A_Index% )
        if ( var == 3 )
            loop, 4 
                screenShot( "bh" A_Index , WHcBelt%A_Index% )
        if ( var == 4 )
            screenShot( "bh5" , WHcBelt1 )
        if ( var == 5 )
            loop, 4 
                screenShot( "bm" A_Index , WHcBelt%A_Index% )     
        if ( var == 6 )
            screenShot( "bm5" , WHcBelt1 )
        if ( var == 7 ) 
            loop, 2 
                screenShot( "ir" A_Index , WHcInv%A_Index% )
        if ( var == 8 )
            loop, 5 
                screenShot( "ih" A_Index , WHcInv%A_Index% )
        if ( var == 9 )
            loop, 5 
                screenShot( "im" A_Index , WHcInv%A_Index% )

        ToolTip,
    }