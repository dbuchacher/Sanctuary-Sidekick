; use a potion when orb status is false
    potionUse() {
        global

        if sGReady and not rejuvCooldown and not sOrbR and not sOrbRP {
            rejuvCooldown := true
            SetTimer, rCooldown, -%rejuvCooldownLenght%
            if GetKeyState("shift")
                SendInput, {Blind}{shift up}
            SendInput, %rejuvKey%
        } 
        if sGReady and not healthCooldown and not sOrbH and not sOrbHP {
            healthCooldown := true
            SetTimer, hCooldown, -%healthCooldownLenght%
            if GetKeyState("shift")
                SendInput, {Blind}{shift up}
            SendInput, %healthKey%
        } 
        if sGReady and not manaCooldown and not sOrbM {
            manaCooldown := true
            SetTimer, mCooldown, -%manaCooldownLenght%
            if GetKeyState("shift")
                SendInput, {Blind}{shift up}
            SendInput, %manaKey%
        }    
    }

; reset cooldown variable
    rCooldown() {
        global rejuvCooldown := false
    }

; reset cooldown variable
    hCooldown() {
        global healthCooldown := false
    }

; reset cooldown variable
    mCooldown() {
        global manaCooldown := false
    }