; =====================================================
; main

    ; script settings
        #include gdip.ahk
        #include dev.ahk
        #include ez_edit.ahk
        #include diablo_scripts.ahk
        #include gui_window.ahk
        #MaxThreads 50
        #MaxThreadsPerHotkey, 2

        Process, Priority,, High
        SetWorkingDir, %A_ScriptDir%
        SetMouseDelay, -1
        SetBatchLines, -1
        SetWinDelay, -1
        SendMode Input

    ; startup
        gdipToken := Gdip_Startup()

        IfNotExist, ss_data/config.ini
            create_config_file()

        set_variables()
        ez_create_new_script(current_profile)
        set_img_dir()
        set_images()
        check_skillKeys()
        gui_main_window()

        Settimer, check_gameMenus , 32
        Settimer, check_skillKeys , 10000
        Settimer, crosshairOnMap  , 100

        OnExit("closeShit")

    ; running
        ^!+#F12::
            Settimer, activate_button_hover , 50
            gui_main_window()
            Return

        ^!+#F11::
            ExitApp

        ::hiddenimgtaker::
            take_pictures()
            Return

        ::hiddenwizimgtaker::
            take_wiz_pics()
            Return

        ::hiddenbarbimgtaker::
            take_barb_pics()
            Return

        ::hiddenotherimgtaker::
            take_other_pics()
            Return

        ::hiddennecroimgtaker::
            take_necro_pics()
            Return

        ::hiddenmonkimgtaker::
            take_monk_pics()
            Return

        ::whatismyimgdir::
            MsgBox, %img_dir%

        ::hiddenberimgtaker::
            take_ber_pic()
            Return

    ; exiting
        closeShit()
        {
            Global
            Gdip_DisposeImage( imgsaved_chatUp          )
            Gdip_DisposeImage( imgsaved_chatDown        )
            Gdip_DisposeImage( imgsaved_map             )
            Gdip_DisposeImage( imgsaved_esc             )
            Gdip_DisposeImage( imgsaved_cubePage2       )
            Gdip_DisposeImage( imgsaved_cubePage3       )
            Gdip_DisposeImage( imgsaved_cubePage6       )
            Gdip_DisposeImage( imgsaved_cubePage7       )
            Gdip_DisposeImage( imgsaved_cubePage8       )
            Gdip_DisposeImage( imgsaved_cubePage9       )
            Gdip_DisposeImage( imgsaved_weaponsOpen     )
            Gdip_DisposeImage( imgsaved_armorOpen       )
            Gdip_DisposeImage( imgsaved_gemsOpen        )
            Gdip_DisposeImage( imgsaved_mysticOpen      )
            Gdip_DisposeImage( imgsaved_salvageOpen     )
            Gdip_DisposeImage( imgsaved_repairOpen      )
            Gdip_DisposeImage( imgsaved_shardsOpen      )
            Gdip_DisposeImage( imgsaved_vendorOpen      )
            Gdip_DisposeImage( imgsaved_npcSellerWepons )
            Gdip_DisposeImage( imgsaved_npcSellerArmor  )
            Gdip_DisposeImage( imgsaved_inventory       )
            Gdip_DisposeImage( imgsaved_salvageWarn     )
            Gdip_DisposeImage( imgsaved_stashOpen       )
            Gdip_DisposeImage( imgsaved_lootWhite       )
            Gdip_DisposeImage( imgsaved_lootBlue        )
            Gdip_DisposeImage( imgsaved_lootYellow      )
            Gdip_DisposeImage( imgsaved_lootGreen       )
            Gdip_DisposeImage( imgsaved_lootLegendary   )
            Gdip_DisposeImage( imgsaved_lootDB          )
            Gdip_DisposeImage( imgsaved_lootGem         )
            Gdip_DisposeImage( imgsaved_waveOfForce1    )
            Gdip_DisposeImage( imgsaved_electrocute1    )
            Gdip_DisposeImage( imgsaved_rayOfFrost1     )
            Gdip_DisposeImage( imgsaved_archon1         )
            Gdip_DisposeImage( imgsaved_meteor1         )
            Gdip_DisposeImage( imgsaved_blackhole1      )
            Gdip_DisposeImage( imgsaved_frostnova1      )
            Gdip_DisposeImage( imgsaved_waveOfForce2    )
            Gdip_DisposeImage( imgsaved_electrocute2    )
            Gdip_DisposeImage( imgsaved_rayOfFrost2     )
            Gdip_DisposeImage( imgsaved_archon2         )
            Gdip_DisposeImage( imgsaved_meteor2         )
            Gdip_DisposeImage( imgsaved_blackhole2      )
            Gdip_DisposeImage( imgsaved_frostnova2      )
            Gdip_DisposeImage( imgsaved_ablast          )
            Gdip_DisposeImage( imgsaved_warcry1         )
            Gdip_DisposeImage( imgsaved_falter1         )
            Gdip_DisposeImage( imgsaved_sprint1         )
            Gdip_DisposeImage( imgsaved_warcry2         )
            Gdip_DisposeImage( imgsaved_falter2         )
            Gdip_DisposeImage( imgsaved_sprint2         )
            Gdip_DisposeImage( imgsaved_devour1         )
            Gdip_DisposeImage( imgsaved_lod1            )
            Gdip_DisposeImage( imgsaved_boneSpirit1     )
            Gdip_DisposeImage( imgsaved_devour2         )
            Gdip_DisposeImage( imgsaved_lod2            )
            Gdip_DisposeImage( imgsaved_boneSpirit2     )
            Gdip_DisposeImage( imgsaved_epiphany1       )
            Gdip_DisposeImage( imgsaved_ton1            )
            Gdip_DisposeImage( imgsaved_sanc1           )
            Gdip_DisposeImage( imgsaved_serenity1       )
            Gdip_DisposeImage( imgsaved_zephyr1         )
            Gdip_DisposeImage( imgsaved_epiphany2       )
            Gdip_DisposeImage( imgsaved_ton2            )
            Gdip_DisposeImage( imgsaved_sanc2           )
            Gdip_DisposeImage( imgsaved_serenity2       )
            Gdip_DisposeImage( imgsaved_zephyr2         )
            Gdip_DisposeImage( imgsaved_townPortal      )

            Gdip_Shutdown(gdipToken)
        }


    ; for testing
        F1::
            Reload
            ExitApp
        F5::measureTime()
        F6::randomTest()
       F8::getScreenCoordinates()
        F3::
            Settimer, activate_button_hover , 50
            gui_main_window()
            Return

; =====================================================

; =====================================================
; image related

    set_img_dir() ; sets img_dir Global variable depending on resolution
    {
        If ( A_ScreenWidth == 2560 && A_ScreenHeight == 1440 )
            Global img_dir := "ss_data/img/2560x1440/"
        Else If ( A_ScreenWidth == 3440 && A_ScreenHeight == 1440 )
            Global img_dir := "ss_data/img/3440x1440/"
        Else If ( A_ScreenWidth == 1920 && A_ScreenHeight == 1080 )
            Global img_dir := "ss_data/img/1920x1080/"
        Else
        {
            MsgBox, Only (1920 x 1080) OR (2560 x 1440) OR (3440 x 1440) Supported.
        }

    }

    ccx( coordinate ) ; convert coordinates x, y for diff screen resolutions
    { 
        Return coordinate * ( A_ScreenWidth / 2560 )
    }

    ccy( coordinate ) ; convert coordinates x, y for diff screen resolutions
    { 
        Return coordinate * ( A_ScreenHeight / 1440 ) 
    }

    findImage( needle , coordinates ) ; search for image in diablo
    {
        While ( Gdip_ImageSearch( haystack , needle , LIST , 0 , 0 , 0 , 0 , 5 , 0xFFFFFF , 1 , 0 ) != 1 )
            haystack := Gdip_BitmapFromHWNDCropped( WinExist( "ahk_exe Diablo III64.exe" ) , coordinates )
        Gdip_DisposeImage(haystack)
    }

    checkImage( needle , coordinates , variance ) ; check for image
    {
        haystack := Gdip_BitmapFromHWNDCropped( WinExist( "ahk_exe Diablo III64.exe" ) , coordinates )
        is_found := Gdip_ImageSearch( haystack , needle , LIST , 0 , 0 , 0 , 0 , variance , 0xFFFFFF , 1 , 0 )
        Gdip_DisposeImage(haystack)

        If ( is_found )
            Return True
        If ( !is_found )
            Return is_found
    }

    Gdip_BitmapFromHWNDCropped( hwnd , coordinates ) ; used for getting a cropped image from screen
    {
        S := StrSplit( coordinates , "|" )

        chdc := CreateCompatibleDC() , hbm := CreateDIBSection( S[3] - S[1] , S[4] - S[2] , chdc ) , obm := SelectObject( chdc , hbm ) , hhdc := GetDCEx( hwnd , 3 )
        BitBlt( chdc , 0 , 0 , S[3] - S[1] , S[4] - S[2] , hhdc , S[1] , S[2] )
        ReleaseDC( hhdc )

        pBitmap := Gdip_CreateBitmapFromHBITMAP( hbm )
        SelectObject( chdc , obm ) , DeleteObject( hbm ) , DeleteDC( hhdc ) , DeleteDC( chdc )

        Return pBitmap
    }

    check_gameMenus() ; check tab / enter / esc menus
    {
        Global

        local tmp1 := checkImage( imgsaved_chatUp   , imgcoord_chat1 , 25 )
            , tmp2 := checkImage( imgsaved_chatDown , imgcoord_chat1 , 25 )
            , tmp3 := checkImage( imgsaved_chatUp   , imgcoord_chat2 , 25 )
            , tmp4 := checkImage( imgsaved_chatDown , imgcoord_chat2 , 25 )
            , tmp5 := checkImage( imgsaved_chatUp   , imgcoord_chat3 , 25 )
            , tmp6 := checkImage( imgsaved_chatDown , imgcoord_chat3 , 25 )

        If ( tmp1 || tmp2 || tmp3 || tmp4 || tmp5 || tmp6 )
            chat_isOn := True
        Else
            chat_isOn := False

        map_isOn := checkImage( imgsaved_map , imgcoord_map , 25 )
        esc_isOn := checkImage( imgsaved_esc , imgcoord_esc , 25 )
        tp_isOn  := checkImage( imgsaved_townPortal , imgcoord_townPortal , 25 )
    }

    check_skillKeys() ; check skill keys
    {
        Global

        listOfSkills := "warcry|falter|sprint|ip|berserker|archon|blackhole|frostnova|devour|lod|boneSpirit|epiphany|ton|sanc|serenity|zephyr"

        counter := 1
        while (counter < 5)
        {

            Loop, Parse, listOfSkills , | 
            {
                If ( checkImage( imgsaved_%A_LoopField%1 , imgcoord_skillbar%counter% , 50 ) && skillKey_%A_LoopField% != ikey_skill%counter% )
                    skillKey_%A_LoopField% := ikey_skill%counter%
            }
            counter += 1
        }

        Loop, Parse, listOfSkills , | 
        {
            If ( checkImage( imgsaved_%A_LoopField%2 , imgcoord_skillbarL , 75 ) && skillKey_%A_LoopField% != ikey_skillL )
                skillKey_%A_LoopField% := ikey_skillL
        }

        Loop, Parse, listOfSkills , | 
        {
            If ( checkImage( imgsaved_%A_LoopField%2 , imgcoord_skillbarR , 75 ) && skillKey_%A_LoopField% != ikey_skillR )
                skillKey_%A_LoopField% := ikey_skillR
        }
    }

    ; take screen shot pictures
        screenShot( name , coordinates ) ; screen shot
        {
            pBitmap := Gdip_BitmapFromHWNDCropped( WinExist( "ahk_exe Diablo III64.exe" ) , coordinates )
            Gdip_SaveBitmapToFile(pBitmap, name ".png", 100)
            Gdip_DisposeImage(pBitmap)
        }

        ez_img( imgname , imgcoord ) ; ez img
        {
            Global

            While ( !GetKeyState( "F2" , "P") )
                ToolTip, Press F2 to take screenshot for: %imgname%.png , 0 , 0
            screenShot( imgname , imgcoord )
            ToolTip,
            Sleep, 500
        }

        take_pictures() ; take picture
        {    
            Global 

            ez_img( "chatUp"          , imgcoord_chat1       )
            ez_img( "chatDown"        , imgcoord_chat1       )
            ez_img( "map"             , imgcoord_map         )
            ez_img( "escmenu"         , imgcoord_esc         )
            ez_img( "cubePage2"       , imgcoord_cubePage    )
            ez_img( "cubePage3"       , imgcoord_cubePage    )
            ez_img( "cubePage6"       , imgcoord_cubePage    )
            ez_img( "cubePage7"       , imgcoord_cubePage    )
            ez_img( "cubePage8"       , imgcoord_cubePage    )
            ez_img( "cubePage9"       , imgcoord_cubePage    )
            ez_img( "weaponsOpen"     , imgcoord_vendorTab   )
            ez_img( "armorOpen"       , imgcoord_vendorTab   )
            ez_img( "salvageOpen"     , imgcoord_vendorTab   )
            ez_img( "repairOpen"      , imgcoord_vendorTab   )
            ez_img( "salvageWarn"     , imgcoord_salvageWarn )
            ez_img( "gemsOpen"        , imgcoord_vendorTab   )
            ez_img( "mysticOpen"      , imgcoord_vendorTab   )
            ez_img( "shardsOpen"      , imgcoord_shardsOpen  )
            ez_img( "npcSellerWepons" , imgcoord_vendorTabH  )
            ez_img( "npcSellerArmor"  , imgcoord_vendorTabH  )
            ez_img( "inventorySpace"  , imgcoord_inventory   )
            ez_img( "stashOpen"       , imgcoord_vendorTab   )

        }

        take_wiz_pics() ; take picture
        {
            Global

            ez_img( "waveOfForce1"  , imgcoord_skillbarT )
            ez_img( "electrocute1"  , imgcoord_skillbarT )
            ez_img( "rayOfFrost1"   , imgcoord_skillbarT )
            ez_img( "meteor1"       , imgcoord_skillbarT )
            ez_img( "archon1"       , imgcoord_skillbarT )
            ez_img( "blackhole1"    , imgcoord_skillbarT )
            ez_img( "frostnova1"    , imgcoord_skillbarT )
            ez_img( "waveOfForce2"  , imgcoord_skillbarM )
            ez_img( "electrocute2"  , imgcoord_skillbarM )
            ez_img( "rayOfFrost2"   , imgcoord_skillbarM )
            ez_img( "meteor2"       , imgcoord_skillbarM )
            ez_img( "archon2"       , imgcoord_skillbarM )
            ez_img( "blackhole2"    , imgcoord_skillbarM )
            ez_img( "frostnova2"    , imgcoord_skillbarM )
        }

        take_ber_pic() ; take picture
        {
            Global

            ez_img( "berserker1" , imgcoord_skillbarT )
            ez_img( "berserker2" , imgcoord_skillbarM )
        }

        take_barb_pics() ; take picture
        {
            Global

            ez_img( "warcry1" , imgcoord_skillbarT )
            ez_img( "falter1" , imgcoord_skillbarT )
            ez_img( "sprint1" , imgcoord_skillbarT )
            ez_img( "ip1"     , imgcoord_skillbarT )
            ez_img( "warcry2" , imgcoord_skillbarM )
            ez_img( "falter2" , imgcoord_skillbarM )
            ez_img( "sprint2" , imgcoord_skillbarM )
            ez_img( "ip2"     , imgcoord_skillbarM )
        }

        take_monk_pics() ; take picture
        {
            Global
            ez_img( "epiphany1"   , imgcoord_skillbarT )
            ez_img( "ton1"        , imgcoord_skillbarT )
            ez_img( "sanc1"       , imgcoord_skillbarT )
            ez_img( "serenity1"   , imgcoord_skillbarT )
            ez_img( "zephyr1"     , imgcoord_skillbarT )
            ez_img( "epiphany2"   , imgcoord_skillbarM )
            ez_img( "ton2"        , imgcoord_skillbarM )
            ez_img( "sanc2"       , imgcoord_skillbarM )
            ez_img( "serenity2"   , imgcoord_skillbarM )
            ez_img( "zephyr2"     , imgcoord_skillbarM )
        }

        take_necro_pics() ; take picture
        {
            Global
            ez_img( "devour1"     , imgcoord_skillbarT )
            ez_img( "lod1"        , imgcoord_skillbarT )
            ez_img( "boneSpirit1" , imgcoord_skillbarT )
            ez_img( "devour2"     , imgcoord_skillbarM )
            ez_img( "lod2"        , imgcoord_skillbarM )
            ez_img( "boneSpirit2" , imgcoord_skillbarM )
        }

        take_other_pics() ; take picture
        {
            Global

            ez_img( "townPortal" , imgcoord_townPortal )
        }

    ; =====================================================
        


; =====================================================

; =====================================================
; ss_data/config.ini related

    create_config_file() ; create ss_data/config.ini
    {
        Global

        Loop, 9
        {
            current_profile := "Profile "A_index
            ezedit_create_config_file( A_index )
            ez_create_new_script( A_Index )
        }
        IniWrite, 1 , ss_data/config.ini , Profile 1 , profile_isOn

        MsgBox, 64, Created ss_data/config.ini, Created new ss_data/config.ini
    }

    set_variables() ; loads all the stored varibales in the ss_data/config.ini file
    {
        Global

        Loop,
        {
            IniRead, i_profile_isOn, ss_data/config.ini , Profile %A_index% , profile_isOn
            If ( i_profile_isOn )
            {
                current_profile := "Profile "A_index
                break
            }
        }

        ez_edit_set_variables()
    }

    create_new_script( current_hk_name , hotkey_key , state , dt_state , sk_state , i ) ; creates listings for new hotkeys and scripts
    {
        create_config_helper( current_hk_name , hotkey_key , state , dt_state , sk_state , i )
        set_variables_helper( current_hk_name )
        set_hotkey_helper( current_hk_name )
    }

    create_config_helper( current_hk_name , hotkey_key , state , dt_state , sk_state , i ) ; helps when creating the default ss_data/config.ini file
    {
        IniWrite, %hotkey_key% , ss_data/config.ini , Profile %i%  , hotkey_%current_hk_name%
        IniWrite, %state%      , ss_data/config.ini , Profile %i%  , hotkey_state_%current_hk_name%
        IniWrite, %dt_state%   , ss_data/config.ini , Profile %i%  , hotkey_dt_state_%current_hk_name%
        IniWrite, %sk_state%   , ss_data/config.ini , Profile %i%  , hotkey_sk_state_%current_hk_name%
    }

    set_variables_helper( current_hk_name ) ; helps when adding variables to script memory
    {
        Global

        IniRead, ihk_%current_hk_name%          , ss_data/config.ini , %current_profile% , hotkey_%current_hk_name%
        IniRead, ihk_state_%current_hk_name%    , ss_data/config.ini , %current_profile% , hotkey_state_%current_hk_name%
        IniRead, ihk_dt_state_%current_hk_name% , ss_data/config.ini , %current_profile% , hotkey_dt_state_%current_hk_name%
        IniRead, ihk_sk_state_%current_hk_name% , ss_data/config.ini , %current_profile% , hotkey_sk_state_%current_hk_name%
    }

    set_hotkey_helper( current_hk_name ) ; helps to set hotkeys
    {
        Global

        local tempHotkey := "$~" ihk_%current_hk_name%
        If ( ihk_state_%current_hk_name% && ihk_sk_state_%current_hk_name% )
            Hotkey, %tempHotkey% , script_%current_hk_name% , On

        local tempHotkey := "$" ihk_%current_hk_name%
        If ( ihk_state_%current_hk_name% && !ihk_sk_state_%current_hk_name% )
        Hotkey, %tempHotkey% , script_%current_hk_name% , On
    }
    
    change_profile() ; updates profile stuff in gui
    {
        Global selected_profile , profile_list

        Gui, Submit , NoHide

        Loop, Parse, profile_list , |
        {
            IniWrite, 0 , ss_data/config.ini , Profile %A_index% , profile_isOn
            If( selected_profile = A_Index )
                temp_var := A_LoopField
        }

        If ( temp_var == "Profile 1" )
            IniWrite, 1  , ss_data/config.ini , Profile 1 , profile_isOn
        Else If ( temp_var == "Profile 2" )
            IniWrite, 1  , ss_data/config.ini , Profile 2 , profile_isOn
        Else If ( temp_var == "Profile 3" )
            IniWrite, 1  , ss_data/config.ini , Profile 3 , profile_isOn
        Else If ( temp_var == "Profile 4" )
            IniWrite, 1  , ss_data/config.ini , Profile 4 , profile_isOn
        Else If ( temp_var == "Profile 5" )
            IniWrite, 1  , ss_data/config.ini , Profile 5 , profile_isOn
        Else If ( temp_var == "Profile 6" )
            IniWrite, 1  , ss_data/config.ini , Profile 6 , profile_isOn
        Else If ( temp_var == "Profile 7" )
            IniWrite, 1  , ss_data/config.ini , Profile 7 , profile_isOn
        Else If ( temp_var == "Profile 8" )
            IniWrite, 1  , ss_data/config.ini , Profile 8 , profile_isOn
        Else If ( temp_var == "Profile 9" )
            IniWrite, 1  , ss_data/config.ini , Profile 9 , profile_isOn
        Else
            MsgBox, Error Something Fucked Up

        Reload
        ExitApp
    }

    ; hotkey set chnages a hotkey and updates ini file

        change_hotkey() ; hotkey = current_hk
        {
            Global

            If ( !ihk_%current_hk% )
                Return

            IniRead,   ihk_%old_hk%      , ss_data/config.ini  , %current_profile% , hotkey_%current_hk%
            Hotkey,   % ihk_%old_hk%     , script_%current_hk% , Off

            IniWrite, % ihk_%current_hk%     , ss_data/config.ini  , %current_profile% , hotkey_%current_hk%
            IniRead,   ihk_%current_hk%      , ss_data/config.ini  , %current_profile% , hotkey_%current_hk%

            IniRead,  ihk_state_%current_hk% , ss_data/config.ini  , %current_profile% , hotkey_state_%current_hk%

            If ( !ihk_state_%current_hk% )
                Hotkey, % ihk_%current_hk% , script_%current_hk% , Off
            If ( ihk_state_%current_hk% )
                Hotkey, % ihk_%current_hk% , script_%current_hk% , On
        }

        change_hotkey1() ; hotkey = current_hk1
        {
            Global

            If ( !ihk_%current_hk1% )
                Return

            IniRead,   ihk_%old_hk1%      , ss_data/config.ini  , %current_profile% , hotkey_%current_hk1%
            Hotkey,   % ihk_%old_hk1%     , script_%current_hk1% , Off

            IniWrite, % ihk_%current_hk1%     , ss_data/config.ini  , %current_profile% , hotkey_%current_hk1%
            IniRead,   ihk_%current_hk1%      , ss_data/config.ini  , %current_profile% , hotkey_%current_hk1%

            IniRead,  ihk_state_%current_hk1% , ss_data/config.ini  , %current_profile% , hotkey_state_%current_hk1%

            If ( !ihk_state_%current_hk1% )
                Hotkey, % ihk_%current_hk1% , script_%current_hk1% , Off
            If ( ihk_state_%current_hk1% )
                Hotkey, % ihk_%current_hk1% , script_%current_hk1% , On
        }

        change_hotkey2() ; hotkey = current_hk2
        {
            Global

            If ( !ihk_%current_hk2% )
                Return

            IniRead,   ihk_%old_hk2%      , ss_data/config.ini  , %current_profile% , hotkey_%current_hk2%
            Hotkey,   % ihk_%old_hk2%     , script_%current_hk2% , Off

            IniWrite, % ihk_%current_hk2%     , ss_data/config.ini  , %current_profile% , hotkey_%current_hk2%
            IniRead,   ihk_%current_hk2%      , ss_data/config.ini  , %current_profile% , hotkey_%current_hk2%

            IniRead,  ihk_state_%current_hk2% , ss_data/config.ini  , %current_profile% , hotkey_state_%current_hk2%

            If ( !ihk_state_%current_hk2% )
                Hotkey, % ihk_%current_hk2% , script_%current_hk2% , Off
            If ( ihk_state_%current_hk2% )
                Hotkey, % ihk_%current_hk2% , script_%current_hk2% , On
        }

        change_hotkey3() ; hotkey = current_hk3
        {
            Global

            If ( !ihk_%current_hk3% )
                Return

            IniRead,   ihk_%old_hk3%      , ss_data/config.ini  , %current_profile% , hotkey_%current_hk3%
            Hotkey,   % ihk_%old_hk3%     , script_%current_hk3% , Off

            IniWrite, % ihk_%current_hk3%     , ss_data/config.ini  , %current_profile% , hotkey_%current_hk3%
            IniRead,   ihk_%current_hk3%      , ss_data/config.ini  , %current_profile% , hotkey_%current_hk3%

            IniRead,  ihk_state_%current_hk3% , ss_data/config.ini  , %current_profile% , hotkey_state_%current_hk3%

            If ( !ihk_state_%current_hk3% )
                Hotkey, % ihk_%current_hk3% , script_%current_hk3% , Off
            If ( ihk_state_%current_hk3% )
                Hotkey, % ihk_%current_hk3% , script_%current_hk3% , On
        }

        change_hotkey4() ; hotkey = current_hk4
        {
            Global

            If ( !ihk_%current_hk4% )
                Return

            IniRead,   ihk_%old_hk4%      , ss_data/config.ini  , %current_profile% , hotkey_%current_hk4%
            Hotkey,   % ihk_%old_hk4%     , script_%current_hk4% , Off

            IniWrite, % ihk_%current_hk4%     , ss_data/config.ini  , %current_profile% , hotkey_%current_hk4%
            IniRead,   ihk_%current_hk4%      , ss_data/config.ini  , %current_profile% , hotkey_%current_hk4%

            IniRead,  ihk_state_%current_hk4% , ss_data/config.ini  , %current_profile% , hotkey_state_%current_hk4%

            If ( !ihk_state_%current_hk4% )
                Hotkey, % ihk_%current_hk4% , script_%current_hk4% , Off
            If ( ihk_state_%current_hk4% )
                Hotkey, % ihk_%current_hk4% , script_%current_hk4% , On
        }

        change_hotkey5() ; hotkey = current_hk5
        {
            Global

            If ( !ihk_%current_hk5% )
                Return

            IniRead,   ihk_%old_hk5%      , ss_data/config.ini  , %current_profile% , hotkey_%current_hk5%
            Hotkey,   % ihk_%old_hk5%     , script_%current_hk5% , Off

            IniWrite, % ihk_%current_hk5%     , ss_data/config.ini  , %current_profile% , hotkey_%current_hk5%
            IniRead,   ihk_%current_hk5%      , ss_data/config.ini  , %current_profile% , hotkey_%current_hk5%

            IniRead,  ihk_state_%current_hk5% , ss_data/config.ini  , %current_profile% , hotkey_state_%current_hk5%

            If ( !ihk_state_%current_hk5% )
                Hotkey, % ihk_%current_hk5% , script_%current_hk5% , Off
            If ( ihk_state_%current_hk5% )
                Hotkey, % ihk_%current_hk5% , script_%current_hk5% , On
        }

    ; Updates values when sliding switch things are used
        ; hotkey on/off state
        
            hotkey_state_set(state)
            {
                Global current_hk , current_profile

                IniWrite, %state%                , ss_data/config.ini , %current_profile% , hotkey_state_%current_hk%
                IniRead,  ihk_state_%current_hk% , ss_data/config.ini , %current_profile% , hotkey_state_%current_hk%

                If ( state == 0 )
                    Hotkey, % ihk_%current_hk% , script_%current_hk% , Off
                If ( state == 1 )
                    Hotkey, % ihk_%current_hk% , script_%current_hk% , On
            }

            hotkey_state_set1(state)
            {
                Global current_hk1 , current_profile

                IniWrite, %state%                , ss_data/config.ini , %current_profile% , hotkey_state_%current_hk1%
                IniRead,  ihk_state_%current_hk1% , ss_data/config.ini , %current_profile% , hotkey_state_%current_hk1%

                If ( state == 0 )
                    Hotkey, % ihk_%current_hk1% , script_%current_hk1% , Off
                If ( state == 1 )
                    Hotkey, % ihk_%current_hk1% , script_%current_hk1% , On
            }

            hotkey_state_set2(state)
            {
                Global current_hk2 , current_profile

                IniWrite, %state%                , ss_data/config.ini , %current_profile% , hotkey_state_%current_hk2%
                IniRead,  ihk_state_%current_hk2% , ss_data/config.ini , %current_profile% , hotkey_state_%current_hk2%

                If ( state == 0 )
                    Hotkey, % ihk_%current_hk2% , script_%current_hk2% , Off
                If ( state == 1 )
                    Hotkey, % ihk_%current_hk2% , script_%current_hk2% , On
            }

            hotkey_state_set3(state)
            {
                Global current_hk3 , current_profile

                IniWrite, %state%                , ss_data/config.ini , %current_profile% , hotkey_state_%current_hk3%
                IniRead,  ihk_state_%current_hk3% , ss_data/config.ini , %current_profile% , hotkey_state_%current_hk3%

                If ( state == 0 )
                    Hotkey, % ihk_%current_hk3% , script_%current_hk3% , Off
                If ( state == 1 )
                    Hotkey, % ihk_%current_hk3% , script_%current_hk3% , On
            }

            hotkey_state_set4(state)
            {
                Global current_hk4 , current_profile

                IniWrite, %state%                , ss_data/config.ini , %current_profile% , hotkey_state_%current_hk4%
                IniRead,  ihk_state_%current_hk4% , ss_data/config.ini , %current_profile% , hotkey_state_%current_hk4%

                If ( state == 0 )
                    Hotkey, % ihk_%current_hk4% , script_%current_hk4% , Off
                If ( state == 1 )
                    Hotkey, % ihk_%current_hk4% , script_%current_hk4% , On
            }

            hotkey_state_set5(state)
            {
                Global current_hk5 , current_profile

                IniWrite, %state%                , ss_data/config.ini , %current_profile% , hotkey_state_%current_hk5%
                IniRead,  ihk_state_%current_hk5% , ss_data/config.ini , %current_profile% , hotkey_state_%current_hk5%

                If ( state == 0 )
                    Hotkey, % ihk_%current_hk5% , script_%current_hk5% , Off
                If ( state == 1 )
                    Hotkey, % ihk_%current_hk5% , script_%current_hk5% , On
            }

        ; double tap state

            hotkey_dt_state(state)
            {
                Global current_hk , current_profile

                IniWrite, %state%                   , ss_data/config.ini , %current_profile% , hotkey_dt_state_%current_hk%
                IniRead,  ihk_dt_state_%current_hk% , ss_data/config.ini , %current_profile% , hotkey_dt_state_%current_hk%
            }

            hotkey_dt_state1(state)
            {
                Global current_hk1 , current_profile

                IniWrite, %state%                   , ss_data/config.ini , %current_profile% , hotkey_dt_state_%current_hk1%
                IniRead,  ihk_dt_state_%current_hk1% , ss_data/config.ini , %current_profile% , hotkey_dt_state_%current_hk1%
            }

            hotkey_dt_state2(state)
            {
                Global current_hk2 , current_profile

                IniWrite, %state%                   , ss_data/config.ini , %current_profile% , hotkey_dt_state_%current_hk2%
                IniRead,  ihk_dt_state_%current_hk2% , ss_data/config.ini , %current_profile% , hotkey_dt_state_%current_hk2%
            }

            hotkey_dt_state3(state)
            {
                Global current_hk3 , current_profile

                IniWrite, %state%                   , ss_data/config.ini , %current_profile% , hotkey_dt_state_%current_hk3%
                IniRead,  ihk_dt_state_%current_hk3% , ss_data/config.ini , %current_profile% , hotkey_dt_state_%current_hk3%
            }

            hotkey_dt_state4(state)
            {
                Global current_hk4 , current_profile

                IniWrite, %state%                   , ss_data/config.ini , %current_profile% , hotkey_dt_state_%current_hk4%
                IniRead,  ihk_dt_state_%current_hk4% , ss_data/config.ini , %current_profile% , hotkey_dt_state_%current_hk4%
            }

            hotkey_dt_state5(state)
            {
                Global current_hk5 , current_profile

                IniWrite, %state%                   , ss_data/config.ini , %current_profile% , hotkey_dt_state_%current_hk5%
                IniRead,  ihk_dt_state_%current_hk5% , ss_data/config.ini , %current_profile% , hotkey_dt_state_%current_hk5%
            }

        ; send key threw state

            hotkey_sk_state(state)
            {
                Global current_hk , current_profile

                IniWrite, %state%                   , ss_data/config.ini , %current_profile% , hotkey_sk_state_%current_hk%
                IniRead,  ihk_sk_state_%current_hk% , ss_data/config.ini , %current_profile% , hotkey_sk_state_%current_hk%

                ez_create_new_script(current_profile)
            }

            hotkey_sk_state1(state)
            {
                Global current_hk1 , current_profile

                IniWrite, %state%                   , ss_data/config.ini , %current_profile% , hotkey_sk_state_%current_hk1%
                IniRead,  ihk_sk_state_%current_hk1% , ss_data/config.ini , %current_profile% , hotkey_sk_state_%current_hk1%

                ez_create_new_script(current_profile)
            }

            hotkey_sk_state2(state)
            {
                Global current_hk2 , current_profile

                IniWrite, %state%                   , ss_data/config.ini , %current_profile% , hotkey_sk_state_%current_hk2%
                IniRead,  ihk_sk_state_%current_hk2% , ss_data/config.ini , %current_profile% , hotkey_sk_state_%current_hk2%

                ez_create_new_script(current_profile)
            }

            hotkey_sk_state3(state)
            {
                Global current_hk3 , current_profile

                IniWrite, %state%                   , ss_data/config.ini , %current_profile% , hotkey_sk_state_%current_hk3%
                IniRead,  ihk_sk_state_%current_hk3% , ss_data/config.ini , %current_profile% , hotkey_sk_state_%current_hk3%

                ez_create_new_script(current_profile)
            }

            hotkey_sk_state4(state)
            {
                Global current_hk4 , current_profile

                IniWrite, %state%                   , ss_data/config.ini , %current_profile% , hotkey_sk_state_%current_hk4%
                IniRead,  ihk_sk_state_%current_hk4% , ss_data/config.ini , %current_profile% , hotkey_sk_state_%current_hk4%

                ez_create_new_script(current_profile)
            }

            hotkey_sk_state5(state)
            {
                Global current_hk5 , current_profile

                IniWrite, %state%                   , ss_data/config.ini , %current_profile% , hotkey_sk_state_%current_hk5%
                IniRead,  ihk_sk_state_%current_hk5% , ss_data/config.ini , %current_profile% , hotkey_sk_state_%current_hk5%

                ez_create_new_script(current_profile)
            }
                

; =====================================================

; =====================================================
; timing and script stoping stuff

    sleep(period := 0) ; sleep - don't touch
    {   
        Global ExitThreadFlag
        if ( ExitThreadFlag )
        {
            global ExitThreadFlag := False       , disable_CycleSelect := False
                    , bazooka1_script_isOn := False , bazooka2_script_isOn := False
                    , boneSpirit_script_isOn := False
            ToolTip,
            Exit
        }

        If !(error := DllCall("winmm\timeGetDevCaps", Int64P, TimeCaps, UInt,8))
        {
            MinSetResolution := TimeCaps & 0xFFFFFFFF
            DllCall("Winmm.dll\timeBeginPeriod", UInt, MinSetResolution)
        }
        If (period >= 0)    
            DllCall("Sleep", UInt, period)
        If (MinSetResolution)                       
            DllCall("Winmm.dll\timeEndPeriod", UInt, MinSetResolution)
        
        Return error
    }

    stopwatch(itemId := 0, removeUsedItem := True) ; stopwatch - don't touch
    {
        static F := DllCall("QueryPerformanceFrequency", "Int64P", F) * F , aTicks := [], runID := 0

        If (itemId = 0)
        {
            DllCall("QueryPerformanceCounter", "Int64P", S), aTicks[++runID] := S
            Return runID
        }
        Else 
        {
            If aTicks.hasKey(itemId)
            {
                DllCall("QueryPerformanceCounter", "Int64P", End)
                Return (End - aTicks[itemId]) / F * 1000, removeUsedItem ? aTicks.remove(itemId, "") : ""
            }
            
            Else Return -1
        }   
    }

    script_stop()  ; set script to stop after next sleep
    {
        Global
        If ( !init_script( "stop" , 1 , 1 , 1 ) )
            Return
        ExitThreadFlag := True
        stop_script_isOn := False
    }
    
    stop() ; stop everything thing
    {
        Reload
        ExitApp
    }

; =====================================================

; =====================================================
; init_script put at the start of all diablo scripts

    init_script( script_name , chat , esc , map )
    {
        Global 

        ExitThreadFlag := False

        IfWinNotActive, ahk_class D3 Main Window Class
            Exit ; Return False

        If ( ( chat && chat_isOn ) || ( !chat && !chat_isOn ) )
            Exit ; Return False
        If ( ( esc && esc_isOn ) || ( !esc && !esc_isOn ) )
            Exit ; Return False
        If ( ( map && map_isOn ) || ( !map && !map_isOn ) )
            Exit ; Return False

        If ( ihk_dt_state_%script_name% )                                           ; if double tap is true
            If ( A_PriorHotKey = A_ThisHotKey && A_TimeSincePriorHotkey < 500 )     ; and a key was just double tapped
            {
                If ( %script_name%_script_isOn )                                    ; then check if script was already running
                {
                    %script_name%_script_isOn := False                              ; if it was, then change script_inOn var so script will stop
                    Exit ;  Return False
                }
                %script_name%_script_isOn := True                                   ; otherwize set script_isOn var to true
                Return True                                                         ; and return true so script runs
            }
        Else
            Exit ; Return False                                                     ; key wasn't double tapped so script returns false

        If ( %script_name%_script_isOn )
        {
            %script_name%_script_isOn := False 
            Exit ;  Return False
        }
            
        %script_name%_script_isOn := True
        Return True

    }

; =====================================================

; =====================================================
; shit i need but don't have a good description for

    getScreenCoordinates() ; get mouse coordinates
    {
        MouseGetPos, x, y
        new := x " " y
        clipboard := new
        ToolTip, %x% %y%, 0, 0
    }

    frames(x) ; convert frames to ms
    {    
        Return (1000 / 60) * x
    }

    RemoveToolTip() ; clears a tool tip
    { 
        ToolTip,
    }


; =====================================================