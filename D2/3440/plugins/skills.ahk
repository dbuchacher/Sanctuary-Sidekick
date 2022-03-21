; bind skills to one key press
    skillKeybinds() {

        SendInput, {rbutton}
    }

; swap cast
    swapCast( resetKey , skillKey ) {
        global

        ; reset
        SendInput, %resetKey%
        Sleep, 250
        SendInput, %wepSwap%
        Sleep, 250
        SendInput, %skillKey%
        Sleep, 250

        ; swap cast
        SendInput, %wepSwap%%skillKey%
        Sleep, 250
    }

; normal mouse left attack
    normalAttack( extra ) {

        SendInput, {shift down}
        loop, 10
            SendInput, {lbutton}

    }

; low reist
    lowReist() {

        SendInput, w
        Sleep, 250
        SendInput, {F7}
        Sleep, 250
        SendInput, {rbutton}
        Sleep, 500
        SendInput, w
    }


; NEW first skill
    skillDown( which ) {

        if ( which == "L" ) {
            if not GetKeyState("shift")
                SendInput, {blind}{shift down}
            if not GetKeyState("lbutton")
                SendInput, {blind}{lbutton down}
        }

        if ( which == "R" )
            if not GetKeyState("RButton")
                SendInput, {blind}{rbutton down}
    }

; new up
    skillUp( which ) {

        if ( which == "L" ) {
            SendInput, {blind}{shift up}
            SendInput, {blind}{lbutton up}
        }

        if ( which == "R" )
            SendInput, {blind}{rbutton up}
    }


; warcrys
    warcry() {

        SendInput, w
        Sleep, 250
        SendInput, {F9}
        Sleep, 50
        SendInput, {rbutton}
        Sleep, 500
        SendInput, {F10}
        Sleep, 50
        SendInput, {rbutton}
        Sleep, 500
        SendInput, w
    }

; battle cry
    battlecry() {
        
        SendInput, w
        Sleep, 250
        SendInput, {F11}
        Sleep, 50
        SendInput, {rbutton}
        Sleep, 500
        SendInput, w
    }