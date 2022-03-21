
loadVariables() {
    global

    beltKey1 = 1
    beltKey2 = 2
    beltKey3 = 3
    beltKey4 = 4
    inventoryKey = i
    wepSwap = w

    rejuvCooldownLenght := 1000
    healthCooldownLenght := 7680
    manaCooldownLenght := 5120

    screenX := 2560
    screenY := 1440

    Coordinates( "cfullScreen" , "0|0|3440|1440" )
    Coordinates( "cGReady" , "1710|1379|1733|1401" )
    Coordinates( "cBeltArea" , "1899|1362|2203|1414" )
    Coordinates( "cInvOpen" , "2609|190|2664|215" )
    Coordinates( "cInvArea" , "2372|737|3025|1000" )

    Coordinates( "cBelt1" , "1908|1372|1945|1395" )
    Coordinates( "cBelt2" , "1991|1372|2028|1395" )
    Coordinates( "cBelt3" , "2074|1372|2111|1395" )
    Coordinates( "cBelt4" , "2157|1372|2194|1395" )

    Coordinates( "cInv1" , "2389|757|2418|782" )
    Coordinates( "cInv2" , "2450|755|2483|779" )
    Coordinates( "cInv3" , "2516|756|2545|781" )
    Coordinates( "cInv4" , "2582|758|2615|782" )
    Coordinates( "cInv5" , "2650|760|2680|784" )

    Coordinates( "cOrbR" , "1087|1308|1100|1316" )
    Coordinates( "cOrbH" , "1127|1258|1138|1265" )
    Coordinates( "cOrbM" , "2379|1394|2399|1405" )

    potionListRejuvB := [ br2 , br1 ]
    potionListRejuvI := [ ir2 , ir1 ]
    potionListHealthB := [ bh5 , bh4 , bh3 , bh2 , bh1 ]
    potionListHealthI := [ ih5 , ih4 , ih3 , ih2 , ih1]
    potionListManaB := [ bm5 , bm4 , bm3 , bm2 , bm1 ]
    potionListManaI := [ im5 , im4 , im3 , im2 , im1 ] 
}

Coordinates( varName , coordinates ) {
    global

    local tmp := StrSplit( coordinates , "|" )
    local x := ( screenX / screenX )
    local y := ( screenY / screenY )

    ; sets as 1 string X1 Y2 X2 Y2
    %varName% := Ceil(tmp[1]*x) "|" Ceil(tmp[2]*y) "|" Ceil(tmp[3]*x) "|" Ceil(tmp[4]*y)

    ; sets as 1 string X1 Y1 W H
    WH%varName% := Ceil(tmp[1] * x) "|" Ceil(tmp[2] * y) "|" Ceil(tmp[3]*x) - Ceil(tmp[1]*x) "|" Ceil(tmp[4]*y) - Ceil(tmp[2]*y)

    ; sets as 4 individual variables
    %varName%X1 := Ceil(tmp[1] * x)
    %varName%Y1 := Ceil(tmp[2] * y)
    %varName%X2 := Ceil(tmp[3] * x)
    %varName%Y2 := Ceil(tmp[4] * y)
}
