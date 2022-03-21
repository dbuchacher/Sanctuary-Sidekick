; =====================================================
; defaults

    gui_main_window() ; draw main window
    {
        Global
        ; always
            Gui, Destroy
            custom_gui := new gui_window_main( window_bitmap := gui_window_main_bitmap() )
            Gui, window_main: Font , cE9E9E9 s16  , Arial
            Gui, window_main: Add , Text , x10 y15 BackgroundTrans, Sanctuary Sidekick Settings
            Gui, window_main: Font , cE9E9E9 s8  , Arial
            Gui, window_main: Add , Text , x900 y20 BackgroundTrans, Created By: Massaker (Version 0.9.5)
        ;

        ; buttons
            gui_button_array.Push( new gui_button1( x := 125  , y := 80  , w := 250 , h := 40 , text := "Profile - " i_name    , label := "gui_profile_window"     ) )
            gui_button_array.Push( new gui_button1( x := 125  , y := 120 , w := 250 , h := 40 , text := "Key Bindings"         , label := "gui_keybindings_window" ) )
            gui_button_array.Push( new gui_button1( x := 425  , y := 80  , w := 250 , h := 40 , text := "Town Efficiency"      , label := "gui_town_window"        ) )
            gui_button_array.Push( new gui_button1( x := 425  , y := 120 , w := 250 , h := 40 , text := "Quick Exit"           , label := "gui_quickExit_window"   ) )
            gui_button_array.Push( new gui_button1( x := 425  , y := 160 , w := 250 , h := 40 , text := "Quick Loot"           , label := "gui_quickLoot_window"   ) )
            gui_button_array.Push( new gui_button1( x := 425  , y := 200 , w := 250 , h := 40 , text := "Quick Messages"       , label := "gui_quickMsg_window"    ) )
            gui_button_array.Push( new gui_button1( x := 425  , y := 240 , w := 250 , h := 40 , text := "Town Portal Act 1-5"  , label := "gui_quickTownTP_window" ) )
            gui_button_array.Push( new gui_button1( x := 425  , y := 280 , w := 250 , h := 40 , text := "Stop Key"             , label := "gui_stop_window"        ) )
        ;    gui_button_array.Push( new gui_button1( x := 725  , y := 80  , w := 250 , h := 40 , text := "Bazooka Wizard"       , label := "gui_bazooka_window"     ) )
            gui_button_array.Push( new gui_button1( x := 725  , y := 120 , w := 250 , h := 40 , text := "Lazy Vyr Chantodo"    , label := "gui_vyr_window"         ) )
            gui_button_array.Push( new gui_button1( x := 725  , y := 160 , w := 250 , h := 40 , text := "zBarb"                , label := "gui_zbarb_window"       ) )
            gui_button_array.Push( new gui_button1( x := 725  , y := 200 , w := 250 , h := 40 , text := "Bone Spirit"          , label := "gui_boneSpirit_window"  ) )
            gui_button_array.Push( new gui_button1( x := 725  , y := 240 , w := 250 , h := 40 , text := "zMonk"                , label := "gui_zmonk_window"       ) )
            gui_button_array.Push( new gui_button1( x := 940  , y := 700 , w := 56  , h := 40 , text := "Help"                 , label := "gui_help_window"        ) )
            gui_button_array.Push( new gui_button1( x := 1000 , y := 700 , w := 85  , h := 40 , text := "Minimize"             , label := "gui_kill"               ) )
        ;

        ; titles above buttons
            Gui, window_main: Font , cE9E9E9 s10 bold , Arial
            Gui, window_main: Add , Text , x125 y60 BackgroundTrans, Global Settings
            Gui, window_main: Add , Text , x425 y60 BackgroundTrans, Utility Keys
            Gui, window_main: Add , Text , x725 y60 BackgroundTrans, Class Scripts
            Gui, window_main: Add , Text , x25 y695 BackgroundTrans, Ctrl + Alt + Shift + Windows Key + F11  --  Emergency Exit
            Gui, window_main: Add , Text , x25 y715 BackgroundTrans, Ctrl + Alt + Shift + Windows Key + F12  --  Displays THIS Window
        ;

        custom_gui.draw_window()
    } 

    gui_profile_window() ; draw profile window
    {
        Global

        ; always
            Gui, Destroy
            custom_gui := new gui_window_main( window_bitmap := gui_window_main_bitmap() )
            Gui, window_main: Font , cE9E9E9 s16  , Arial
            Gui, window_main: Add , Text , x10 y15 w900 BackgroundTrans, Profile Settings `t (Current Profile - %i_name%)
            gui_button_array.Push( new gui_button1( x := 1010 , y := 700 , w := 63  , h := 40 , text := "Done"           , label := "gui_main_window"    , , font_x_offset := 12 ) )
            gui_button_array.Push( new gui_button1( x := 20   , y := 535 , w := 185 , h := 40 , text := "Update Names"   , label := "gui_profile_window" , , font_x_offset := 33 ) )

        ;

        ; profile edit boxes
            Gui, window_main: Font , black s10 bold , Arial
            Gui, window_main: Add, Edit, x25 y270 r1 vi_name1 gupdate_inIfile_conigValues w175 , %i_name1%
            Gui, window_main: Add, Edit, x25 y300 r1 vi_name2 gupdate_inIfile_conigValues w175 , %i_name2%
            Gui, window_main: Add, Edit, x25 y330 r1 vi_name3 gupdate_inIfile_conigValues w175 , %i_name3%
            Gui, window_main: Add, Edit, x25 y360 r1 vi_name4 gupdate_inIfile_conigValues w175 , %i_name4%
            Gui, window_main: Add, Edit, x25 y390 r1 vi_name5 gupdate_inIfile_conigValues w175 , %i_name5%
            Gui, window_main: Add, Edit, x25 y420 r1 vi_name6 gupdate_inIfile_conigValues w175 , %i_name6%
            Gui, window_main: Add, Edit, x25 y450 r1 vi_name7 gupdate_inIfile_conigValues w175 , %i_name7%
            Gui, window_main: Add, Edit, x25 y480 r1 vi_name8 gupdate_inIfile_conigValues w175 , %i_name8%
            Gui, window_main: Add, Edit, x25 y510 r1 vi_name9 gupdate_inIfile_conigValues w175 , %i_name9%
        ;

        ; profile list box
            profile_list := "Profile 1|Profile 2|Profile 3|Profile 4|Profile 5|Profile 6|Profile 7|Profile 8|Profile 9"
            Gui, window_main: Font , black s10 bold , Arial
            Gui, window_main: Add, ListBox, x25 y85 AltSubmit w175 r9 vselected_profile gchange_profile, %i_name1%|%i_name2%|%i_name3%|%i_name4%|%i_name5%|%i_name6%|%i_name7%|%i_name8%|%i_name9%|

        ;

        ; main text
            Gui, window_main: Font , cE9E9E9 s10 bold , Arial
            Gui, window_main: Add , Text , x25 y60 BackgroundTrans  , Select Profile
            Gui, window_main: Add , Text , x25 y250 BackgroundTrans , Edit Profile Names Below
            Gui, window_main: Add , Text , x205 y85 BackgroundTrans , Use profile for mulitple hotkey setups if needed. Useful for when switching classes.
        ;

        custom_gui.draw_window()
    }

    gui_keybindings_window() ; draw key bindings window
    {
        Global
        ; always
            Gui, Destroy
            custom_gui := new gui_window_main( windows_bitmap := gui_window_main_bitmap() )
            gui_button_array.Push( new gui_button1( x := 1010 , y := 700 , w := 63 , h := 40 , text := "Done" , label := "gui_main_window" , , font_x_offset := 12 ) )
        ;

        ; edit boxes
            Gui, window_main: Add, Edit, x25 y85  w50 r1 vikey_skill1            gupdate_inIfile_conigValues , %ikey_skill1%
            Gui, window_main: Add, Edit, x25 y110 w50 r1 vikey_skill2            gupdate_inIfile_conigValues , %ikey_skill2%
            Gui, window_main: Add, Edit, x25 y135 w50 r1 vikey_skill3            gupdate_inIfile_conigValues , %ikey_skill3%
            Gui, window_main: Add, Edit, x25 y160 w50 r1 vikey_skill4            gupdate_inIfile_conigValues , %ikey_skill4%
            Gui, window_main: Add, Edit, x25 y185 w50 r1 vikey_force_stand_still gupdate_inIfile_conigValues , %ikey_force_stand_still%
            Gui, window_main: Add, Edit, x25 y210 w50 r1 vikey_force_move        gupdate_inIfile_conigValues , %ikey_force_move%
            Gui, window_main: Add, Edit, x25 y235 w50 r1 vikey_potion            gupdate_inIfile_conigValues , %ikey_potion%
            Gui, window_main: Add, Edit, x25 y260 w50 r1 vikey_townPortal        gupdate_inIfile_conigValues , %ikey_townPortal%
        ;

        ; edit boxes text
            Gui, window_main: Font , cE9E9E9 s16 , Arial
            Gui, window_main: Add , Text , x10 y15 BackgroundTrans, Key Bindings
            Gui, window_main: Font , cE9E9E9 s10 bold , Arial
            Gui, window_main: Add , Text , x25 y63 BackgroundTrans  , Set your keybindings
            Gui, window_main: Add , Text , x85 y88 BackgroundTrans  , Skill Key #1
            Gui, window_main: Add , Text , x85 y113 BackgroundTrans , Skill Key #2
            Gui, window_main: Add , Text , x85 y138 BackgroundTrans , Skill Key #3
            Gui, window_main: Add , Text , x85 y163 BackgroundTrans , Skill Key #4
            Gui, window_main: Add , Text , x85 y188 BackgroundTrans , Force Stand Still
            Gui, window_main: Add , Text , x85 y213 BackgroundTrans , Force Move
            Gui, window_main: Add , Text , x85 y238 BackgroundTrans , Potion
            Gui, window_main: Add , Text , x85 y263 BackgroundTrans , Town Portal
        ;

        custom_gui.draw_window()
    }

    gui_help_window() ; draw help window
    {
        Global
        ; always
            Gui, Destroy
            custom_gui := new gui_window_main( windows_bitmap := gui_window_main_bitmap() )
            gui_button_array.Push( new gui_button1( x := 1010 , y := 700 , w := 63 , h := 40 , text := "Done"  , label := "gui_main_window" , , font_x_offset := 12 ) )
            Gui, window_main: Font , cE9E9E9 s16 , Arial
            Gui, window_main: Add , Text , x10 y15 BackgroundTrans, Help
        ;

        ; main text
            Gui, window_main: Font , cE9E9E9 s10 bold , Arial
            Gui, window_main: Add, Text , x25 y60   BackgroundTrans, General Information - Hotkeys
            Gui, window_main: Add, Text , x25 y80   BackgroundTrans,  `t- Shift + Enter will ALWAYS go to the party chat
            Gui, window_main: Add, Text , x25 y100  BackgroundTrans,  `t- Ctrl + Enter will ALWAYS go to the clan chat
            Gui, window_main: Add, Text , x25 y120  BackgroundTrans,  `t- hotkeys are turned off when...`t|     chat window is open (ENTER)    |     game menu is open (ESCAPE)    |     mini map window is open (TAB)
            Gui, window_main: Add, Text , x25 y140  BackgroundTrans,  `t- Double Tap `t`t`t|     turn a script on by double tapping the key instead of just a single key push
            Gui, window_main: Add, Text , x25 y160  BackgroundTrans,  `t- Also Send Key Pushed `t|     when pressing a hotkey this tells the srcipt to either
            Gui, window_main: Add, Text , x25 y180  BackgroundTrans,  `t`t- A.) run the script AND ALSO send the key that was pushed
            Gui, window_main: Add, Text , x25 y200  BackgroundTrans,  `t`t- B.) run the script BUT DO NOT send the key that was pushed
            Gui, window_main: Add, Text , x25 y240  BackgroundTrans,  General Information - Script Error
            Gui, window_main: Add, Text , x25 y260  BackgroundTrans,  `t- If script gets bugged for some reason delete the ss_data/config.ini file and restart
            Gui, window_main: Add, Text , x25 y280  BackgroundTrans,  `t- <<< WARNING >>> hotkeys will activate while in some game menus (options, create a charater, login screen, etc... )
            Gui, window_main: Add, Text , x25 y300  BackgroundTrans,  `t- <<< WARNING >>> when editing config values it can be werid sometimes and cut off the last input
            Gui, window_main: Add, Text , x25 y320  BackgroundTrans,  `t`t just try pressing enter a few times or backspace then re-enter the last input to help "save" the config value you want
            Gui, window_main: Add, Text , x25 y340  BackgroundTrans,  `t`t i might fix this later... i might not who knows...
        ;

        custom_gui.draw_window()
    }

; =====================================================

; =====================================================
; hotkey setting area

    gui_town_window() ; draw town setting window
    {
        Global 
        current_hk := "town"

        ; always
            Gui, Destroy
            custom_gui := new gui_window_main( windows_bitmap := gui_window_settings_bitmap() )

            ; hotkey area
                Gui, window_main: Add, Hotkey, x30 y68 w150 vihk_%current_hk% gchange_hotkey, % ihk_%current_hk%
                new gui_switch1(x := 200 , y := 70 , w := 145 , state := ihk_state_%current_hk%    , label := "hotkey_state_set" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 70 , w := 125 , state := ihk_dt_state_%current_hk% , label := "hotkey_dt_state"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 70 , w := 225 , state := ihk_sk_state_%current_hk% , label := "hotkey_sk_state"  , text := "Also Send Key Pushed" )
            ;

            gui_button_array.Push( new gui_button1( x := 1010 , y := 700 , w := 63 , h := 40 , text := "Done"  , label := "gui_main_window" , , font_x_offset := 12 ) )
            Gui, window_main: Font , cE9E9E9 s16 , Arial
            Gui, window_main: Add , Text , x10 y15 BackgroundTrans, Town Settings
        ; 


        ; config edit boxes
            Gui, window_main: Font , black s10 , Arial
            Gui, window_main: Add, Edit, x25 y460 w50 r1 vivar_cube_delay gupdate_inIfile_conigValues , %ivar_cube_delay%
            Gui, window_main: Add, Edit, x25 y500 w50 r1 vivar_salvage_delay gupdate_inIfile_conigValues , %ivar_salvage_delay%
            Gui, window_main: Add, Edit, x25 y540 w50 r1 vivar_stashRow gupdate_inIfile_conigValues , %ivar_stashRow%
            Gui, window_main: Add, Edit, x25 y580 w50 r1 vivar_stashColum gupdate_inIfile_conigValues , %ivar_stashColum%
        ;

        ; help text
            Gui, window_main: Font , cE9E9E9 s10 bold , Arial
            Gui, window_main: Add, Text , x25 y115 BackgroundTrans, The Town hotkey is assigned to multiple activities. To stop just press the key again.
            Gui, window_main: Add, Text , x25 y140 BackgroundTrans,  `t- Salvage `t`t|     open salvage tab at blacksmith`t`t`t`t`t`t`t`t`t`t|    press hotkey
            Gui, window_main: Add, Text , x25 y165 BackgroundTrans,  `t- Blood Shards `t|     open kadala`t`t`t`t`t`t|    hover mouse over item type`t`t|    press hotkey
            Gui, window_main: Add, Text , x25 y190 BackgroundTrans,  `t- Mystic Rolling `t|     open enchant tab at mystic`t`t`t`t`t`t`t`t`t`t|    press hotkey
            Gui, window_main: Add, Text , x25 y215 BackgroundTrans,  `t- Repair `t`t|     open repair tab at blacksmith`t`t`t`t`t`t`t`t`t`t|    press hotkey
            Gui, window_main: Add, Text , x25 y240 BackgroundTrans,  `t- Craft Yellows `t`t|     have ARMOR or WEAPONS or JEWELRY tab open`t|    select yellow type`t`t`t`t|    press hotkey
            Gui, window_main: Add, Text , x25 y265 BackgroundTrans,  `t- Cube Page 2,3,7,8,9 `t|    craft 1 SLOT ITEMS`t`t`t`t`t`t|    hover mouse over WEAPON slot in cube`t|    press hotkey
            Gui, window_main: Add, Text , x25 y290 BackgroundTrans,  `t- Cube Page 2,3,7,8,9 `t|    craft 2 SLOT ITEMS`t`t`t`t`t`t|    hover mouse over ARMOR slot in cube`t|    press hotkey
            Gui, window_main: Add, Text , x25 y315 BackgroundTrans,  `t- Cube Page 6 `t`t|    place gems and essence in inventory`t`t`t|    ROWS 1 and 2 COLUMN 1`t`t`t|    press hotkey
            Gui, window_main: Add, Text , x25 y340 BackgroundTrans,  `t- Place into Stash `t|    have items in inventory(usually gems)`t`t`t|    open Stash`t`t`t`t`t|    press hotkey
        ;

        ; config edit box help text
            Gui, window_main: Font , cE9E9E9 s10 bold , Arial
            Gui, window_main: Add , Text , x85 y463 BackgroundTrans  , Cube Delay Speed`t|    adjust how fast script tries to upgrade yellows
            Gui, window_main: Add , Text , x85 y503 BackgroundTrans  , Salvage Delay Speed`t|    adjust how fast script tries to salvage items
            Gui, window_main: Add , Text , x85 y543 BackgroundTrans  , Main Stash Row #`t|    Enter Main Stash Tab Row (use numbers 1 - 3)
            Gui, window_main: Add , Text , x85 y583 BackgroundTrans  , Main Stash Colum #`t|    Enter Main Stash Tab Colum (use numbers 1 - 5)
        ;

        custom_gui.draw_window()
    }

    gui_quickExit_window() ; draw quick exit setting window
    {
        Global
        current_hk := "quickExit"
        ; always
            Gui, Destroy
            custom_gui := new gui_window_main( windows_bitmap := gui_window_settings_bitmap() )

            ; hotkey area
                Gui, window_main: Add, Hotkey, x30 y68 w150 vihk_%current_hk% gchange_hotkey, % ihk_%current_hk%
                new gui_switch1(x := 200 , y := 70 , w := 145 , state := ihk_state_%current_hk%    , label := "hotkey_state_set" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 70 , w := 125 , state := ihk_dt_state_%current_hk% , label := "hotkey_dt_state"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 70 , w := 225 , state := ihk_sk_state_%current_hk% , label := "hotkey_sk_state"  , text := "Also Send Key Pushed" )
            ;

            Gui, window_main: Font , cE9E9E9 s16 , Arial
            Gui, window_main: Add , Text , x10 y15 BackgroundTrans, Quick Exit Settings
            gui_button_array.Push( new gui_button1( x := 1010 , y := 700 , w := 63 , h := 40 , text := "Done"  , label := "gui_main_window" , , font_x_offset := 12 ) )
        ;

        ; help text
            Gui, window_main: Font , cE9E9E9 s10 bold , Arial
            Gui, window_main: Add, Text , x25 y115 BackgroundTrans, Just leaves game faster
        ;

        custom_gui.draw_window()
    }

    gui_quickLoot_window() ; draw quick loot setting window
    {
        Global
        current_hk := "quickLoot"

        ; always
            Gui, Destroy
            custom_gui := new gui_window_main( windows_bitmap := gui_window_settings_bitmap() )

            ; hotkey area
                Gui, window_main: Add, Hotkey, x30 y68 w150 vihk_%current_hk% gchange_hotkey, % ihk_%current_hk%
                new gui_switch1(x := 200 , y := 70 , w := 145 , state := ihk_state_%current_hk%    , label := "hotkey_state_set" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 70 , w := 125 , state := ihk_dt_state_%current_hk% , label := "hotkey_dt_state"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 70 , w := 225 , state := ihk_sk_state_%current_hk% , label := "hotkey_sk_state"  , text := "Also Send Key Pushed" )
            ;

            Gui, window_main: Font , cE9E9E9 s16 , Arial
            Gui, window_main: Add , Text , x10 y15 BackgroundTrans, Quick Loot Settings
            gui_button_array.Push( new gui_button1( x := 1010 , y := 700 , w := 63 , h := 40 , text := "Done"  , label := "gui_main_window" , , font_x_offset := 12 ) )
        ;

        ; config edit boxes
            Gui, window_main: Font , black s10 , Arial
            Gui, window_main: Add, Edit, x25 y460 w50 r1 vivar_shutoff_timer gupdate_inIfile_conigValues , %ivar_shutoff_timer%
            Gui, window_main: Add, Edit, x25 y490 w50 r1 vivar_search_radius gupdate_inIfile_conigValues , %ivar_search_radius%
        ;

        ; help text
            Gui, window_main: Font , cE9E9E9 s10 bold , Arial
            Gui, window_main: Add, Text , x25 y115 BackgroundTrans, This will auto pickup loot that is laying on the ground ( including MOTHER FUCKING DEATH BREATHS )
            Gui, window_main: Add, Text , x25 y135 BackgroundTrans, ESCAPE > OPTIONS > GAMEPLAY > SHOW ICONS FOR DROPPED ITEMS --- NEEDS TO BE ENABLED
            Gui, window_main: Add, Text , x25 y155 BackgroundTrans, Quick loot will be turned off anytime you press the "town efficiency key"
        ;

        ; config edit boxes help text
            Gui, window_main: Add , Text , x85 y463 BackgroundTrans  , Shutoff Timer    |    script will shut off after this many seconds
            Gui, window_main: Add , Text , x85 y493 BackgroundTrans  , Loot Search Area    |    increase or decrease the size of the search area
        ; 

        custom_gui.draw_window()
    }

    gui_quickMsg_window() ; draw quick message setting window
    {
        Global
        current_hk1 := "quickMsg1"
        current_hk2 := "quickMsg2"
        current_hk3 := "quickMsg3"
        current_hk4 := "quickMsg4"
        ; always
            Gui, Destroy
            custom_gui := new gui_window_main( windows_bitmap := gui_window_main_bitmap() )
            Gui, window_main: Font , cE9E9E9 s16 , Arial
            Gui, window_main: Add , Text , x10 y15 BackgroundTrans, Quick Message Settings
            gui_button_array.Push( new gui_button1( x := 1010 , y := 700 , w := 63 , h := 40 , text := "Done"  , label := "gui_main_window" , , font_x_offset := 12 ) )
        
        
        ; messges

            ; msg 1
                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Hotkey, x30 y68 w150 vihk_%current_hk1% gchange_hotkey1, % ihk_%current_hk1%
                new gui_switch1(x := 200 , y := 70 , w := 145 , state := ihk_state_%current_hk1%    , label := "hotkey_state_set1" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 70 , w := 125 , state := ihk_dt_state_%current_hk1% , label := "hotkey_dt_state1"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 70 , w := 225 , state := ihk_sk_state_%current_hk1% , label := "hotkey_sk_state1"  , text := "Also Send Key Pushed" )

                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Edit, x700 y68 w375 r1 vivar_msg1 gupdate_inIfile_conigValues , %ivar_msg1%
            ;

            ; msg 2
                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Hotkey, x30 y118 w150 vihk_%current_hk2% gchange_hotkey2, % ihk_%current_hk2%
                new gui_switch1(x := 200 , y := 120 , w := 145 , state := ihk_state_%current_hk2%    , label := "hotkey_state_set2" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 120 , w := 125 , state := ihk_dt_state_%current_hk2% , label := "hotkey_dt_state2"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 120 , w := 225 , state := ihk_sk_state_%current_hk2% , label := "hotkey_sk_state2"  , text := "Also Send Key Pushed" )

                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Edit, x700 y118 w375 r1 vivar_msg2 gupdate_inIfile_conigValues , %ivar_msg2%
            ;

            ; msg 3
                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Hotkey, x30 y168 w150 vihk_%current_hk3% gchange_hotkey3, % ihk_%current_hk3%
                new gui_switch1(x := 200 , y := 170 , w := 145 , state := ihk_state_%current_hk3%    , label := "hotkey_state_set3" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 170 , w := 125 , state := ihk_dt_state_%current_hk3% , label := "hotkey_dt_state3"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 170 , w := 225 , state := ihk_sk_state_%current_hk3% , label := "hotkey_sk_state3"  , text := "Also Send Key Pushed" )

                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Edit, x700 y168 w375 r1 vivar_msg3 gupdate_inIfile_conigValues , %ivar_msg3%
            ;

            ; msg 4
                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Hotkey, x30 y218 w150 vihk_%current_hk4% gchange_hotkey4, % ihk_%current_hk4%
                new gui_switch1(x := 200 , y := 220 , w := 145 , state := ihk_state_%current_hk4%    , label := "hotkey_state_set4" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 220 , w := 125 , state := ihk_dt_state_%current_hk4% , label := "hotkey_dt_state4"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 220 , w := 225 , state := ihk_sk_state_%current_hk4% , label := "hotkey_sk_state4"  , text := "Also Send Key Pushed" )

                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Edit, x700 y218 w375 r1 vivar_msg4 gupdate_inIfile_conigValues , %ivar_msg4%
            ;

        ; help text
            Gui, window_main: Font , cE9E9E9 s10 bold , Arial
            Gui, window_main: Add, Text , x25 y275 BackgroundTrans, Will send fast chat messages.  Edit the message in the right-hand text box.  NOTE: {enter}{enter} = new line
        ;

        custom_gui.draw_window()
    }

    gui_quickTownTP_window() ; draw quick town tp act 1 - 5  setting window
    {
        Global
        current_hk1 := "quickTownTP1"
        current_hk2 := "quickTownTP2"
        current_hk3 := "quickTownTP3"
        current_hk4 := "quickTownTP4"
        current_hk5 := "quickTownTP5"
        ; always
            Gui, Destroy
            custom_gui := new gui_window_main( windows_bitmap := gui_window_main_bitmap() )
            Gui, window_main: Font , cE9E9E9 s16 , Arial
            Gui, window_main: Add , Text , x10 y15 BackgroundTrans, Quick Town Portal Act 1 - 5 Settings
            gui_button_array.Push( new gui_button1( x := 1010 , y := 700 , w := 63 , h := 40 , text := "Done"  , label := "gui_main_window" , , font_x_offset := 12 ) )
        ;

            ; act 1
                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Hotkey, x30 y68 w150 vihk_%current_hk1% gchange_hotkey1, % ihk_%current_hk1%
                new gui_switch1(x := 200 , y := 70 , w := 145 , state := ihk_state_%current_hk1%    , label := "hotkey_state_set1" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 70 , w := 125 , state := ihk_dt_state_%current_hk1% , label := "hotkey_dt_state1"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 70 , w := 225 , state := ihk_sk_state_%current_hk1% , label := "hotkey_sk_state1"  , text := "Also Send Key Pushed" )
            ;

            ; act 2
                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Hotkey, x30 y118 w150 vihk_%current_hk2% gchange_hotkey2, % ihk_%current_hk2%
                new gui_switch1(x := 200 , y := 120 , w := 145 , state := ihk_state_%current_hk2%    , label := "hotkey_state_set2" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 120 , w := 125 , state := ihk_dt_state_%current_hk2% , label := "hotkey_dt_state2"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 120 , w := 225 , state := ihk_sk_state_%current_hk2% , label := "hotkey_sk_state2"  , text := "Also Send Key Pushed" )
            ;

            ; act 3
                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Hotkey, x30 y168 w150 vihk_%current_hk3% gchange_hotkey3, % ihk_%current_hk3%
                new gui_switch1(x := 200 , y := 170 , w := 145 , state := ihk_state_%current_hk3%    , label := "hotkey_state_set3" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 170 , w := 125 , state := ihk_dt_state_%current_hk3% , label := "hotkey_dt_state3"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 170 , w := 225 , state := ihk_sk_state_%current_hk3% , label := "hotkey_sk_state3"  , text := "Also Send Key Pushed" )
            ;

            ; act 4
                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Hotkey, x30 y218 w150 vihk_%current_hk4% gchange_hotkey4, % ihk_%current_hk4%
                new gui_switch1(x := 200 , y := 220 , w := 145 , state := ihk_state_%current_hk4%    , label := "hotkey_state_set4" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 220 , w := 125 , state := ihk_dt_state_%current_hk4% , label := "hotkey_dt_state4"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 220 , w := 225 , state := ihk_sk_state_%current_hk4% , label := "hotkey_sk_state4"  , text := "Also Send Key Pushed" )
            ;

            ; act 5
                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Hotkey, x30 y268 w150 vihk_%current_hk5% gchange_hotkey5, % ihk_%current_hk5%
                new gui_switch1(x := 200 , y := 270 , w := 145 , state := ihk_state_%current_hk5%    , label := "hotkey_state_set5" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 270 , w := 125 , state := ihk_dt_state_%current_hk5% , label := "hotkey_dt_state5"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 270 , w := 225 , state := ihk_sk_state_%current_hk5% , label := "hotkey_sk_state5"  , text := "Also Send Key Pushed" )
            ;

        ; help text
            Gui, window_main: Font , cE9E9E9 s10 bold , Arial
            Gui, window_main: Add, Text , x25 y315 BackgroundTrans, These will jump to act 1 - 5    |    The Map or the Mini map must be opened first.
        ;

        custom_gui.draw_window()
    }



    gui_stop_window() ; draw stop action setting window
    {
        Global
        current_hk := "stop"
        ; always
            Gui, Destroy
            custom_gui := new gui_window_main( windows_bitmap := gui_window_settings_bitmap() )

            ; hotkey area
                Gui, window_main: Add, Hotkey, x30 y68 w150 vihk_%current_hk% gchange_hotkey, % ihk_%current_hk%
                new gui_switch1(x := 200 , y := 70 , w := 145 , state := ihk_state_%current_hk%    , label := "hotkey_state_set" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 70 , w := 125 , state := ihk_dt_state_%current_hk% , label := "hotkey_dt_state"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 70 , w := 225 , state := ihk_sk_state_%current_hk% , label := "hotkey_sk_state"  , text := "Also Send Key Pushed" )
            ;

            Gui, window_main: Font , cE9E9E9 s16 , Arial
            Gui, window_main: Add , Text , x10 y15 BackgroundTrans, Stop Key Settings
            gui_button_array.Push( new gui_button1( x := 1010 , y := 700 , w := 63 , h := 40 , text := "Done"  , label := "gui_main_window" , , font_x_offset := 12 ) )
        ;

        ; help text
            Gui, window_main: Font , cE9E9E9 s10 bold , Arial
            Gui, window_main: Add, Text , x25 y115 BackgroundTrans, Use this key to stop the current action / script
        ;

        custom_gui.draw_window()
    }

    gui_vyr_window() ; draw lazy vyr setting window
    {
        Global
        current_hk := "vyr"
        ; always
            Gui, Destroy
            custom_gui := new gui_window_main( windows_bitmap := gui_window_settings_bitmap() )

            ; hotkey area
                Gui, window_main: Add, Hotkey, x30 y68 w150 vihk_%current_hk% gchange_hotkey, % ihk_%current_hk%
                new gui_switch1(x := 200 , y := 70 , w := 145 , state := ihk_state_%current_hk%    , label := "hotkey_state_set" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 70 , w := 125 , state := ihk_dt_state_%current_hk% , label := "hotkey_dt_state"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 70 , w := 225 , state := ihk_sk_state_%current_hk% , label := "hotkey_sk_state"  , text := "Also Send Key Pushed" )
            ;

            Gui, window_main: Font , cE9E9E9 s16 , Arial
            Gui, window_main: Add , Text , x10 y15 BackgroundTrans, Lazy Vyr Settings
            gui_button_array.Push( new gui_button1( x := 1010 , y := 700 , w := 63 , h := 40 , text := "Done"  , label := "gui_main_window" , , font_x_offset := 12 ) )
        ;

        ; help text
            Gui, window_main: Font , cE9E9E9 s10 bold , Arial
            Gui, window_main: Add, Text , x25 y115 BackgroundTrans, Toggle On / Off  to eliminate some brain dead key mashing.
        ;

        custom_gui.draw_window()
    }

    gui_zbarb_window() ; draw zbarb setting window
    {
        Global
        current_hk := "zbarb"
        ; always
            Gui, Destroy
            custom_gui := new gui_window_main( windows_bitmap := gui_window_settings_bitmap() )

            ; hotkey area
                Gui, window_main: Add, Hotkey, x30 y68 w150 vihk_%current_hk% gchange_hotkey, % ihk_%current_hk%
                new gui_switch1(x := 200 , y := 70 , w := 145 , state := ihk_state_%current_hk%    , label := "hotkey_state_set" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 70 , w := 125 , state := ihk_dt_state_%current_hk% , label := "hotkey_dt_state"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 70 , w := 225 , state := ihk_sk_state_%current_hk% , label := "hotkey_sk_state"  , text := "Also Send Key Pushed" )
            ;

            Gui, window_main: Font , cE9E9E9 s16 , Arial
            Gui, window_main: Add , Text , x10 y15 BackgroundTrans, Lazy Vyr Settings
            gui_button_array.Push( new gui_button1( x := 1010 , y := 700 , w := 63 , h := 40 , text := "Done"  , label := "gui_main_window" , , font_x_offset := 12 ) )
        ;


        ; config edit boxes
            Gui, window_main: Font , black s10 , Arial
            new gui_switch1(x := 50 , y := 150 , w := 210 , state := ivar_ipState     , label := "ipState"      , text := "Enable IP" )
        ;

        ; help text
            Gui, window_main: Font , cE9E9E9 s10 bold , Arial
            Gui, window_main: Add, Text , x25 y115 BackgroundTrans, Toggle On / Off. presses falter / warcry and sprint
        ;

        custom_gui.draw_window()
    }

    gui_boneSpirit_window() ; draw bone spirit setting window
    {
        Global
        current_hk1 := "boneSpirit"
        current_hk2 := "crosshair"
        current_hk3 := "cross_switcher"
        current_hk4 := "loop_townPortal"
        ; always
            Gui, Destroy
            custom_gui := new gui_window_main( windows_bitmap := gui_window_main_bitmap() )
            Gui, window_main: Font , cE9E9E9 s16 , Arial
            Gui, window_main: Add , Text , x10 y15 BackgroundTrans, Bone Spirit Settings
            gui_button_array.Push( new gui_button1( x := 1010 , y := 700 , w := 63 , h := 40 , text := "Done"  , label := "gui_main_window" , , font_x_offset := 12 ) )
        
        
        ; hotkeys

            ; bone spirit
                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Hotkey, x30 y68 w150 vihk_%current_hk1% gchange_hotkey1, % ihk_%current_hk1%
                new gui_switch1(x := 200 , y := 70 , w := 145 , state := ihk_state_%current_hk1%    , label := "hotkey_state_set1" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 70 , w := 125 , state := ihk_dt_state_%current_hk1% , label := "hotkey_dt_state1"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 70 , w := 225 , state := ihk_sk_state_%current_hk1% , label := "hotkey_sk_state1"  , text := "Also Send Key Pushed" )
            ;

            ; cross hair
                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Hotkey, x30 y288 w150 vihk_%current_hk2% gchange_hotkey2, % ihk_%current_hk2%
                new gui_switch1(x := 200 , y := 290 , w := 300 , state := ihk_state_%current_hk2%    , label := "hotkey_state_set2" , text := "Show Crosshair When Map is Open" )
                new gui_switch1(x := 515 , y := 290 , w := 125 , state := ihk_dt_state_%current_hk2% , label := "hotkey_dt_state2"  , text := "Double Tab" )
                new gui_switch1(x := 645 , y := 290 , w := 225 , state := ihk_sk_state_%current_hk2% , label := "hotkey_sk_state2"  , text := "Also Send Key Pushed" )
            ;

            ; cross hair switcher
                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Hotkey, x30 y398 w150 vihk_%current_hk3% gchange_hotkey3, % ihk_%current_hk3%
                new gui_switch1(x := 200 , y := 400 , w := 145 , state := ihk_state_%current_hk3%    , label := "hotkey_state_set3" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 400 , w := 125 , state := ihk_dt_state_%current_hk3% , label := "hotkey_dt_state3"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 400 , w := 225 , state := ihk_sk_state_%current_hk3% , label := "hotkey_sk_state3"  , text := "Also Send Key Pushed" )
            ;

            ; cross hair switcher
                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Hotkey, x30 y573 w150 vihk_%current_hk4% gchange_hotkey4, % ihk_%current_hk4%
                new gui_switch1(x := 200 , y := 575 , w := 145 , state := ihk_state_%current_hk4%    , label := "hotkey_state_set4" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 575 , w := 125 , state := ihk_dt_state_%current_hk4% , label := "hotkey_dt_state4"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 575 , w := 225 , state := ihk_sk_state_%current_hk4% , label := "hotkey_sk_state4"  , text := "Also Send Key Pushed" )
            ;

        ; config edit boxes
            Gui, window_main: Font , black s10 , Arial
            Gui, window_main: Add, Edit, x50 y150 w50 r1 vivar_offset gupdate_inIfile_conigValues , %ivar_bs_frame%
            new gui_switch1(x := 50 , y := 200 , w := 158 , state := ivar_bs_extra , label := "bs_extra"  , text := "(Faster Casting)" )
        ;

        ; help text
            Gui, window_main: Font , cE9E9E9 s10 bold , Arial
            Gui, window_main: Add, Text , x40 y115 BackgroundTrans,  This will start casting bone spirit. It starts to cast in the direction of your mouse cursors current location (at the time of pressing the hotkey).
            Gui, window_main: Add, Text , x105 y153 BackgroundTrans,  Enter the breakpoint (in frames) of Grim Scythe here (can use d3 planner.com)
            Gui, window_main: Add, Text , x210 y203 BackgroundTrans,  Enable = more spirits but they will be spread apart more.  Disable = less spirits but in a tighter ball
            Gui, window_main: Add, Text , x40 y233 BackgroundTrans,  To stop - press the universal "Stop Key" set in the utility settings list
            Gui, window_main: Add, Text , x40 y330 BackgroundTrans,  Enable this to show the cross hair everytime you open up mini map 
            Gui, window_main: Add, Text , x40 y350 BackgroundTrans,  Pressing this hotkey will move the crosshair while the map is open
            Gui, window_main: Add, Text , x40 y440 BackgroundTrans,  This hotkey will switch crosshair between modes ... (use while crosshair is active)
            Gui, window_main: Add, Text , x40 y460 BackgroundTrans,  `t poison 0
            Gui, window_main: Add, Text , x40 y480 BackgroundTrans,  `t poison 2
            Gui, window_main: Add, Text , x40 y500 BackgroundTrans,  `t cold 0
            Gui, window_main: Add, Text , x40 y520 BackgroundTrans,  To help aid in timing the shot better.  (the colors represent the coe cycle)
            Gui, window_main: Add, Text , x40 y540 BackgroundTrans,  By default this hotkey is WheelUp (even thought it doesn't show anything in the hotkey box)
            Gui, window_main: Add, Text , x40 y615 BackgroundTrans,  Toggle On / Off Teleport loop (used with homing pads shoulders)
        ;

        custom_gui.draw_window()
    }

    gui_zmonk_window() ; draw zmonk setting window
    {
        Global
        current_hk1 := "zmonk"

        ; always
            Gui, Destroy
            custom_gui := new gui_window_main( windows_bitmap := gui_window_main_bitmap() )
            Gui, window_main: Font , cE9E9E9 s16 , Arial
            Gui, window_main: Add , Text , x10 y15 BackgroundTrans, zMonk Settings
            gui_button_array.Push( new gui_button1( x := 1010 , y := 700 , w := 63 , h := 40 , text := "Done"  , label := "gui_main_window" , , font_x_offset := 12 ) )
        
        
        ; hotkeys

            ; zmonk
                Gui, window_main: Font , black s10 , Arial
                Gui, window_main: Add, Hotkey, x30 y68 w150 vihk_%current_hk1% gchange_hotkey1, % ihk_%current_hk1%
                new gui_switch1(x := 200 , y := 70 , w := 145 , state := ihk_state_%current_hk1%    , label := "hotkey_state_set1" , text := "Enable Hotkey" )
                new gui_switch1(x := 350 , y := 70 , w := 125 , state := ihk_dt_state_%current_hk1% , label := "hotkey_dt_state1"  , text := "Double Tab" )
                new gui_switch1(x := 480 , y := 70 , w := 225 , state := ihk_sk_state_%current_hk1% , label := "hotkey_sk_state1"  , text := "Also Send Key Pushed" )
            ;

        ; config edit boxes
            Gui, window_main: Font , black s10 , Arial
            new gui_switch1(x := 50 , y := 150 , w := 210 , state := ivar_sancState     , label := "sancState"      , text := "Enable Inner Sanctuary" )
            new gui_switch1(x := 50 , y := 190 , w := 158 , state := ivar_serenityState , label := "serenityState"  , text := "Enable Serenity" )
        ;

        ; help text
            Gui, window_main: Font , cE9E9E9 s10 bold , Arial
            Gui, window_main: Add, Text , x40 y110 BackgroundTrans,   Toggle script On / Off with the above hotkey
            Gui, window_main: Add, Text , x40 y300 BackgroundTrans,   Note: Time of Need spam is slower while walking then when force stand still is pressed Time of Need spam is faster.
            Gui, window_main: Add, Text , x40 y320 BackgroundTrans,   Note: Sanc is only laid down if force stand still is being held
            Gui, window_main: Add, Text , x218 y185 BackgroundTrans,   (Disabled is probably better since you can time it when wiz is coming out
            Gui, window_main: Add, Text , x218 y200 BackgroundTrans,   of archon and before meteor. However you can enable it if you are lazy)

        ;

        custom_gui.draw_window()
    }

; =====================================================

; =====================================================
; buttons - hover function

    activate_button_hover()
    {
        global gui_button_array

        static Hover_On, Index
        MouseGetPos, , , , ctrl , 2
        If( ! Hover_On && ctrl )
        {
            Loop, % gui_button_array.Length()
            {
                If( ctrl = gui_button_array[A_Index].Hwnd )
                {
                    gui_button_array[A_Index].draw_mouseHover_on()
                    Hover_On := 1
                    Index := A_Index
                    break
                }
            }
        }
        Else If ( Hover_On )
            If( ctrl != gui_button_array[Index].Hwnd )
            {
                gui_button_array[Index].draw_mouseHover_off()
                Hover_On := 0
            }
    }

; =====================================================

; =====================================================
; Classes

    class gui_button1 ; default button class
    {
        __New(x                := 10
            , y                := 10
            , w                := 100
            , h                := 30
            , text             := "Button"
            , label            := ""
            , window           := "window_main"
            , font_x_offset    := 10
            , font_y_offset    := 12
            , font_color       := "E9E9E9"
            , font_type        := "Arial"
            , font_size        := "15"
            , background_color := "2A2A2A"
            , mouse_off_color  := "404040"
            , mouse_on_color   := "6A6A6A")
        {
            this.x                := x
            this.y                := y
            this.w                := w
            this.h                := h
            this.window           := window
            this.label            := label
            this.text             := text
            this.font_x_offset    := font_x_offset
            this.font_y_offset    := font_y_offset
            this.font_color       := "0xFF" font_color
            this.font_type        := font_type
            this.font_size        := font_size
            this.font_align       := font_align
            this.background_color := "0xFF" background_color
            this.mouse_off_color  := "0xFF" mouse_off_color
            this.mouse_on_color   := "0xFF" mouse_on_color
        
            this.always_run()

            this.create_mouseHover_off()
            this.create_mouseHover_on()
            this.create_mouseClick()

            this.draw_mouseHover_off()
        }

        always_run()
        {
            Gui, % this.window ": Add" , Picture , % "x" this.x " y" this.y " w" this.w " h" this.h " hwndhwnd 0xE"
            this.hwnd := hwnd
            bind_picture_control := this.draw_mouseClick.Bind(this)
            GuiControl, +G , % this.hwnd , % bind_picture_control
            If(this.Label)
                ( IsFunc( this.label ) ) ? ( this.function := Func( this.label ) , this.type := "function" )
        }

        draw_mouseHover_off()
        {
            SetImage(this.hwnd, this.create_mouseHover_off)
        }

        draw_mouseHover_on()
        {
            SetImage(this.hwnd, this.create_mouseHover_on)
        }

        draw_mouseClick()
        {
            SetTimer, activate_button_hover , Off
            SetImage( this.hwnd, this.create_mouseClick )
            While( GetKeyState( "LButton" ) )
                Sleep, 10
            SetTimer, activate_button_hover , On
            MouseGetPos, , , , ctrl , 2
            If( ctrl = this.Hwnd )
            {
                this.Draw_Hover()
                If( this.type = "function" )
                    this.function.call()
                Else If( this.type := "label" )
                    gosub, % this.label
            }
            Else
                this.draw_mouseHover_off()
        }

        create_mouseHover_off()
        {
            pBitmap:=Gdip_CreateBitmap( this.w , this.h ) 
            G := Gdip_GraphicsFromImage( pBitmap )
            Gdip_SetSmoothingMode( G , 4 )
            Brush := Gdip_BrushCreateSolid( this.background_color )
            Gdip_FillRectangle( G , Brush , -1 , -1 , this.w + 1 , this.h + 1 )
            Gdip_DeleteBrush( Brush )
            Brush := Gdip_BrushCreateSolid( this.mouse_off_color )
            Gdip_FillRoundedRectangle( G , Brush , 5 , 5 , this.w - 10 , this.h - 10 , 5 )
            Gdip_DeleteBrush( Brush )
            Brush := Gdip_BrushCreateSolid( this.font_color )
            Gdip_TextToGraphics( G , this.text , "s" this.font_size " " this.font_align "c" Brush "x" this.font_x_offset "y" this.font_y_offset , this.font_type , this.w - 10 , this.h - 10 )
            Gdip_DeleteBrush( Brush )
            Gdip_DeleteGraphics( G )
            this.create_mouseHover_off:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
            Gdip_DisposeImage(pBitmap)
        }

        create_mouseHover_on()
        {
            pBitmap:=Gdip_CreateBitmap( this.w , this.h ) 
            G := Gdip_GraphicsFromImage( pBitmap )
            Gdip_SetSmoothingMode( G , 4 )
            Brush := Gdip_BrushCreateSolid( this.background_color )
            Gdip_FillRectangle( G , Brush , -1 , -1 , this.w + 1 , this.h + 1 )
            Gdip_DeleteBrush( Brush )
            Brush := Gdip_BrushCreateSolid( this.mouse_on_color )
            Gdip_FillRoundedRectangle( G , Brush , 5 , 5 , this.w - 10 , this.h - 10 , 5 )
            Gdip_DeleteBrush( Brush )
            Brush := Gdip_BrushCreateSolid( this.font_color )
            Gdip_TextToGraphics( G , this.text , "s" this.font_size " " this.font_align "c" Brush "x" this.font_x_offset "y" this.font_y_offset , this.font_type , this.w - 10 , this.h - 10 )
            Gdip_DeleteBrush( Brush )
            Gdip_DeleteGraphics( G )
            this.create_mouseHover_on:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
            Gdip_DisposeImage(pBitmap)
        }

        create_mouseClick()
        {
            pBitmap:=Gdip_CreateBitmap( this.w , this.h ) 
            G := Gdip_GraphicsFromImage( pBitmap )
            Gdip_SetSmoothingMode( G , 4 )
            Brush := Gdip_BrushCreateSolid( this.background_color )
            Gdip_FillRectangle( G , Brush , -1 , -1 , this.w + 1 , this.h + 1 )
            Gdip_DeleteBrush( Brush )
            Brush := Gdip_BrushCreateSolid( this.mouse_off_color )
            Gdip_FillRoundedRectangle( G , Brush , 5 , 5 , this.w - 10 , this.h - 10 , 5 )
            Gdip_DeleteBrush( Brush )
            Brush := Gdip_BrushCreateSolid( this.font_color )
            Gdip_TextToGraphics( G , this.text , "s" this.font_size " " this.font_align "c" Brush "x" this.font_x_offset "y" this.font_y_offset , this.font_type , this.w - 10 , this.h - 10 )
            Gdip_DeleteBrush( Brush )
            Gdip_DeleteGraphics( G )
            this.create_mouseClick:=Gdip_CreateHBITMAPFromBitmap(pBitmap)
            Gdip_DisposeImage(pBitmap)
        }
    }

    class gui_switch1 ; switch class
    {
        __New(x                := ""
            , y                := ""
            , w                := 300
            , state            := 0
            , label            := ""
            , text             := "Switch"
            , font             := "Arial"
            , font_size        := "15 Bold"
            , font_color       := "E9E9E9"
            , background_color := "2A2A2A"
            , window           := "window_main")
        {
            this.state            := state
            this.x                := x
            this.y                := y
            this.w                := w
            this.h                := 21
            this.text             := text
            this.font             := font
            this.font_size        := font_size
            this.font_color       := "0xFF" font_color
            this.background_color := "0xFF" background_color
            this.window           := window
            this.Label            := Label


            this.create_off_bitmap()
            this.create_on_bitmap()
            this.always_run()

            If( this.State )
                this.draw_on()
            Else
                this.draw_off()
        }
        always_run()
        {
            Gui , % this.window ": Add" , Picture , % "x" this.x " y" this.y " w" this.w " h" this.h " 0xE hwndhwnd"
            this.hwnd := hwnd
            BD := this.switch_state.BIND( this ) 
            GUICONTROL +G , % this.hwnd , % BD
        }
        create_off_bitmap()
        {
            pBitmap:=Gdip_CreateBitmap( this.w , 21 ) 
            G := Gdip_GraphicsFromImage( pBitmap )
            Gdip_SetSmoothingMode( G , 2 )
            Brush := Gdip_BrushCreateSolid( this.background_color )
            Gdip_FillRectangle( G , Brush , -1 , -1 , this.w+2 , 23 )
            Gdip_DeleteBrush( Brush )
            Pen := Gdip_CreatePen( "0xFF44474A" , 1 )
            Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 14 , 5 )
            Gdip_DeletePen( Pen )
            Pen := Gdip_CreatePen( "0xFF1B1D1E" , 1 )
            Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 13 , 5 )
            Gdip_DeletePen( Pen )
            Brush := Gdip_BrushCreateSolid( "0xFF262827" )
            Gdip_FillRoundedRectangle( G , Brush , 1 , 2 , 26 , 13 , 5 )
            Gdip_DeleteBrush( Brush )
            Brush := Gdip_BrushCreateSolid( "0xFF303334" )
            Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , 24 , 11 , 5 )
            Gdip_DeleteBrush( Brush )
            Brush := Gdip_BrushCreateSolid( "0x8827282B" )
            Gdip_FillEllipse( G , Brush , 0 , 0 , 18 , 18 )
            Gdip_DeleteBrush( Brush )
            Brush := Gdip_BrushCreateSolid( "0xFF1A1C1F" )
            Gdip_FillEllipse( G , Brush , 0 , 0 , 17 , 17 )
            Gdip_DeleteBrush( Brush )
            Brush := Gdip_CreateLineBrushFromRect( 3 , 2 , 11 , 14 , "0xFF60646A" , "0xFF393B3F" , 1 , 1 )
            Gdip_FillEllipse( G , Brush , 1 , 1 , 15 , 15 )
            Gdip_DeleteBrush( Brush )
            Brush := Gdip_CreateLineBrushFromRect( 5 , 3 , 10 , 12 , "0xFF4D5055" , "0xFF36383B" , 1 , 1 )
            Gdip_FillEllipse( G , Brush , 2 , 2 , 13 , 13 )
            Gdip_DeleteBrush( Brush )
            ;Adding text
            ;-------------------------------------------------------------
            Brush := Gdip_BrushCreateSolid( this.font_color )
            Gdip_textToGraphics( G , this.text , "s" this.font_size " vCenter c" Brush " x33 y0" , this.font , this.w-33, this.h )
            Gdip_DeleteBrush( Brush )
            ;-------------------------------------------------------------
            Gdip_DeleteGraphics( G )
            this.Off_Bitmap := Gdip_CreatehBITMAPFromBitmap(pBitmap)
            Gdip_DisposeImage(pBitmap)
        }
        create_on_bitmap()
        {
            pBitmap:=Gdip_CreateBitmap( this.w , 21 ) 
            G := Gdip_GraphicsFromImage( pBitmap )
            Gdip_SetSmoothingMode( G , 2 )
            Brush := Gdip_BrushCreateSolid( this.background_color )
            Gdip_FillRectangle( G , Brush , -1 , -1 , this.w+2 , 23 )
            Gdip_DeleteBrush( Brush )
            Pen := Gdip_CreatePen( "0xFF44474A" , 1 )
            Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 14 , 5 )
            Gdip_DeletePen( Pen )
            Pen := Gdip_CreatePen( "0xFF1B1D1E" , 1 )
            Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 13 , 5 )
            Gdip_DeletePen( Pen )
            ;------------------------------------------------------------------
            ;On Background Colors
            Brush := Gdip_BrushCreateSolid( "0xFF7E0000" )
            Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , 25 , 11 , 5 )
            Gdip_DeleteBrush( Brush )
            Brush := Gdip_BrushCreateSolid( "0xFF8F0000" )
            ;--------------------------------------------------------------------
            Gdip_FillRoundedRectangle( G , Brush , 2 , 5 , 23 , 9 , 4 )
            Gdip_DeleteBrush( Brush )
            Brush := Gdip_BrushCreateSolid( "0x8827282B" )
            Gdip_FillEllipse( G , Brush , 11 , 0 , 18 , 18 )
            Gdip_DeleteBrush( Brush )
            Brush := Gdip_BrushCreateSolid( "0xFF1A1C1F" )
            Gdip_FillEllipse( G , Brush , 11 , 0 , 17 , 17 )
            Gdip_DeleteBrush( Brush )
            Brush := Gdip_CreateLineBrushFromRect( 3 , 2 , 11 , 14 , "0xFF60646A" , "0xFF393B3F" , 1 , 1 )
            Gdip_FillEllipse( G , Brush , 12 , 1 , 15 , 15 )
            Gdip_DeleteBrush( Brush )
            Brush := Gdip_CreateLineBrushFromRect( 5 , 3 , 10 , 12 , "0xFF4D5055" , "0xFF36383B" , 1 , 1 )
            Gdip_FillEllipse( G , Brush , 13 , 2 , 13 , 13 )
            Gdip_DeleteBrush( Brush )
            ;Adding text
            ;-------------------------------------------------------------
            Brush := Gdip_BrushCreateSolid( this.font_color )
            Gdip_textToGraphics( G , this.text , "s" this.font_size " vCenter c" Brush " x33 y0" , this.font , this.w-33, this.h )
            Gdip_DeleteBrush( Brush )
            ;-------------------------------------------------------------
            Gdip_DeleteGraphics( G )
            this.On_Bitmap := Gdip_CreatehBITMAPFromBitmap(pBitmap)
            Gdip_DisposeImage(pBitmap)
        }

        switch_state()
        {
            ( this.state := !this.state ) ? ( this.draw_on() ) : ( this.draw_off() )
            If( this.label )    
                this.label(this.state)
        }
        draw_off()
        {
            SetImage( this.hwnd , this.Off_Bitmap )
        }
        draw_on()
        {
            SetImage( this.hwnd , this.On_Bitmap )
        }
    }

    Class gui_window_main  ; main window class
    {
        __New(window_bitmap := ""
            , x             := ""
            , y             := ""
            , w             := 1100
            , h             := 750 
            , window        := "window_main"
            , title         := "Sanctuary Sidekick"
            , options       := "+AlwaysOnTop -Caption -DPIScale OwnDialogs")
            {
                this.x             := x
                this.y             := y
                this.w             := w
                this.h             := h
                this.window        := window
                this.Title         := title
                this.Options       := options
                this.window_bitmap := window_bitmap

                this.create_window()
            }
        create_window()
        {
            Gui, % this.window ":New" , %  this.options " +LastFound"
            this.hwnd := WinExist()
            If( this.window_bitmap )
                this.draw_window_bitmap()
        }
        draw_window_bitmap()
        {
            this.Bitmap := Gdip_CreateHBITMAPFromBitmap( this.window_bitmap )
            Gdip_DisposeImage( this.window_bitmap )
            Gui, % this.window ":Add" , Picture , % "x0 y0 w" this.w " h" this.h " 0xE"
            GuiControlGet, hwnd , % this.window ":hwnd" , Static1
            this.background_hwnd := hwnd
            SetImage(this.background_hwnd , this.Bitmap)
        }
        draw_window()
        {
            If( this.x && this.y )
                Gui, % this.window ":Show" , % "x" this.x " y" this.y " w" this.w " h" this.h , % this.Title
            Else If( this.x && !this.y )
                Gui, % this.window ":Show", % "x" this.x  " w" this.w " h" this.h , % this.title
            Else If( !this.x && this.y )
                Gui, % this.window ":Show" , % "y" this.y  " w" this.w " h" this.h , % this.Title
            Else
                Gui, % this.window ":Show" , % " w" this.w " h" this.h , % this.Title
        }
    }

    gui_window_main_bitmap() ; main layout
    {
        pBitmap:=Gdip_CreateBitmap( 1100 , 750 ) 
        G := Gdip_GraphicsFromImage( pBitmap )
        Gdip_SetSmoothingMode( G , 0 )
        Brush := Gdip_BrushCreateSolid( "0xFF2A2A2A" )
        Gdip_FillRectangle( G , Brush , 0 , 0 , 1100 , 750 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFF1F1F1F" )
        Gdip_FillRectangle( G , Brush , 0 , 0 , 1100 , 50 )
        Gdip_DeleteBrush( Brush )
        Pen := Gdip_CreatePen( "0xFF1C1C1C" , 1 )
        Gdip_DrawLine( G , Pen , 0 , 50 , 1100 , 50 )
        Gdip_DeletePen( Pen )
        Pen := Gdip_CreatePen( "0xFF2B2B2B" , 1 )
        Gdip_DrawRectangle( G , Pen , 0 , 0 , 1099 , 749 )
        Gdip_DeletePen( Pen )
        Gdip_DeleteGraphics( G )
        Return pBitmap
    }

    gui_window_settings_bitmap() ; settings layout
    {
        pBitmap:=Gdip_CreateBitmap( 1100 , 750 ) 
        G := Gdip_GraphicsFromImage( pBitmap )
        Gdip_SetSmoothingMode( G , 0 )
        Brush := Gdip_BrushCreateSolid( "0xFF2A2A2A" )
        Gdip_FillRectangle( G , Brush , 0 , 0 , 1100 , 750 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFF1F1F1F" )
        Gdip_FillRectangle( G , Brush , 0 , 0 , 1100 , 50 )
        Gdip_DeleteBrush( Brush )
        Pen := Gdip_CreatePen( "0xFF1C1C1C" , 1 )
        Gdip_DrawLine( G , Pen , 0 , 50 , 1100 , 50 )
        Gdip_DeletePen( Pen )
        Pen := Gdip_CreatePen( "0xFF404040" , 1 )
        Gdip_DrawRectangle( G , Pen , 0 , 0 , 1099 , 749 )
        Gdip_DeletePen( Pen )
        Pen := Gdip_CreatePen( "0xFF3F3F3F" , 1 )
        Gdip_DrawLine( G , Pen , 25 , 100 , 1075 , 100 )
        Gdip_DeletePen( Pen )
        Pen := Gdip_CreatePen( "0xFF3F3F3F" , 1 )
        Gdip_DrawLine( G , Pen , 25 , 450 , 1075 , 450 )
        Gdip_DeletePen( Pen )
        Gdip_DeleteGraphics( G )
        Return pBitmap
    }

; =====================================================

; =====================================================
; kill gui window

    gui_kill()
    {
        Global
        
        set_variables()
        ez_create_new_script(current_profile)
        check_skillKeys()
        Gui, Destroy
    }

; =====================================================
