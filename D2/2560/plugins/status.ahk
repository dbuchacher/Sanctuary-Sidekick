; use image search to set the status of variables
    statusSet() {
        global


        screenHaystack := Gdip_BitmapFromScreen()

        ; game status
        sGReady := Gdip_ImageSearch( screenHaystack , GReady , LIST
        , cGReadyX1 , cGReadyY1 , cGReadyX2 , cGReadyY2 , 5 )

        ; is inventory open
        sInvOpen := Gdip_ImageSearch( screenHaystack , InvOpen , LIST
        , cInvOpenX1, cInvOpenY1 , cInvOpenX2 , cInvOpenY2 , 5 )

        ; rejuv orb
        sOrbR := Gdip_ImageSearch( screenHaystack , orbR , LIST
        , cOrbRX1, cOrbRY1 , cOrbRX2 , cOrbRY2 , 30 )

        ; rejuv orb poison
        sOrbRP := Gdip_ImageSearch( screenHaystack , orbRP , LIST
        , cOrbRX1, cOrbRY1 , cOrbRX2 , cOrbRY2 , 45 )

        ; health orb
        sOrbH := Gdip_ImageSearch( screenHaystack , orbH , LIST
        , cOrbHX1, cOrbHY1 , cOrbHX2 , cOrbHY2 , 45 )

        ; health orb poison
        sOrbHP := Gdip_ImageSearch( screenHaystack , orbHP , LIST
        , cOrbHX1, cOrbHY1 , cOrbHX2 , cOrbHY2 , 45 )

        ; mana orb
        sOrbM := Gdip_ImageSearch( screenHaystack , orbM , LIST
        , cOrbMX1, cOrbMY1 , cOrbMX2 , cOrbMY2 , 30 )


        ; reset key values before checking
        rejuvKey := "" , healthKey := "" , manaKey := ""
        ; checks to see if a potion is in the belt area
        ; if there is a potion it will assign the proper key to press it
        statusLoopPotionList( potionListRejuvB , "cBeltArea" , "rejuv" , "key" )
        statusLoopPotionList( potionListHealthB , "cBeltArea" , "health" , "key" )
        statusLoopPotionList( potionListManaB , "cBeltArea" , "mana" , "key" )

        ; check to see if a potion is in the inventory area
        ; if  there is a potion it will assign coordinates to a variable
        statusLoopPotionList( potionListRejuvI , "cInvArea" , "rejuv" , "coordinate" )
        statusLoopPotionList( potionListHealthI , "cInvArea" , "health" , "coordinate" )
        statusLoopPotionList( potionListManaI , "cInvArea" , "mana" , "coordinate" )

        Gdip_DisposeImage( screenHaystack )
    }

; loops through an array of variables 
    statusLoopPotionList( potionList , coords , potionType , action ) {
        global

        for k, value in potionList
            if Gdip_ImageSearch( screenHaystack , value , LIST
            , %coords%X1, %coords%Y1 , %coords%X2 , %coords%Y2 , 10 ) {
                local S := StrSplit( LIST , [ "," , "`n"] )
                if ( action == "coordinate" )
                    %potionType%Coordinate := [ S[1] + 5 , S[2] + 5 ]
                if ( action == "key" ) {
                     ; change these hardcoded numbers later
                    if ( S[1] == 1468 )
                        %potionType%Key = %beltKey1%
                    if ( S[1] == 1551 )
                        %potionType%Key = %beltKey2%
                    if ( S[1] == 1634 )
                        %potionType%Key = %beltKey3%
                    if ( S[1] == 1717 )
                        %potionType%Key = %beltKey4%
                }
                break
            }  
    }

; debug helper
    statusDebug() {
        global

        aList := { "GReady":GReady
                    , "InvOpen":InvOpen
                    , "OrbR":OrbR
                    , "OrbH":OrbH
                    , "OrbM":OrbM
                    , "OrbRP":OrbRP
                    , "OrbHP":OrbHP }

        for name, value in aList
            statusDebugHelper( name , value )

        vValues = `n %hGReady% `n %hInvOpen% `n %hOrbR% `n %hOrbRP% `n %hOrbH% `n %hOrbHP% `n %hOrbM% `n
        vKeys = `n rejuvKey=%rejuvKey% `t healthKey=%healthKey% `t manaKey=%manaKey% `n
        local tmp1 := rejuvCoordinate[1] , tmp2 := rejuvCoordinate[2]
            , tmp3 := healthCoordinate[1] , tmp4 := healthCoordinate[2]
            , tmp5 := manaCoordinate[1] , tmp6 := manaCoordinate[2]
        vRejuvC = `n rejuvPotionCoordX=%tmp1% `t`t rejuvPotionCoordY=%tmp2%
        vHealthC = `n healthPotionCoordX=%tmp3% `t healthPotionCoordY=%tmp4%
        vManaC = `n manaPotionCoordX=%tmp5% `t`t manaPotionCoordY=%tmp6%

        ToolTip, % vValues vKeys vRejuvC vHealthC vManaC "`n`t", 500, 500
    }

    ; used in statusDebug()
    statusDebugHelper( name, value ) {
        local vStat := s%name% , vCoord := c%name%
        h%name% = `t name=%name% `t status=%vStat% `t image=%value% `t coordinates=%vCoord% `t
    }