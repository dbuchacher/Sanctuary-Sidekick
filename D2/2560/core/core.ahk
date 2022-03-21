; allows me to set hotkeys that start functions with arguments
    hotkey( keybind , function , arg* ) {
        Static temp := {} , args := {}
        temp[ keybind ] := Func( function ) , args[ keybind ] := arg
        Hotkey, %keybind% , Hotkey_Handle
        Return
    Hotkey_Handle:
        temp[A_ThisHotkey].(args[A_ThisHotkey]*)
        Return
    }

; load hotkeys.ini and save the variables to memeory
    loadHotkeys() {
        global

        IniRead, OutputVarSection, config\hotkeys.ini, hotkeys
            Loop, Parse, OutputVarSection , `n
            {
                hotkeyName := StrSplit(A_LoopField, "=" )
                hotkeyArgs := StrSplit(hotkeyName[2], "|" )
                hotkey( hotkeyArgs.1 , hotkeyName.1 , hotkeyArgs.2 , hotkeyArgs.3 , hotkeyArgs.4 )
            }
    }

; used for reload and exit
    appcontrol(  exitStatus ) {

        if ! ( exitStatus )
            Reload
        ExitApp
    }

; does what it says    
    removeToolTip() {
        ToolTip
    }

; runs when app is closed
    exitFunc() {
        unloadImages()
        Gdip_Shutdown(gdipToken)
    }

; load images into memory and give them variable names
    loadImages() {
        Loop Files, images\*.png 
        {
            variableName := SubStr(A_LoopFileName, 1, -4)
            %variableName% := Gdip_CreateBitmapFromFile( A_LoopFileFullPath )
        }
    }

; unload images from memory
    unloadImages() {
        Loop Files, images\*.png 
        {
            variableName := SubStr(A_LoopFileName, 1, -4)
            Gdip_DisposeImage( %variableName% )
        }
        Gdip_Shutdown(pToken)
    }

; save a section of the screen to a file
    screenShot( name , coordinates ) {
        pBitmap := Gdip_BitmapFromScreen( coordinates )
        Gdip_SaveBitmapToFile( pBitmap , name ".png" , 100)
        Gdip_DisposeImage( pBitmap )
    }