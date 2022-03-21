; =====================================================
; town

    script_town() ; part that does all the fast salvage cube upgrade and stuff like that
    {
        Global

        If ( !init_script( "town" , 1 , 1 , 1 ) )
            Exit

        quickLoot_toggle := False
        Settimer, auto_loot , Off

        check_townImages()

        ; Cube Page 2
            If ( cubePage2_isOn )
                cubeCheck()
        ; Cube Page 3
            If ( cubePage3_isOn )
                cubeCheck()

        ; cube page 6
            If ( cubePage6_isOn )
            {
                MouseMove, inventory1X , inventory1Y , 0
                SendInput, {RButton}
                sleep( 15 )
                MouseMove, inventory2X , inventory2Y , 0
                SendInput, {RButton}
                sleep( 15 )
                MouseMove, transButtonX , transButtonY , 0
                SendInput, {LButton}
                sleep( ivar_cube_delay )
                MouseMove, leftArrowBookX , leftArrowBookY , 0
                SendInput, {LButton}
                sleep( 15 )
                MouseMove, rightArrowBookX , rightArrowBookY , 0
                SendInput, {LButton}
                sleep( sleep 250 )
            }
        ; cube page 7
            If ( cubePage7_isOn )
                cubeCheck()

        ; cube page 8
            If ( cubePage8_isOn )
                cubeCheck()

        ; cube page 9
            If ( cubePage9_isOn )
                cubeCheck()

        ; buy yellows fast
            If ( weaponsTab_isOn || armorTab_isOn || gemsTab_isOn )
            {
                MouseGetPos, x , y
                MouseMove, yellowItemX , yellowItemY , 0
                SendInput, {LButton}
                SendInput, 99
                MouseMove, yellowBuyX , yellowBuyY , 0
                SendInput, {LButton}
                MouseMove, x , y
            }

        ; fast salvage
            If ( salvageTab_isOn )
            {
                x1 := x1fs , y1 := y1fs , x2 := x2fs , y2 := y2fs

                sleep_amount := 25
                MouseGetPos, x , y
                MouseClick, Left , whitefs , yfs
                sleep( sleep_amount )
                SendInput, {Enter}
                sleep( ivar_salvage_delay )
                SendInput, {Enter}
                sleep( ivar_salvage_delay )
                MouseClick, Left , bluefs , yfs
                sleep( sleep_amount )
                SendInput, {Enter}
                sleep( ivar_salvage_delay )
                SendInput, {Enter}
                sleep( ivar_salvage_delay )
                MouseClick, Left , yellowfs , yfs
                sleep( sleep_amount )
                SendInput, {Enter}
                sleep( ivar_salvage_delay )
                SendInput, {Enter}
                sleep( ivar_salvage_delay )
                MouseClick, Left , salvagefs , yfs
                sleep( sleep_amount )

                Loop, 60
                {   
                    If ( !town_script_isOn )
                        Break
                    If ( !checkImage( imgsaved_inventory , x1 "|" y1 "|" x2 "|" y2 , 15 ) )
                    {
                        MouseClick, Left , x1 , y1
                        sleep( ivar_salvage_delay )
                        SendInput, {Enter}
                        sleep( ivar_salvage_delay )
                        SendInput, {Enter}
                        sleep( ivar_salvage_delay )
                    }

                    x1 += nextItem , x2 += nextItem
                    
                    If ( A_Index == 10 )
                        x1 := x1fs , x2 := x2fs , y1 += nextItem , y2 += nextItem
                    If ( A_Index == 20 )
                        x1 := x1fs , x2 := x2fs , y1 += nextItem , y2 += nextItem
                    If ( A_Index == 30 )
                        x1 := x1fs , x2 := x2fs , y1 += nextItem , y2 += nextItem
                    If ( A_Index == 40 )
                        x1 := x1fs , x2 := x2fs , y1 += nextItem , y2 += nextItem
                    If ( A_Index == 50 )
                        x1 := x1fs , x2 := x2fs , y1 += nextItem , y2 += nextItem

                }

                MouseClick, Left , salvagefs , yfs
                sleep( ivar_salvage_delay )
                MouseMove, x , y 

                sleep( 100 )

                If ( chat_isOn )
                    SendInput, {Escape}
            }

        ; fast repair
            If ( repairTab_isOn )
            {
                MouseGetPos, x , y
                MouseMove, repairX , repairY , 0
                SendInput, {LButton}
                MouseMove, x , y
            }

        ; fast blood shards
            If ( shardsTab_isOn )
            {
                ; Loop, 5
                ; {
                ;     MouseGetPos, x , y
                ;     if ( x > outOfBoundsX )
                ;     {
                ;         town_script_isOn := False
                ;         Exit
                ;     }
                ;     SendInput, {RButton}
                ;     sleep( 5 )
                ; }

                ; would need to fix this !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! for others  (T ONLY)
                Loop
                {
                    GetKeyState, var, t, P         
                    If var = U
                        Break
                    
                    MouseClick, Right
                    Sleep 5
                }	

            }

        ; fast vendor items
            If ( npcSellerWepons_isOn || npcSellerArmor_inOn )
            {
                Loop, 30
                {
                    MouseGetPos, x , y
                    if ( x > outOfBoundsX )
                    {
                        town_script_isOn := False
                        Exit
                    }
                    SendInput, {RButton}
                    sleep( 50 )
                }
            }

        ; fast stash gems
            If ( stash_isOn )
            {
                x1 := x1fs , y1 := y1fs , x2 := x2fs , y2 := y2fs

                MouseGetPos, x , y
                MouseMove, stashTabRow[ivar_stashRow] , stashTabRow[4]
                SendInput, {LButton}
                MouseMove, stashTabColum[6] , stashTabColum[ivar_stashColum]
                SendInput, {LButton}

                Loop, 60
                {   
                    If ( !town_script_isOn )
                        Break
                    If ( !checkImage( imgsaved_inventory , x1 "|" y1 "|" x2 "|" y2 , 15 ) )
                    {
                        MouseMove, x1 , y1 , 0
                        sleep( ivar_salvage_delay )
                        SendInput, {RButton}
                    }

                    x1 += nextItem , x2 += nextItem
                    
                    If ( A_Index == 10 )
                        x1 := x1fs , x2 := x2fs , y1 += nextItem , y2 += nextItem
                    If ( A_Index == 20 )
                        x1 := x1fs , x2 := x2fs , y1 += nextItem , y2 += nextItem
                    If ( A_Index == 30 )
                        x1 := x1fs , x2 := x2fs , y1 += nextItem , y2 += nextItem
                    If ( A_Index == 40 )
                        x1 := x1fs , x2 := x2fs , y1 += nextItem , y2 += nextItem
                    If ( A_Index == 50 )
                        x1 := x1fs , x2 := x2fs , y1 += nextItem , y2 += nextItem
                }
                
                MouseMove, x , y , 0
            }

        ; fast mystic
            If ( mystic_isOn )
            {
                MouseGetPos, x , y
                MouseMove, clickStatX , clickStatY , 0
                SendInput, {LButton}
                Sleep 20
                MouseMove, mysticRollX , mysticRollY , 0
                SendInput, {LButton}
                MouseMove, x , y , 0
            }

        town_script_isOn := False
    }

    cubeOneSlot() ; goes threw the inventory 1 item at a time
    {       
        Global
        x1 := inventory1X , y1 := inventory1Y
        sleep_amount := 15

        Loop, 60
        {
            If ( !town_script_isOn )
                Break
            MouseMove, fillBookX , fillBookY , 0
            sleep( 10 )
            SendInput, {LButton}
            sleep( 15 )
            MouseMove, x1 , y1 , 0
            sleep( 10 )
            SendInput, {RButton}
            sleep( 15 )
            MouseMove, transButtonX , transButtonY , 0
            sleep( 10 )
            SendInput, {LButton}
            sleep( ivar_cube_delay )
            MouseMove, leftArrowBookX , leftArrowBookY , 0
            SendInput, {LButton}
            sleep( 10 )
            MouseMove, rightArrowBookX , rightArrowBookY , 0
            sleep( 15 )
            SendInput, {LButton}
            sleep( ivar_cube_delay )

            x1 += nextItem , x2 += nextItem
            
            If ( A_Index == 10 )
                x1 := x1fs , x2 := x2fs , y1 += nextItem , y2 += nextItem
            If ( A_Index == 20 )
                x1 := x1fs , x2 := x2fs , y1 += nextItem , y2 += nextItem
            If ( A_Index == 30 )
                x1 := x1fs , x2 := x2fs , y1 += nextItem , y2 += nextItem
            If ( A_Index == 40 )
                x1 := x1fs , x2 := x2fs , y1 += nextItem , y2 += nextItem
            If ( A_Index == 50 )
                x1 := x1fs , x2 := x2fs , y1 += nextItem , y2 += nextItem
        }

    }

    cubeTwoSlot() ; goes threw the inventory 2 items at a time
    {   
        Global
        x1 := inventory1X , y1 := inventory1Y

        Loop, 30
        {
            If ( !town_script_isOn )
                Break
            MouseMove, fillBookX , fillBookY , 0
            sleep( 25 )
            SendInput, {LButton}
            sleep( 25 )
            MouseMove, x1 , y1 , 0
            sleep( 25 )
            SendInput, {RButton}
            sleep( 25 )
            MouseMove, transButtonX , transButtonY , 0
            sleep( 25 )
            SendInput, {LButton}
            sleep( ivar_cube_delay )
            MouseMove, leftArrowBookX , leftArrowBookY , 0
            sleep( 25 )
            SendInput, {LButton}
            sleep( 25 )
            MouseMove, rightArrowBookX , rightArrowBookY , 0
            sleep( 25 )
            SendInput, {LButton}
            sleep( ivar_cube_delay )

            x1 += nextItem , x2 += nextItem
            
            If ( A_Index == 10 )
                x1 := x1fs , x2 := x2fs , y1 += nextItem * 2 , y2 += nextItem * 2
            If ( A_Index == 20 )
                x1 := x1fs , x2 := x2fs , y1 += nextItem * 2 , y2 += nextItem * 2

        }
    }

    cubeCheck() ; check to run for 1 or 2 slot items
    {
        Global
        MouseGetPos, x , y

        If ( x > wepSlotCubeTopX && x < wepSlotCubeTopY && y > wepSlotCubeBottomX && y < wepSlotCubeBottomY )
            cubeOneSlot()
        If ( x > armorSlotCubeTopX && x < armorSlotCubeTopY && y > armorSlotCubeBottomX && y < armorSlotCubeBottomY )
            cubeTwoSlot()
    }

    check_townImages() ; check imgages for town script
    {
        Global 
        
        cubePage2_isOn       := checkImage( imgsaved_cubePage2       , imgcoord_cubePage   , 25 )
        cubePage3_isOn       := checkImage( imgsaved_cubePage3       , imgcoord_cubePage   , 25 )
        cubePage6_isOn       := checkImage( imgsaved_cubePage6       , imgcoord_cubePage   , 25 )
        cubePage7_isOn       := checkImage( imgsaved_cubePage7       , imgcoord_cubePage   , 25 )
        cubePage8_isOn       := checkImage( imgsaved_cubePage8       , imgcoord_cubePage   , 25 )
        cubePage9_isOn       := checkImage( imgsaved_cubePage9       , imgcoord_cubePage   , 25 )
        weaponsTab_isOn      := checkImage( imgsaved_weaponsOpen     , imgcoord_vendorTab  , 25 )
        armorTab_isOn        := checkImage( imgsaved_armorOpen       , imgcoord_vendorTab  , 25 )
        gemsTab_isOn         := checkImage( imgsaved_gemsOpen        , imgcoord_vendorTab  , 25 )
        mystic_isOn          := checkImage( imgsaved_mysticOpen      , imgcoord_vendorTab  , 25 )
        salvageTab_isOn      := checkImage( imgsaved_salvageOpen     , imgcoord_vendorTab  , 25 )
        repairTab_isOn       := checkImage( imgsaved_repairOpen      , imgcoord_vendorTab  , 25 )
        shardsTab_isOn       := checkImage( imgsaved_shardsOpen      , imgcoord_shardsOpen , 25 )
        npcSellerWepons_isOn := checkImage( imgsaved_npcSellerWepons , imgcoord_vendorTabH , 25 )
        npcSellerArmor_inOn  := checkImage( imgsaved_npcSellerArmor  , imgcoord_vendorTabH , 25 )
        stash_isOn           := checkImage( imgsaved_stashOpen       , imgcoord_vendorTab  , 25 )
    }
    
; =====================================================

; =====================================================
; quick loot

    script_quickLoot() ; points to another script that turns on auto loot
    {
        Global
        
        ExitThreadFlag := False

        IfWinNotActive, ahk_class D3 Main Window Class
            Exit

        If ( chat_isOn || esc_isOn || map_isOn )
            Exit

        If ( ihk_dt_state_quickLoot )
            If ( A_PriorHotKey = A_ThisHotKey && A_TimeSincePriorHotkey < 500 )
                    quickLoot_toggle := !quickLoot_toggle
            Else
                Exit
        Else
            quickLoot_toggle := !quickLoot_toggle

        temp_timer := ivar_shutoff_timer * 1000

        If ( quickLoot_toggle )
        {
            ToolTip, ON  --  Auto Loot Pickup , 0 , 0
            Settimer, auto_loot , 5
            SetTimer, RemoveToolTip, -5000
            SetTimer, quickLoot_shutoff, -%temp_timer%

        }

        If ( !quickLoot_toggle )
        {   
            ToolTip, OFF  --  Auto Loot Pickup  , 0 , 0
            Settimer, auto_loot , Off
            SetTimer, RemoveToolTip, -5000
        }

    }

    quickLoot_shutoff() ; shuts off quick loot from running
    {
        Global quickLoot_toggle := False
        ToolTip, OFF  --  Auto Loot Pickup  , 0 , 0
        Settimer, auto_loot , Off
        SetTimer, RemoveToolTip, -5000
    }

    auto_loot() ; part that picks loot up off the ground
    {   
        Global

        Loop, 7
        {
            needle := loot_array[A_index]
            haystack := Gdip_BitmapFromHWNDCropped( WinExist( "ahk_exe Diablo III64.exe" ) , x1al "|" y1al "|" x2al "|" y2al )

            If ( Gdip_ImageSearch( haystack , %needle%, LIST , 0 , 0 , 0 , 0 , 10 , 0xFFFFFF , 1 , 0 ) )
            {
                search_coordinates := StrSplit(LIST , ["," , "`n"] )
                search_coordinates[1] += x1al + click_area_offset
                search_coordinates[2] += y1al + click_area_offset
                MouseGetPos, x , y
                MouseMove, search_coordinates[1] , search_coordinates[2] , 0
                SendInput, {LButton}
                MouseMove, x , y , 0
            }

            Gdip_DisposeImage(haystack)
        }
    }

; =====================================================

; =====================================================
; quick exit

    script_quickExit()
    {
        Global

        If ( !init_script( "quickExit" , 1 , 1 , 1) )
                Return

        SendInput, {Escape}
        MouseMove, quickExitX , quickExitY
        SendInput, {Lbutton}

        quickExit_script_isOn := False
    }

; =====================================================

; =====================================================
; chat related stuff

    script_chatClan() ; enter clan chat
    {
        Global chat_isOn
        If ( chat_isOn )
            SendInput, {ctrl down}ac{ctrl up}{backspace}/c{enter}{Ctrl down}v{ctrl up}
        If ( !chat_isOn )
            SendInput, {enter}/c{enter}
    }

    script_chatParty() ; enter party chat
    {
        Global chat_isOn
        If ( chat_isOn )
            SendInput, {ctrl down}ac{ctrl up}{backspace}/p{enter}{Ctrl down}v{ctrl up}
        If ( !chat_isOn )
            SendInput, {enter}/p{enter}
    }

    script_quickMsg1() ; quick msg 1
    {
        Global
        If ( !init_script( "quickMsg1" , 1 , 1 , 1) )
            Return
        SendInput, {Enter}/p %ivar_msg1% {Enter}
        quickMsg1_script_isOn := False
    }

    script_quickMsg2() ; quick msg 2
    {
        Global
        If ( !init_script( "quickMsg2" , 1 , 1 , 1) )
            Return
        SendInput, {Enter}/p %ivar_msg2% {Enter}
        quickMsg2_script_isOn := False
    }

    script_quickMsg3() ; quick msg 3
    {
        Global
        If ( !init_script( "quickMsg3" , 1 , 1 , 1) )
            Return
        SendInput, {Enter}/p %ivar_msg3% {Enter}
        quickMsg3_script_isOn := False
    }

    script_quickMsg4() ; quick msg 4
    {
        Global
        If ( !init_script( "quickMsg4" , 1 , 1 , 1) )
            Return
        SendInput, {Enter}/p %ivar_msg4% {Enter}
        quickMsg4_script_isOn := False
    }

; =====================================================

; =====================================================
; quick town tp act 1 - 5

    script_quickTownTP1() ; act 1
    {
        Global
        If ( !init_script( "quickTownTP1" , 1 , 1 , 0 ) )
            Return

        MouseGetPos, x , y
        MouseMove, minusMapButtonX , minusMapButtonY
        SendInput, {LButton}{LButton}{LButton}
        MouseMove, act1X , act1Y
        SendInput, {LButton}
        MouseMove, act1homeX , act1homeY
        SendInput, {LButton}
        MouseMove, x , y

        quickTownTP1_script_isOn := False
    }

    script_quickTownTP2() ; act 2
    {
        Global
        If ( !init_script( "quickTownTP2" , 1 , 1 , 0 ) )
            Return

        MouseGetPos, x , y
        MouseMove, minusMapButtonX , minusMapButtonY
        SendInput, {LButton}{LButton}{LButton}
        MouseMove, act2X , act2Y
        SendInput, {LButton}
        MouseMove, act2homeX , act2homeY
        SendInput, {LButton}
        MouseMove, x , y

        quickTownTP2_script_isOn := False
    }

    script_quickTownTP3() ; act 3
    {
        Global
        If ( !init_script( "quickTownTP3" , 1 , 1 , 0 ) )
            Return

        MouseGetPos, x , y
        MouseMove, minusMapButtonX , minusMapButtonY
        SendInput, {LButton}{LButton}{LButton}
        MouseMove, act3X , act3Y
        SendInput, {LButton}
        MouseMove, act3homeX , act3homeY
        SendInput, {LButton}
        MouseMove, x , y

        quickTownTP3_script_isOn := False
    }

    script_quickTownTP4() ; act 4
    {
        Global
        If ( !init_script( "quickTownTP4" , 1 , 1 , 0 ) )
            Return

        MouseGetPos, x , y
        MouseMove, minusMapButtonX , minusMapButtonY
        SendInput, {LButton}{LButton}{LButton}
        MouseMove, act4X , act4Y
        SendInput, {LButton}
        MouseMove, act4homeX , act4homeY
        SendInput, {LButton}
        MouseMove, x , y

        quickTownTP4_script_isOn := False
    }

    script_quickTownTP5() ; act 5
    {
        Global
        If ( !init_script( "quickTownTP5" , 1 , 1 , 0 ) )
            Return

        MouseGetPos, x , y
        MouseMove, minusMapButtonX , minusMapButtonY
        SendInput, {LButton}{LButton}{LButton}
        MouseMove, act5X , act5Y
        SendInput, {LButton}
        MouseMove, act5homeX , act5homeY
        SendInput, {LButton}
        MouseMove, x , y

        quickTownTP5_script_isOn := False
    }

; =====================================================

; =====================================================
; vyr wiz lazy chantodo

    script_vyr() ; start lazy chantodo script
    {
        Global

        If ( !init_script( "vyr" , 1 , 1 , 1 ) )
            Exit

        vry_toggle := !vry_toggle

        If ( vry_toggle )
        {
            ToolTip, ON  --  Lazy Chantodo , 0 , 0
            Settimer , chantodo , 75
            SetTimer, RemoveToolTip, -5000

        }

        If ( !vry_toggle )
        {   
            ToolTip, OFF  --  Lazy Chantodo , 0 , 0
            Settimer, chantodo , Off
            SetTimer, RemoveToolTip, -5000
        }

        vyr_script_isOn := False
    }

    chantodo() ; the actual script of lazy chantodo
    {
        Global

        If ( !init_script( "chantodo1" , 1 , 1 , 1 ) )
            Exit

        If ( !chat_isOn && !esc_isOn && !map_isOn )
        {
            sleep( 50 )
            If ( checkImage( imgsaved_townPortal , imgcoord_townPortal , 100 ) )
                    Return

            If ( checkImage( imgsaved_archon1 , imgcoord_skillbarA , 150 ) || checkImage( imgsaved_archon1 , imgcoord_skillbarA , 150 ) )
            {
                If ( checkImage( imgsaved_blackhole1 , imgcoord_skillbarA , 150 ) || checkImage( imgsaved_blackhole2 , imgcoord_skillbarA , 150 ) )
                    SendInput, {%skillKey_blackHole%}
                If ( checkImage( imgsaved_frostnova1 , imgcoord_skillbarA , 150 ) || checkImage( imgsaved_frostnova2 , imgcoord_skillbarA , 150 ) )
                    SendInput, {%skillKey_frostNova%}
                SendInput, {%skillKey_archon%}
            }

            If ( checkImage( imgsaved_ablast , imgcoord_skillbar1 , 150 ) )
                SendInput, {%ikey_skill1%}
        }
        
        chantodo1_script_isOn := False            
    }

; =====================================================

; =====================================================
; zbarb

    script_zbarb() ; start script
    {
        Global

        If ( !init_script( "zbarb" , 1 , 1 , 1 ) )
            Exit

        zbarb_toggle := !zbarb_toggle

        If ( zbarb_toggle )
        {
            sprint_ready := true
            ToolTip, ON  --  Lazy zBarb , 0 , 0
            Settimer , yell_shit , 100
            SetTimer, RemoveToolTip, -5000

        }

        If ( !zbarb_toggle )
        {   
            ToolTip, OFF  --  Lazy zBarb , 0 , 0
            Settimer, yell_shit , Off
            SetTimer, RemoveToolTip, -5000
        }

        zbarb_script_isOn := False
    }

    yell_shit() ; part that yells stuff
    {
        Global
        If ( !init_script( "zbarb1" , 1 , 1 , 1 ) )
            Exit

        If ( tp_isOn )
            script_zbarb()

        If ( !chat_isOn && !esc_isOn && !map_isOn )
        {
            If ( checkImage( imgsaved_warcry1 , imgcoord_skillbarA , 50 ) || checkImage( imgsaved_warcry2 , imgcoord_skillbarA , 50 ) )
                SendInput, {%ikey_force_stand_still% down}{%skillKey_warcry%}{%ikey_force_stand_still% up}

            If ( checkImage( imgsaved_falter1 , imgcoord_skillbarA , 50 ) || checkImage( imgsaved_falter2 , imgcoord_skillbarA , 50 ) )
                SendInput, {%ikey_force_stand_still% down}{%skillKey_falter%}{%ikey_force_stand_still% up}

            If ( checkImage( imgsaved_berserker1 , imgcoord_skillbarA , 50 ) || checkImage( imgsaved_berserker2 , imgcoord_skillbarA , 50 ) )
                SendInput, {%ikey_force_stand_still% down}{%skillKey_berserker%}{%ikey_force_stand_still% up}

            If ( checkImage( imgsaved_ip1 , imgcoord_skillbarA , 50 ) || checkImage( imgsaved_ip2 , imgcoord_skillbarA , 50 ) )
                If ( ivar_ipState )
                    SendInput, {%ikey_force_stand_still% down}{%skillKey_ip%}{%ikey_force_stand_still% up}

            If ( checkImage( imgsaved_sprint1 , imgcoord_skillbarA , 50 ) && sprint_ready )
            {
                sprint_ready := false
                Settimer, sprint_timer , -2900
                SendInput, {%ikey_force_stand_still% down}{%skillKey_sprint%}{%ikey_force_stand_still% up}
            }

            If ( checkImage( imgsaved_sprint2 , imgcoord_skillbarA , 50 ) && sprint_ready )
            {
                sprint_ready := false
                Settimer, sprint_timer , -2900
                SendInput, {%ikey_force_stand_still% down}{%skillKey_sprint%}{%ikey_force_stand_still% up}
            }
            
        }

        zbarb1_script_isOn := False            
    }

    sprint_timer()  ; helps in pressing sprint at a later time
    {
        Global sprint_ready := true
    }

    ipState(state)  ; check if ip is on/off
    {
        Global
        IniWrite, %state%        , ss_data/config.ini , %current_profile% , zbarb_state_ip
        IniRead,  ivar_ipState   , ss_data/config.ini , %current_profile% , zbarb_state_ip
    }

; =====================================================

; =====================================================
; bone Spirit

    script_boneSpirit() ; starting the script based on users mouse postion
    {
        Global
        If ( !init_script( "boneSpirit" , 1 , 1 , 1 ) )
            Exit

        If ( townPortal_toggle )
            script_loop_townPortal()

        MouseGetPos, x , y

        if ( x <= ( A_ScreenWidth // 2 )  && y <= ( A_ScreenHeight // 2 ) )
            castBoneSpirit( castTopLeftX , castTopLeftY , moveTopLeftX , moveTopLeftY )
        if ( x >= ( A_ScreenWidth // 2 )  && y <= ( A_ScreenHeight // 2 ) )
            castBoneSpirit( castTopRightX , castTopRightY , moveTopRightX , moveTopRightY )
        if ( x <= ( A_ScreenWidth // 2 )  && y >= ( A_ScreenHeight // 2 ) )
            castBoneSpirit( castBottomLeftX , castBottomLeftY , moveBottomLeftX , moveBottomLeftY )
        if ( x >= ( A_ScreenWidth // 2 )  && y >= ( A_ScreenHeight // 2 ) )
            castBoneSpirit( castBottomRightX , castBottomRightY , moveBottomRightX , moveBottomRightY )

        boneSpirit_script_isOn := False
    }

    castBoneSpirit( castX , castY , moveX , MoveY ) ; starts to cast bone spirits in game
    {
        Global
        watchID := stopwatch()

        MouseMove, castX , CastY
        SendInput, {%ikey_force_stand_still% down}{%skillKey_boneSpirit%}{%ikey_force_stand_still% up}{%skillKey_lod%}{%ikey_force_stand_still% up}

        while ( stopwatch( watchID , false ) < 11500 )
        {
            SendInput, {%skillKey_devour%}
            MouseMove, castX , CastY
            SendInput, {%ikey_force_stand_still% down}{%skillKey_boneSpirit%}{%ikey_force_stand_still% up}
            MouseMove, moveX , moveY
            SendInput, {%ikey_force_move%}
            If ( ivar_bs_extra )
                sleep( frames(ivar_bs_frame) / 6 )
            If ( !ivar_bs_extra )
                sleep( frames(ivar_bs_frame) )
        }
    }

    bs_extra(state) ; checks a values that tells script to shoot faster/slower
    {
        Global
        IniWrite, %state%       , ss_data/config.ini , %current_profile% , boneSpirit_extra
        IniRead,  ivar_bs_extra , ss_data/config.ini , %current_profile% , boneSpirit_extra
    }

    ; crosshair
        script_crosshair() ; move crosshair on mini map when a key is pressed
        {
            Global
            If ( !init_script( "crosshair" , 1 , 1 , 0 ) )
                Return

            if ( !crosshair_isOn )
                Return
            
            if ( crosshair_isOn )
            {
                Gui, Destroy
                if ( bsCrosshair_counter == 0 )
                    bsCrosshair_gui_poison0()
                if ( bsCrosshair_counter == 1 )
                    bsCrosshair_gui_poison2()
                if ( bsCrosshair_counter == 2 )
                    bsCrosshair_gui_cold0()

                MouseGetPos, x , y 
                x -= CrosshairXY
                y -= CrosshairXY


                Gui Show, NA x%x% y%y%
                crosshair_isOn := True
            }
            crosshair_script_isOn := False
        }

        crosshairOnMap() ; shows crosshair when map is on
        {
            Global
            Settimer, crosshairOnMap  , 100

            If ( !ihk_state_crosshair || !map_isOn && !crosshair_isOn || map_isOn && crosshair_isOn )
                Return

            If ( !map_isOn && crosshair_isOn )
            {
                Gui, Destroy
                crosshair_isOn := False
                Return
            }

            If ( map_isOn && !crosshair_isOn )
            {
                if ( bsCrosshair_counter == 0 )
                    bsCrosshair_gui_poison0()
                if ( bsCrosshair_counter == 1 )
                    bsCrosshair_gui_poison2()
                if ( bsCrosshair_counter == 2 )
                    bsCrosshair_gui_cold0()

                x := (A_ScreenWidth  // 2) - CrosshairXY
                y := (A_ScreenHeight // 2) - CrosshairXY

                Gui Show, NA x%x% y%y%
                crosshair_isOn := True
            }

        }

        bsCrosshair_Gui_poison0() ; draws crosshair poison 0
        {
            Global
            Gui -Caption +LastFound +ToolWindow +AlwaysOnTop 
            Gui, Margin, 0, 0 
            Gui, Color, 000000 
            Gui, Add, Picture, x0 y0 w%CrosshairWH% h%CrosshairWH% +BackgroundTrans, %img_dir%/bspoison0.png
            WinSet, Transcolor, 000000
            WinSet, ExStyle, +0x20
        }

        bsCrosshair_Gui_poison2() ; draws crosshair poison 2
        {
            Global
            Gui -Caption +LastFound +ToolWindow +AlwaysOnTop 
            Gui, Margin, 0, 0 
            Gui, Color, 000000 
            Gui, Add, Picture, x0 y0 w%CrosshairWH% h%CrosshairWH% +BackgroundTrans, %img_dir%/bspoison2.png
            WinSet, Transcolor, 000000
            WinSet, ExStyle, +0x20
        }

        bsCrosshair_Gui_cold0() ; draws crosshair cold 0
        {
            Global
            Gui -Caption +LastFound +ToolWindow +AlwaysOnTop 
            Gui, Margin, 0, 0 
            Gui, Color, 000000 
            Gui, Add, Picture, x0 y0 w%CrosshairWH% h%CrosshairWH% +BackgroundTrans, %img_dir%/bscold0.png
            WinSet, Transcolor, 000000
            WinSet, ExStyle, +0x20
        }

        script_cross_switcher() ; crosshair switcher
        {
            global
            If ( !init_script( "cross_switcher" , 1 , 1 , 0 ) )
                Return

            if ( crosshair_isOn )
            {
                bsCrosshair_counter++
                if (bsCrosshair_counter == 3)
                    bsCrosshair_counter := 0

                Gui, Destroy
                crosshair_isOn := False
            }
            cross_switcher_script_isOn := False
        }

    ; town portal
        script_loop_townPortal() ; start section that loops tp
        {
            global
            If ( !init_script( "loop_townPortal" , 1 , 1 , 1 ) )
                Exit
            
            townPortal_toggle := !townPortal_toggle

            If ( townPortal_toggle )
            {
                ToolTip, ON  --  Lazy townPortal , 0 , 0
                SetTimer, RemoveToolTip, -5000
                loop_tp()
            }

            If ( !townPortal_toggle )
            {   
                SendInput, {%skillKey_devour%}
                ToolTip, OFF  --  Lazy townPortal , 0 , 0
                Settimer, loop_tp , Off
                SetTimer, RemoveToolTip, -5000
            }

            loop_townPortal_script_isOn := False
        }

        loop_tp() ; loops tp
        {
            Global
            Settimer , loop_tp , 1500
            
            If ( esc_isOn && chat_isOn )
                SendInput, {ctrl down}ac{ctrl up}{escape}{escape}{%skillKey_devour%}{%ikey_townPortal%}{escape}{enter}{ctrl down}v{ctrl up}

            Else If ( map_isOn && chat_isOn )
                SendInput, {ctrl down}ac{ctrl up}{escape}{escape}{%skillKey_devour%}{%ikey_townPortal%}{tab}{enter}{ctrl down}v{ctrl up}

            Else If ( map_isOn )
                SendInput, {escape}{%skillKey_devour%}{%ikey_townPortal%}{tab}

            Else If ( esc_isOn )
                SendInput, {escape}{%skillKey_devour%}{%ikey_townPortal%}{escape}

            Else If ( chat_isOn )
                SendInput, {ctrl down}ac{ctrl up}{escape}{%skillKey_devour%}{%ikey_townPortal%}{enter}{ctrl down}v{ctrl up}

            Else
                SendInput, {%skillKey_devour%}{%ikey_townPortal%}
        }

; =====================================================

; =====================================================
; zmonk

    script_zmonk() ; starts zmonk script
    {
        Global

        If ( !init_script( "zmonk" , 1 , 1 , 1 ) )
            Exit

        zmonk_toggle := !zmonk_toggle

        If ( zmonk_toggle )
        {
            ton1_ready := true , ton2_ready := true
            ToolTip, ON  --  Lazy zMonk , 0 , 0
            Settimer , run_monk , 50
            SetTimer, RemoveToolTip, -5000

        }

        If ( !zmonk_toggle )
        {   
            ToolTip, OFF  --  Lazy zMonk , 0 , 0
            Settimer, run_monk , Off
            SetTimer, RemoveToolTip, -5000
        }

        zmonk_script_isOn := False
    }

    run_monk()  ; looping of the script
    {
        Global

        If ( !init_script( "zmonk1" , 1 , 1 , 1 ) )
            Exit

        If ( !chat_isOn && !esc_isOn && !map_isOn && ! checkImage( imgsaved_townPortal , imgcoord_townPortal , 50 ) )
        {
            If ( checkImage( imgsaved_epiphany1 , imgcoord_skillbarA , 50 ) || checkImage( imgsaved_epiphany2 , imgcoord_skillbarA , 50 ) )
                SendInput, {%ikey_force_stand_still% down}{%skillKey_epiphany%}{%ikey_force_stand_still% up}

            If ( checkImage( imgsaved_zephyr1 , imgcoord_skillbarA , 50 ) || checkImage( imgsaved_zephyr2 , imgcoord_skillbarA , 50 ) )
                SendInput, {%ikey_force_stand_still% down}{%skillKey_zephyr%}{%ikey_force_stand_still% up}

            If ( checkImage( imgsaved_ton1 , imgcoord_skillbarA , 50 ) || checkImage( imgsaved_ton2 , imgcoord_skillbarA , 50 ) )
            {
                If ( GetKeyState( ikey_force_stand_still , "P" ) && ton1_ready )
                {
                    ton1_ready := false
                    Settimer, ton_timer1 , -50
                    SendInput, {%skillKey_ton%}
                }
                If ( !GetKeyState( ikey_force_stand_still , "P" ) && ton2_ready )
                {
                    ton2_ready := false
                    Settimer, ton_timer2 , -1500
                    SendInput, {%skillKey_ton%}
                } 
            }

            If ( checkImage( imgsaved_sanc1 , imgcoord_skillbarA , 50 ) || checkImage( imgsaved_sanc2 , imgcoord_skillbarA , 50 ) )
                If ( GetKeyState( ikey_force_stand_still , "P" ) && ivar_sancState )
                    SendInput, {%skillKey_sanc%}

            If ( checkImage( imgsaved_serenity1 , imgcoord_skillbarA , 50 ) || checkImage( imgsaved_serenity2 , imgcoord_skillbarA , 50 ) )
                If ( ivar_serenityState )
                    SendInput, {%ikey_force_stand_still% down}{%skillKey_serenity%}{%ikey_force_stand_still% up}
        }
        
            zmonk1_script_isOn := False
    }

    ton_timer1()  ; timer for TON fast
    {
        Global ton1_ready := true
    }
    
    ton_timer2() ; timer for TON slow
    {
        Global ton2_ready := true
    }

    sancState(state) ; gui settings select
    {
        Global
        IniWrite, %state%        , ss_data/config.ini , %current_profile% , zmonk_state_sanc
        IniRead,  ivar_sancState , ss_data/config.ini , %current_profile% , zmonk_state_sanc
    }

    serenityState(state) ; gui setting select
    {
        Global
        IniWrite, %state%            , ss_data/config.ini , %current_profile% , zmonk_state_serenity
        IniRead,  ivar_serenityState , ss_data/config.ini , %current_profile% , zmonk_state_serenity
    }

; =====================================================