
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

    Coordinates( "cfullScreen" , "0|0|2560|1440" )
    Coordinates( "cGReady" , "1270|1379|1293|1401" )
    Coordinates( "cBeltArea" , "1459|1362|1763|1414" )
    Coordinates( "cInvOpen" , "1929|190|1984|215" )
    Coordinates( "cInvArea" , "1692|737|2345|1000" )

    Coordinates( "cBelt1" , "1468|1372|1505|1395" )
    Coordinates( "cBelt2" , "1551|1372|1588|1395" )
    Coordinates( "cBelt3" , "1634|1372|1671|1395" )
    Coordinates( "cBelt4" , "1717|1372|1754|1395" )

    Coordinates( "cInv1" , "1709|757|1738|782" )
    Coordinates( "cInv2" , "1770|755|1803|779" )
    Coordinates( "cInv3" , "1836|756|1865|781" )
    Coordinates( "cInv4" , "1902|758|1935|782" )
    Coordinates( "cInv5" , "1970|760|2000|784" )
    

    Coordinates( "cOrbR" , "700|1291|714|1304" )
    Coordinates( "cOrbH" , "687|1260|702|1274" )
    Coordinates( "cOrbM" , "1964|1382|2009|1395" )

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
