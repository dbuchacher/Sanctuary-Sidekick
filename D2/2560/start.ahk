; startup
    ; allows OnExit()
    #Persistent

    ; check last key pushed
;    #InstallKeybdHook                       

    ; include.ahk is auto created by pre-start.ahk
    #include core\include.ahk
    #include config\variables.ahk

    ; ahk settings mainly just telling app to run fast
    Process, Priority,, High
    SetWorkingDir, ../%A_ScriptDir%
    SetMouseDelay, -1
    SetBatchLines, -1
    SetWinDelay, -1
    SendMode, Input

    ; on exit run the exitFunc()
    OnExit("exitFunc")

    ; starts gdip
    gdipToken := Gdip_Startup()

    loadImages()
    loadVariables()
    loadHotkeys()

    loop, {
        statusSet()
        potionUse()
        potionMove()
    }



; testing
    AppsKey & WheelDown::runTest1()
    AppsKey & WheelUp::runTest2()

