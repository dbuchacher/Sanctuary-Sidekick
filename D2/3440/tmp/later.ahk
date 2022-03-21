                                    ; checks if doubletap status and if proper window is open
    init( doubleTap ) {

        If ( doubleTap && A_PriorHotKey = A_ThisHotKey && A_TimeSincePriorHotkey < 500 )
            Return True

        if ( doubleTap )
            Return False

        Return True
    }


; load array variables in to memeory
    loadArrayVariables() {
        global

        IniRead, arrayNames, config\variables.ini
        loop, parse, arrayNames, `n
        {
            %A_LoopField% := []
            tmpName := %A_LoopField%

            iniread, arrayValues, config\variables.ini, %A_LoopField%
            loop, parse, arrayValues, `n
                tmpName.Push( A_LoopField )
        }
    }


    ; crops a section of the screen & saves as png
; also copy the coords to windows clipboard
    ; screenShotPlus() {
    ;     ToolTip, Click X1 and Y1, 50, 50
    ;     SetTimer, RemoveToolTip, -1500
    ;     KeyWait, Space, D
    ;     MouseGetPos, X1 , Y1
    ;     Sleep 500
    ;     ToolTip, Click X2 and Y2, 50, 50
    ;     SetTimer, RemoveToolTip, -1500
    ;     KeyWait, Space, D
    ;     MouseGetPos, X2 , Y2
    ;     Sleep 1000
    ;     ToolTip, Good Job Buddy!, 50, 50
    ;     SetTimer, RemoveToolTip, -1500
    ;     clipboard := X1 "|" Y1 "|" X2 "|" Y2
    ;     pBitmap := createBitmapFromScreen( X1 "|" Y1 "|" X2 "|" Y2 )
    ;     Gdip_SaveBitmapToFile( pBitmap , A_Now ".png" , 100)
    ;     Gdip_DisposeImage( pBitmap )
    ; }