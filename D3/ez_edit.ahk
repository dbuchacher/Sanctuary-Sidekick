; =====================================================
; edit this to add listings to the  defualt ini file

    ezedit_create_config_file( tmp )
    {   
        ; profile
        IniWrite, Profile %tmp%     , ss_data/config.ini , Profile %tmp%     , profile_name
        IniWrite, False             , ss_data/config.ini , Profile %tmp%     , profile_isOn 
        ; key bindings
        IniWrite, 1                 , ss_data/config.ini , Profile %tmp%     , ikey_skill1
        IniWrite, 2                 , ss_data/config.ini , Profile %tmp%     , ikey_skill2
        IniWrite, 3                 , ss_data/config.ini , Profile %tmp%     , ikey_skill3
        IniWrite, 4                 , ss_data/config.ini , Profile %tmp%     , ikey_skill4
        IniWrite, q                 , ss_data/config.ini , Profile %tmp%     , ikey_potion
        IniWrite, t                 , ss_data/config.ini , Profile %tmp%     , ikey_townPortal
        IniWrite, space             , ss_data/config.ini , Profile %tmp%     , ikey_force_move
        IniWrite, shift             , ss_data/config.ini , Profile %tmp%     , ikey_force_stand_still
        ; config
        IniWrite, 115               , ss_data/config.ini , Profile %A_index% , cube_delay_town
        IniWrite, 20                , ss_data/config.ini , Profile %A_index% , salvage_delay_town
        IniWrite, 1                 , ss_data/config.ini , Profile %A_index% , stashRow
        IniWrite, 2                 , ss_data/config.ini , Profile %A_index% , stashColum
        IniWrite, 22                , ss_data/config.ini , Profile %A_index% , search_radius_quickLoot
        IniWrite, 10                , ss_data/config.ini , Profile %A_index% , shutoff_timer_quickLoot
        IniWrite, "Move / Skip"     , ss_data/config.ini , Profile %A_index% , msg1_quickMsg1
        IniWrite, "Stop / Stay"     , ss_data/config.ini , Profile %A_index% , msg1_quickMsg2
        IniWrite, "Blank Msg1"      , ss_data/config.ini , Profile %A_index% , msg1_quickMsg3
        IniWrite, "Blank Msg2"      , ss_data/config.ini , Profile %A_index% , msg1_quickMsg4
        IniWrite, 100               , ss_data/config.ini , Profile %A_index% , bazooka_offset
        IniWrite, 76                , ss_data/config.ini , Profile %A_index% , bazooka_chanAt
        IniWrite, 0                 , ss_data/config.ini , Profile %A_index% , bazooka_archonAt
        IniWrite, 1.40              , ss_data/config.ini , Profile %A_index% , bazooka_wepAPS
        IniWrite, 0                 , ss_data/config.ini , Profile %A_index% , bazooka_wepAS
        IniWrite, 10                , ss_data/config.ini , Profile %A_index% , bazooka_asIncrease
        IniWrite, 1                 , ss_data/config.ini , Profile %A_index% , boneSpirit_extra
        IniWrite, 29                , ss_data/config.ini , Profile %A_index% , boneSpirit_frame
        IniWrite, 1                 , ss_data/config.ini , Profile %A_index% , zmonk_state_sanc
        IniWrite, 0                 , ss_data/config.ini , Profile %A_index% , zmonk_state_serenity
        IniWrite, 0                 , ss_data/config.ini , Profile %A_index% , zbarb_state_ip


    
    }

; =====================================================

; =====================================================
; create new scripts / hotkeys

    ez_create_new_script( tmp )
    {
        ; hotkeys           ; name              ; hotkey    ; state  ; dt_state  ; sk state  ; profile number
        create_new_script( "stop"            , "w"       , "1"    , "1"       , "1"       , tmp )
        create_new_script( "town"            , "t"       , "1"    , "0"       , "1"       , tmp )
        create_new_script( "quickExit"       , "b"       , "1"    , "1"       , "1"       , tmp )
        create_new_script( "quickLoot"       , "e"       , "1"    , "1"       , "1"       , tmp )
        create_new_script( "chatParty"       , "+Enter"  , "1"    , "0"       , "0"       , tmp )
        create_new_script( "chatClan"        , "^Enter"  , "1"    , "0"       , "0"       , tmp )
        create_new_script( "quickMsg1"       , "!1"      , "1"    , "0"       , "0"       , tmp )
        create_new_script( "quickMsg2"       , "!2"      , "1"    , "0"       , "0"       , tmp )
        create_new_script( "quickMsg3"       , "!3"      , "0"    , "0"       , "0"       , tmp )
        create_new_script( "quickMsg4"       , "!4"      , "0"    , "0"       , "0"       , tmp )
        create_new_script( "quickTownTP1"    , "1"       , "1"    , "0"       , "1"       , tmp )
        create_new_script( "quickTownTP2"    , "2"       , "1"    , "0"       , "1"       , tmp )
        create_new_script( "quickTownTP3"    , "3"       , "1"    , "0"       , "1"       , tmp )
        create_new_script( "quickTownTP4"    , "4"       , "1"    , "0"       , "1"       , tmp )
        create_new_script( "quickTownTP5"    , "5"       , "1"    , "0"       , "1"       , tmp )
        create_new_script( "vyr"             , "d"       , "0"    , "0"       , "1"       , tmp )
        create_new_script( "zbarb"           , "d"       , "0"    , "0"       , "1"       , tmp )
        create_new_script( "boneSpirit"      , "d"       , "0"    , "0"       , "1"       , tmp )
        create_new_script( "crosshair"       , "f"       , "0"    , "0"       , "1"       , tmp )
        create_new_script( "cross_switcher"  , "WheelUp" , "0"    , "0"       , "1"       , tmp )
        create_new_script( "loop_townPortal" , "a"       , "0"    , "0"       , "1"       , tmp )
        create_new_script( "zmonk"           , "d"       , "0"    , "0"       , "1"       , tmp )
    }

; =====================================================

; =====================================================
; edit this to add varaibles to memory here

    ez_edit_set_variables()
    {
        Global
        ; profile
        IniRead, i_name                 , ss_data/config.ini , %current_profile% , profile_name
        IniRead, i_name1                , ss_data/config.ini , Profile 1         , profile_name
        IniRead, i_name2                , ss_data/config.ini , Profile 2         , profile_name
        IniRead, i_name3                , ss_data/config.ini , Profile 3         , profile_name
        IniRead, i_name4                , ss_data/config.ini , Profile 4         , profile_name
        IniRead, i_name5                , ss_data/config.ini , Profile 5         , profile_name
        IniRead, i_name6                , ss_data/config.ini , Profile 6         , profile_name
        IniRead, i_name7                , ss_data/config.ini , Profile 7         , profile_name
        IniRead, i_name8                , ss_data/config.ini , Profile 8         , profile_name
        IniRead, i_name9                , ss_data/config.ini , Profile 9         , profile_name
        ; key bindings
        IniRead, ikey_skill1            , ss_data/config.ini , %current_profile% , ikey_skill1
        IniRead, ikey_skill2            , ss_data/config.ini , %current_profile% , ikey_skill2
        IniRead, ikey_skill3            , ss_data/config.ini , %current_profile% , ikey_skill3
        IniRead, ikey_skill4            , ss_data/config.ini , %current_profile% , ikey_skill4
        IniRead, ikey_potion            , ss_data/config.ini , %current_profile% , ikey_potion
        IniRead, ikey_townPortal        , ss_data/config.ini , %current_profile% , ikey_townPortal
        IniRead, ikey_force_move        , ss_data/config.ini , %current_profile% , ikey_force_move
        IniRead, ikey_force_stand_still , ss_data/config.ini , %current_profile% , ikey_force_stand_still
        ; config 
        IniRead, ivar_cube_delay        , ss_data/config.ini , %current_profile% , cube_delay_town
        IniRead, ivar_salvage_delay     , ss_data/config.ini , %current_profile% , salvage_delay_town
        IniRead, ivar_stashRow          , ss_data/config.ini , %current_profile% , stashRow
        IniRead, ivar_stashColum        , ss_data/config.ini , %current_profile% , stashColum
        IniRead, ivar_search_radius     , ss_data/config.ini , %current_profile% , search_radius_quickLoot
        IniRead, ivar_shutoff_timer     , ss_data/config.ini , %current_profile% , shutoff_timer_quickLoot
        IniRead, ivar_msg1              , ss_data/config.ini , %current_profile% , msg1_quickMsg1
        IniRead, ivar_msg2              , ss_data/config.ini , %current_profile% , msg1_quickMsg2
        IniRead, ivar_msg3              , ss_data/config.ini , %current_profile% , msg1_quickMsg3
        IniRead, ivar_msg4              , ss_data/config.ini , %current_profile% , msg1_quickMsg4
        IniRead, ivar_offset            , ss_data/config.ini , %current_profile% , bazooka_offset
        IniRead, ivar_chanAt            , ss_data/config.ini , %current_profile% , bazooka_chanAt
        IniRead, ivar_archonAt          , ss_data/config.ini , %current_profile% , bazooka_archonAt
        IniRead, ivar_wepAPS            , ss_data/config.ini , %current_profile% , bazooka_wepAPS
        IniRead, ivar_wepAS             , ss_data/config.ini , %current_profile% , bazooka_wepAS
        IniRead, ivar_asIncrease        , ss_data/config.ini , %current_profile% , bazooka_asIncrease
        IniRead, ivar_bs_extra          , ss_data/config.ini , %current_profile% , boneSpirit_extra
        IniRead, ivar_bs_frame          , ss_data/config.ini , %current_profile% , boneSpirit_frame
        IniRead, ivar_sancState         , ss_data/config.ini , %current_profile% , zmonk_state_sanc
        IniRead, ivar_serenityState     , ss_data/config.ini , %current_profile% , zmonk_state_serenity
        IniRead, ivar_ipState           , ss_data/config.ini , %current_profile% , zbarb_state_ip

        ExitThreadFlag := False
        gui_button_array := []
        ikey_skillL := "LButton"
        ikey_skillR := "RButton"

        if ( img_dir == "ss_data/img/1920x1080/" || img_dir == "ss_data/img/2560x1440/" )
        {  
            ; town
                ; for cube
                fillBookX         := ccx( 949  ) , fillBookY         := ccy( 1108 )
                inventory1X       := ccx( 1908 ) , inventory1Y       := ccy( 783  )
                inventory2X       := ccx( 1971 ) , inventory2Y       := ccy( 784  )
                transButtonX      := ccx( 325  ) , transButtonY      := ccy( 1100 )
                leftArrowBookX    := ccx( 770  ) , leftArrowBookY    := ccy( 1119 )
                rightArrowBookX   := ccx( 1129 ) , rightArrowBookY   := ccy( 1114 )
                wepSlotCubeTopX   := ccx( 124  ) , wepSlotCubeTopY   := ccx( 223  ) , wepSlotCubeBottomX   := ccy( 834 ) , wepSlotCubeBottomY   := ccy( 1022 )
                armorSlotCubeTopX := ccx( 309  ) , armorSlotCubeTopY := ccx( 404  ) , armorSlotCubeBottomX := ccy( 843 ) , armorSlotCubeBottomY := ccy( 1026 )
                ; for fast yellows
                yellowItemX := ccx( 162 ) , yellowItemY := ccy( 1041  )
                yellowBuyX  := ccx( 408 ) , yellowBuyY  := ccy( 1046  )
                ; for fast salvage
                x1fs := ccx( 1878 )   , y1fs := ccy( 752 )   , x2fs := ccx( 1928 )    , y2fs := ccy( 802 )
                whitefs := ccx( 334 ) , bluefs := ccx( 427 ) , yellowfs := ccx( 513 ) , salvagefs := ccx( 220 ) , yfs := ccy( 390 )
                nextItem := ccx( 67 )
                ; for fast repair
                repairX := ccx( 287 ) , repairY := ccy( 778 )
                ; for blood shards & vendors
                outOfBoundsX := ccx( 642 )
                ; for mistic
                clickStatX  := ccx( 304 ) , clickStatY := ccy( 524 )
                mysticRollX := ccx( 342 ) , mysticRollY := ccy( 1046 )
                ; for stash
                stashTabRow   := [ ccx( 151 ) , ccx( 216 ) , ccx( 270 ) , ccy( 243 ) ]
                stashTabColum := [ ccy( 354 ) , ccy( 523 ) , ccy( 690 ) , ccy( 866 ) , ccy( 1027 ) , ccx( 675 ) ]

            ;

            ; bone spirit
                bsCrosshair_counter := 0
                crosshair_isOn := False

                CrosshairWH := ccx( 770 )
                CrosshairXY := CrosshairWH / 2

                topSpiritX   := ccx( 629 )
                topSpiritY   := ccy( 529 )
                bottomMouseX := ccx( 213 )
                bottomMouseY := ccy( 100 )
                topMouseX    := ccx( 270 )
                topMouseY    := ccy( 225 )

                castTopLeftX     := ( A_ScreenWidth  // 2 ) - topSpiritX
                castTopLeftY     := ( A_ScreenHeight // 2 ) - topSpiritY
                castTopRightX    := ( A_ScreenWidth  // 2 ) + topSpiritX
                castTopRightY    := ( A_ScreenHeight // 2 ) - topSpiritY
                castBottomLeftX  := 0
                castBottomLeftY  := A_ScreenHeight 
                castBottomRightX := A_ScreenWidth
                castBottomRightY := A_ScreenHeight

                moveTopLeftX     := ( A_ScreenWidth  // 2 ) - topMouseX
                moveTopLeftY     := ( A_ScreenHeight // 2 ) - topMouseY
                moveTopRightX    := ( A_ScreenWidth  // 2 ) + topMouseX
                moveTopRightY    := ( A_ScreenHeight // 2 ) - topMouseY
                moveBottomLeftX  := ( A_ScreenWidth  // 2 ) - bottomMouseX
                moveBottomLeftY  := ( A_ScreenHeight // 2 ) + bottomMouseY
                moveBottomRightX := ( A_ScreenWidth  // 2 ) + bottomMouseX
                moveBottomRightY := ( A_ScreenHeight // 2 ) + bottomMouseY
            ;

            ; auto loot
                loot_array := [ "imgsaved_lootWhite"     , "imgsaved_lootBlue" , "imgsaved_lootYellow" , "imgsaved_lootGreen"
                            , "imgsaved_lootLegendary" , "imgsaved_lootDB"   , "imgsaved_lootGem" ]

                aspect_ratio_x    := 16   , aspect_ratio_y    := 9
                screen_center_x   := 1280 , screen_center_y   := 675
                click_area_offset := 15

                x1al := ccx( screen_center_x - ( aspect_ratio_x * ivar_search_radius ) )
                y1al := ccy( screen_center_y - ( aspect_ratio_y * ivar_search_radius ) )
                x2al := ccx( screen_center_x + ( aspect_ratio_x * ivar_search_radius ) )
                y2al := ccy( screen_center_y + ( aspect_ratio_y * ivar_search_radius ) )
            ;

            ; quick exit
                quickExitX := ccx( 305 ) , quickExitY := ccy( 638 )
            ;

            ; quick town tp
                minusMapButtonX := ccx( 1195 ) , minusMapButtonY := ccy( 170  )
                act1X           := ccx( 977  ) , act1Y           := ccy( 824  )
                act1homeX       := ccx( 1360 ) , act1homeY       := ccy( 647  )
                act2X           := ccx( 1442 ) , act2Y           := ccy( 685  )
                act2homeX       := ccx( 1376 ) , act2homeY       := ccy( 1044 )
                act3X           := ccx( 944  ) , act3Y           := ccy( 525  )
                act3homeX       := ccx( 683  ) , act3homeY       := ccy( 642  )
                act4X           := ccx( 1933 ) , act4Y           := ccy( 483  )
                act4homeX       := ccx( 694  ) , act4homeY       := ccy( 990  )
                act5X           := ccx( 775  ) , act5Y           := ccy( 728  )
                act5homeX       := ccx( 1551 ) , act5homeY       := ccy( 828  )
            ;
        }

        if ( img_dir == "ss_data/img/3440x1440/" )
        {  
            ; town
                ; for cube
                fillBookX         := 949  , fillBookY         := 1108
                inventory1X       := 2781 , inventory1Y       := 783 
                inventory2X       := 2852 , inventory2Y       := 784 
                transButtonX      := 325  , transButtonY      := 1100
                leftArrowBookX    := 770  , leftArrowBookY    := 1119
                rightArrowBookX   := 1129 , rightArrowBookY   := 1114
                wepSlotCubeTopX   := 124  , wepSlotCubeTopY   := 223  , wepSlotCubeBottomX   := 834 , wepSlotCubeBottomY   := 1022
                armorSlotCubeTopX := 309  , armorSlotCubeTopY := 404  , armorSlotCubeBottomX := 843 , armorSlotCubeBottomY := 1026
                ; for fast yellows
                yellowItemX := 162 , yellowItemY := 1041
                yellowBuyX  := 408 , yellowBuyY  := 1046
                ; for fast salvage
                x1fs     := 2758 , y1fs   := 752 , x2fs     := 2814 , y2fs      := 802
                whitefs  := 334  , bluefs := 427 , yellowfs := 513  , salvagefs := 220 , yfs := 390
                nextItem := 67 
                ; for fast repair
                repairX := 287 , repairY := 778
                ; for blood shards & vendors
                outOfBoundsX := 642
                ; for mistic
                clickStatX  := 304 , clickStatY := 524
                mysticRollX := 342 , mysticRollY := 1046
                ; for stash
                stashTabRow   := [ 151 , 216 , 270 , 243 ]
                stashTabColum := [ 354 , 523 , 690 , 866 , 1027 , 675 ]

            ;

            ; bone spirit
                bsCrosshair_counter := 0
                crosshair_isOn := False

                CrosshairWH := ccx( 770 )
                CrosshairXY := CrosshairWH / 2

                topSpiritX   := ccx( 629 )
                topSpiritY   := ccy( 529 )
                bottomMouseX := ccx( 213 )
                bottomMouseY := ccy( 100 )
                topMouseX    := ccx( 270 )
                topMouseY    := ccy( 225 )

                castTopLeftX     := ( A_ScreenWidth  // 2 ) - topSpiritX
                castTopLeftY     := ( A_ScreenHeight // 2 ) - topSpiritY
                castTopRightX    := ( A_ScreenWidth  // 2 ) + topSpiritX
                castTopRightY    := ( A_ScreenHeight // 2 ) - topSpiritY
                castBottomLeftX  := 0
                castBottomLeftY  := A_ScreenHeight 
                castBottomRightX := A_ScreenWidth
                castBottomRightY := A_ScreenHeight

                moveTopLeftX     := ( A_ScreenWidth  // 2 ) - topMouseX
                moveTopLeftY     := ( A_ScreenHeight // 2 ) - topMouseY
                moveTopRightX    := ( A_ScreenWidth  // 2 ) + topMouseX
                moveTopRightY    := ( A_ScreenHeight // 2 ) - topMouseY
                moveBottomLeftX  := ( A_ScreenWidth  // 2 ) - bottomMouseX
                moveBottomLeftY  := ( A_ScreenHeight // 2 ) + bottomMouseY
                moveBottomRightX := ( A_ScreenWidth  // 2 ) + bottomMouseX
                moveBottomRightY := ( A_ScreenHeight // 2 ) + bottomMouseY
            ;

            ; auto loot
                loot_array := [ "imgsaved_lootWhite"     , "imgsaved_lootBlue" , "imgsaved_lootYellow" , "imgsaved_lootGreen"
                            , "imgsaved_lootLegendary" , "imgsaved_lootDB"   , "imgsaved_lootGem" ]

                aspect_ratio_x    := 20   , aspect_ratio_y    := 9
                screen_center_x   := 1720 , screen_center_y   := 675
                click_area_offset := 15

                x1al := screen_center_x - ( aspect_ratio_x * ivar_search_radius )
                y1al := screen_center_y - ( aspect_ratio_y * ivar_search_radius )
                x2al := screen_center_x + ( aspect_ratio_x * ivar_search_radius )
                y2al := screen_center_y + ( aspect_ratio_y * ivar_search_radius )
            ;

            ; quick exit
                quickExitX := 323 , quickExitY := 641
            ;

            ; quick town tp
                minusMapButtonX := 1634 , minusMapButtonY := 170 
                act1X           := 1420 , act1Y           := 824 
                act1homeX       := 1797 , act1homeY       := 647 
                act2X           := 1888 , act2Y           := 685 
                act2homeX       := 1823 , act2homeY       := 1044
                act3X           := 1380 , act3Y           := 525 
                act3homeX       := 1120 , act3homeY       := 642 
                act4X           := 2373 , act4Y           := 483 
                act4homeX       := 1124 , act4homeY       := 990 
                act5X           := 1216 , act5Y           := 728 
                act5homeX       := 1999 , act5homeY       := 828 
            ;
        }

    }

; =====================================================

; =====================================================
; edit this when adding new stuff to the gui for ini settings like delays and stuff

    update_inIfile_conigValues()
    {
        Global
        Gui, Submit , NoHide
                ; value being writen          ; file name    ; section name        ; key name in section
        IniRead,  i_name                       , ss_data/config.ini   , %current_profile%   , profile_name
        ; profiles  
        IniWrite, %i_name1%                    , ss_data/config.ini   , Profile 1           , profile_name
        IniWrite, %i_name2%                    , ss_data/config.ini   , Profile 2           , profile_name
        IniWrite, %i_name3%                    , ss_data/config.ini   , Profile 3           , profile_name
        IniWrite, %i_name4%                    , ss_data/config.ini   , Profile 4           , profile_name
        IniWrite, %i_name5%                    , ss_data/config.ini   , Profile 5           , profile_name
        IniWrite, %i_name6%                    , ss_data/config.ini   , Profile 6           , profile_name
        IniWrite, %i_name7%                    , ss_data/config.ini   , Profile 7           , profile_name
        IniWrite, %i_name8%                    , ss_data/config.ini   , Profile 8           , profile_name
        IniWrite, %i_name9%                    , ss_data/config.ini   , Profile 9           , profile_name
        ; town config    
        IniWrite, %ivar_cube_delay%            , ss_data/config.ini   , %current_profile%   , cube_delay_town
        IniWrite, %ivar_salvage_delay%         , ss_data/config.ini   , %current_profile%   , salvage_delay_town
        IniWrite, %ivar_stashRow%              , ss_data/config.ini   , %current_profile%   , stashRow
        IniWrite, %ivar_stashColum%            , ss_data/config.ini   , %current_profile%   , stashColum
        IniWrite, %ivar_search_radius%         , ss_data/config.ini   , %current_profile%   , search_radius_quickLoot
        IniWrite, %ivar_shutoff_timer%         , ss_data/config.ini   , %current_profile%   , shutoff_timer_quickLoot
        IniWrite, %ivar_msg1%                  , ss_data/config.ini   , %current_profile%   , msg1_quickMsg1
        IniWrite, %ivar_msg2%                  , ss_data/config.ini   , %current_profile%   , msg1_quickMsg2
        IniWrite, %ivar_msg3%                  , ss_data/config.ini   , %current_profile%   , msg1_quickMsg3
        IniWrite, %ivar_msg4%                  , ss_data/config.ini   , %current_profile%   , msg1_quickMsg4
        ; bazooka config
        IniWrite, %ivar_fm%                    , ss_data/config.ini   , %current_profile%   , bazooka_fm
        IniWrite, %ivar_offset%                , ss_data/config.ini   , %current_profile%   , bazooka_offset
        IniWrite, %ivar_chanAt%                , ss_data/config.ini   , %current_profile%   , bazooka_chanAt
        IniWrite, %ivar_archonAt%              , ss_data/config.ini   , %current_profile%   , bazooka_archonAt
        IniWrite, %ivar_wepAPS%                , ss_data/config.ini   , %current_profile%   , bazooka_wepAPS
        IniWrite, %ivar_wepAS%                 , ss_data/config.ini   , %current_profile%   , bazooka_wepAS
        IniWrite, %ivar_asIncrease%            , ss_data/config.ini   , %current_profile%   , bazooka_asIncrease
        ; keybindings    
        IniWrite, %ikey_skill1%                , ss_data/config.ini   , %current_profile%   , ikey_skill1
        IniWrite, %ikey_skill2%                , ss_data/config.ini   , %current_profile%   , ikey_skill2
        IniWrite, %ikey_skill3%                , ss_data/config.ini   , %current_profile%   , ikey_skill3
        IniWrite, %ikey_skill4%                , ss_data/config.ini   , %current_profile%   , ikey_skill4
        IniWrite, %ikey_force_stand_still%     , ss_data/config.ini   , %current_profile%   , ikey_force_stand_still
        IniWrite, %ikey_force_move%            , ss_data/config.ini   , %current_profile%   , ikey_force_move
        IniWrite, %ikey_potion%                , ss_data/config.ini   , %current_profile%   , ikey_potion
        IniWrite, %ikey_townPortal%            , ss_data/config.ini   , %current_profile%   , ikey_townPortal
    }

; =====================================================

; =====================================================
; edit img coords here   edit imgages saved in to memory here  save img coords and load imgages into vars

    set_images()
    {
        Global 

        if ( img_dir == "ss_data/img/1920x1080/" || img_dir == "ss_data/img/2560x1440/" )
        {
            imgcoord_chat1       := ccx( 33   ) "|" ccy( 1172 ) "|" ccx( 52   ) "|" ccy( 1185 )
            imgcoord_chat2       := ccx( 33   ) "|" ccy( 1391 ) "|" ccx( 52   ) "|" ccy( 1404 )
            imgcoord_chat3       := ccx( 28   ) "|" ccy( 1352 ) "|" ccx( 55   ) "|" ccy( 1377 )
            imgcoord_map         := ccx( 1073 ) "|" ccy( 93   ) "|" ccx( 1093 ) "|" ccy( 102  )
            imgcoord_esc         := ccx( 84   ) "|" ccy( 164  ) "|" ccx( 97   ) "|" ccy( 177  )

            imgcoord_cubePage    := ccx( 970  ) "|" ccy( 1050 ) "|" ccx( 979  ) "|" ccy( 1064 )
            imgcoord_vendorTab   := ccx( 237  ) "|" ccy( 172  ) "|" ccx( 472  ) "|" ccy( 191  )
            imgcoord_vendorTabH  := ccx( 198  ) "|" ccy( 168  ) "|" ccx( 341  ) "|" ccy( 194  )
            imgcoord_shardsOpen  := ccx( 301  ) "|" ccy( 40   ) "|" ccx( 341  ) "|" ccy( 121  )
            imgcoord_inventory   := ccx( 1887 ) "|" ccy( 763  ) "|" ccx( 1917 ) "|" ccy( 792  )
            imgcoord_salvageWarn := ccx( 1220 ) "|" ccy( 245  ) "|" ccx( 1336 ) "|" ccy( 260  )

            imgcoord_skillbar1   := ccx( 835  ) "|" ccy( 1329 ) "|" ccx( 921  ) "|" ccy( 1415 )
            imgcoord_skillbar2   := ccx( 929  ) "|" ccy( 1335 ) "|" ccx( 1006 ) "|" ccy( 1414 )
            imgcoord_skillbar3   := ccx( 1015 ) "|" ccy( 1335 ) "|" ccx( 1097 ) "|" ccy( 1413 )
            imgcoord_skillbar4   := ccx( 1101 ) "|" ccy( 1332 ) "|" ccx( 1186 ) "|" ccy( 1413 )
            imgcoord_skillbarL   := ccx( 1198 ) "|" ccy( 1332 ) "|" ccx( 1277 ) "|" ccy( 1410 )
            imgcoord_skillbarR   := ccx( 1287 ) "|" ccy( 1334 ) "|" ccx( 1363 ) "|" ccy( 1412 )
            imgcoord_skillbarT   := ccx( 850  ) "|" ccy( 1350 ) "|" ccx( 890  ) "|" ccy( 1380 )
            imgcoord_skillbarM   := ccx( 1218 ) "|" ccy( 1354 ) "|" ccx( 1245 ) "|" ccy( 1380 )
            imgcoord_skillbarA   := ccx( 834 )  "|" ccy( 1327 ) "|" ccx( 1367 ) "|" ccy( 1416 )

            imgcoord_townPortal  := ccx( 1147 )  "|" ccy( 428 ) "|" ccx( 1166 ) "|" ccy( 436  )
        }

        if ( img_dir == "ss_data/img/3440x1440/" )
        {
            imgcoord_chat1       := 33   "|" 1172 "|" 52   "|" 1185 
            imgcoord_chat2       := 25   "|" 1383 "|" 1412 "|" 1412 
            imgcoord_chat3       := 25   "|" 1383 "|" 1412 "|" 1412
            imgcoord_map         := 1530 "|" 100  "|" 1555 "|" 125 
            imgcoord_esc         := 84   "|" 164  "|" 97   "|" 177  

            imgcoord_cubePage    := 970  "|" 1050 "|" 979  "|" 1064
            imgcoord_vendorTab   := 237  "|" 172  "|" 472  "|" 191
            imgcoord_vendorTabH  := 198  "|" 168  "|" 341  "|" 194
            imgcoord_shardsOpen  := 301  "|" 40   "|" 341  "|" 121
            imgcoord_inventory   := 2758 "|" 754  "|" 2811 "|" 804
            imgcoord_salvageWarn := 1647 "|" 235  "|" 1784 "|" 264

            imgcoord_skillbar1   := 1275 "|" 1333 "|" 1358 "|" 1415
            imgcoord_skillbar2   := 1368 "|" 1335 "|" 1445 "|" 1412
            imgcoord_skillbar3   := 1456 "|" 1331 "|" 1536 "|" 1416
            imgcoord_skillbar4   := 1546 "|" 1333 "|" 1623 "|" 1415
            imgcoord_skillbarL   := 1634 "|" 1329 "|" 1717 "|" 1413
            imgcoord_skillbarR   := 1331 "|" 1331 "|" 1807 "|" 1412
            imgcoord_skillbarT   := 1295 "|" 1351 "|" 1338 "|" 1381
            imgcoord_skillbarM   := 1655 "|" 1353 "|" 1694 "|" 1380
            imgcoord_skillbarA   := 1277 "|" 1330 "|" 1809 "|" 1414

            imgcoord_townPortal  := 1580 "|" 431 "|" 1600 "|" 439
        }

            ; L = left mouse button
            ; R = right mouse button
            ; T = take picture of skill bar
            ; M = take picture of mouse
            ; A = skill bar all i think?


        imgsaved_chatUp            := Gdip_CreateBitmapFromFile( img_dir "chatUp.png"          )
        imgsaved_chatDown          := Gdip_CreateBitmapFromFile( img_dir "chatDown.png"        )
        imgsaved_map               := Gdip_CreateBitmapFromFile( img_dir "map.png"             )
        imgsaved_esc               := Gdip_CreateBitmapFromFile( img_dir "escmenu.png"         )
        imgsaved_townPortal        := Gdip_CreateBitmapFromFile( img_dir "townPortal.png"      )

        imgsaved_cubePage2         := Gdip_CreateBitmapFromFile( img_dir "cubePage2.png"       )
        imgsaved_cubePage3         := Gdip_CreateBitmapFromFile( img_dir "cubePage3.png"       )
        imgsaved_cubePage6         := Gdip_CreateBitmapFromFile( img_dir "cubePage6.png"       )
        imgsaved_cubePage7         := Gdip_CreateBitmapFromFile( img_dir "cubePage7.png"       )
        imgsaved_cubePage8         := Gdip_CreateBitmapFromFile( img_dir "cubePage8.png"       )
        imgsaved_cubePage9         := Gdip_CreateBitmapFromFile( img_dir "cubePage9.png"       )
        imgsaved_weaponsOpen       := Gdip_CreateBitmapFromFile( img_dir "weaponsOpen.png"     )
        imgsaved_armorOpen         := Gdip_CreateBitmapFromFile( img_dir "armorOpen.png"       )
        imgsaved_gemsOpen          := Gdip_CreateBitmapFromFile( img_dir "gemsOpen.png"        )
        imgsaved_mysticOpen        := Gdip_CreateBitmapFromFile( img_dir "mysticOpen.png"      )
        imgsaved_salvageOpen       := Gdip_CreateBitmapFromFile( img_dir "salvageOpen.png"     )
        imgsaved_repairOpen        := Gdip_CreateBitmapFromFile( img_dir "repairOpen.png"      )
        imgsaved_shardsOpen        := Gdip_CreateBitmapFromFile( img_dir "shardsOpen.png"      )
        imgsaved_vendorOpen        := Gdip_CreateBitmapFromFile( img_dir "vendorOpen.png"      )
        imgsaved_npcSellerWepons   := Gdip_CreateBitmapFromFile( img_dir "npcSellerWepons.png" )
        imgsaved_npcSellerArmor    := Gdip_CreateBitmapFromFile( img_dir "npcSellerArmor.png"  )
        imgsaved_inventory         := Gdip_CreateBitmapFromFile( img_dir "inventorySpace.png"  )
        imgsaved_salvageWarn       := Gdip_CreateBitmapFromFile( img_dir "salvageWarn.png"     )
        imgsaved_stashOpen         := Gdip_CreateBitmapFromFile( img_dir "stashOpen.png"       )

        imgsaved_lootWhite         := Gdip_CreateBitmapFromFile( img_dir "lootWhite.png"       )
        imgsaved_lootBlue          := Gdip_CreateBitmapFromFile( img_dir "lootBlue.png"        )
        imgsaved_lootYellow        := Gdip_CreateBitmapFromFile( img_dir "lootYellow.png"      )
        imgsaved_lootGreen         := Gdip_CreateBitmapFromFile( img_dir "lootGreen.png"       )
        imgsaved_lootLegendary     := Gdip_CreateBitmapFromFile( img_dir "lootLegendary.png"   )
        imgsaved_lootDB            := Gdip_CreateBitmapFromFile( img_dir "lootDB.png"          )
        imgsaved_lootGem           := Gdip_CreateBitmapFromFile( img_dir "lootGem.png"         )

        imgsaved_waveOfForce1      := Gdip_CreateBitmapFromFile( img_dir "waveOfForce1.png"    )
        imgsaved_electrocute1      := Gdip_CreateBitmapFromFile( img_dir "electrocute1.png"    )
        imgsaved_rayOfFrost1       := Gdip_CreateBitmapFromFile( img_dir "rayOfFrost1.png"     )
        imgsaved_archon1           := Gdip_CreateBitmapFromFile( img_dir "archon1.png"         )
        imgsaved_meteor1           := Gdip_CreateBitmapFromFile( img_dir "meteor1.png"         )
        imgsaved_blackhole1        := Gdip_CreateBitmapFromFile( img_dir "blackhole1.png"      )
        imgsaved_frostnova1        := Gdip_CreateBitmapFromFile( img_dir "frostnova1.png"      )
        imgsaved_waveOfForce2      := Gdip_CreateBitmapFromFile( img_dir "waveOfForce2.png"    )
        imgsaved_electrocute2      := Gdip_CreateBitmapFromFile( img_dir "electrocute2.png"    )
        imgsaved_rayOfFrost2       := Gdip_CreateBitmapFromFile( img_dir "rayOfFrost2.png"     )
        imgsaved_archon2           := Gdip_CreateBitmapFromFile( img_dir "archon2.png"         )
        imgsaved_meteor2           := Gdip_CreateBitmapFromFile( img_dir "meteor2.png"         )
        imgsaved_blackhole2        := Gdip_CreateBitmapFromFile( img_dir "blackhole2.png"      )
        imgsaved_frostnova2        := Gdip_CreateBitmapFromFile( img_dir "frostnova2.png"      )
        imgsaved_ablast            := Gdip_CreateBitmapFromFile( img_dir "ablast.png"          )

        imgsaved_warcry1           := Gdip_CreateBitmapFromFile( img_dir "warcry1.png"         )
        imgsaved_falter1           := Gdip_CreateBitmapFromFile( img_dir "falter1.png"         )
        imgsaved_sprint1           := Gdip_CreateBitmapFromFile( img_dir "sprint1.png"         )
        imgsaved_ip1               := Gdip_CreateBitmapFromFile( img_dir "ip1.png"             )
        imgsaved_berserker1        := Gdip_CreateBitmapFromFile( img_dir "berserker1.png"      )
        imgsaved_warcry2           := Gdip_CreateBitmapFromFile( img_dir "warcry2.png"         )
        imgsaved_falter2           := Gdip_CreateBitmapFromFile( img_dir "falter2.png"         )
        imgsaved_sprint2           := Gdip_CreateBitmapFromFile( img_dir "sprint2.png"         )
        imgsaved_ip2               := Gdip_CreateBitmapFromFile( img_dir "ip2.png"             )
        imgsaved_berserker2        := Gdip_CreateBitmapFromFile( img_dir "berserker2.png"      )

        imgsaved_devour1           := Gdip_CreateBitmapFromFile( img_dir "devour1.png"         )
        imgsaved_lod1              := Gdip_CreateBitmapFromFile( img_dir "lod1.png"            )
        imgsaved_boneSpirit1       := Gdip_CreateBitmapFromFile( img_dir "boneSpirit1.png"     )
        imgsaved_devour2           := Gdip_CreateBitmapFromFile( img_dir "devour2.png"         )
        imgsaved_lod2              := Gdip_CreateBitmapFromFile( img_dir "lod2.png"            )
        imgsaved_boneSpirit2       := Gdip_CreateBitmapFromFile( img_dir "boneSpirit2.png"     )

        imgsaved_epiphany1         := Gdip_CreateBitmapFromFile( img_dir "epiphany1.png"       )
        imgsaved_ton1              := Gdip_CreateBitmapFromFile( img_dir "ton1.png"            )
        imgsaved_sanc1             := Gdip_CreateBitmapFromFile( img_dir "sanc1.png"           )
        imgsaved_serenity1         := Gdip_CreateBitmapFromFile( img_dir "serenity1.png"       )
        imgsaved_zephyr1           := Gdip_CreateBitmapFromFile( img_dir "zephyr1.png"         )
        imgsaved_epiphany2         := Gdip_CreateBitmapFromFile( img_dir "epiphany2.png"       )
        imgsaved_ton2              := Gdip_CreateBitmapFromFile( img_dir "ton2.png"            )
        imgsaved_sanc2             := Gdip_CreateBitmapFromFile( img_dir "sanc2.png"           )
        imgsaved_serenity2         := Gdip_CreateBitmapFromFile( img_dir "serenity2.png"       )
        imgsaved_zephyr2           := Gdip_CreateBitmapFromFile( img_dir "zephyr2.png"         )
    }

; =====================================================