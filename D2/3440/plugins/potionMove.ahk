; toggles var to use to tell script to do less image search
; this lets potionMove run faster
    potionMoveSet( potionType ) {
        global

      ;  if ( A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 500 )

        potionToUse := potionType

        if not sInvOpen and not potionMoveRun
            SendInput, %inventoryKey%

        potionMoveRun := true
    }

; move potions from inventory to belt
    potionMove() {
        global 

        if not potionMoveRun
            return

        potionMoveHelper( potionToUse )
        SetTimer, potionCloseInv, -750

        potionMoveRun := false
    }

; used by potionMove() 
    potionMoveHelper( vCoord ) {
        MouseGetPos, x, y
        MouseMove, %vCoord%[1], %vCoord%[2], 0
        SendInput, {shift down}{lbutton}{shift up}
        Sleep, 75
        MouseMove, x, y, 0
    }

; closes inventory if needed
    potionCloseInv() {
        global
        
        if sInvOpen
            SendInput, %inventoryKey% 
    }

