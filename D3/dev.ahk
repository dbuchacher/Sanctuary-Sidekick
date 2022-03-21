; ============================================================================================
; find out the amount of time commands take to run
; ============================================================================================
measureTime()
{   
Global
DllCall("QueryPerformanceFrequency", "Int64*", freqXXX)
DllCall("QueryPerformanceCounter", "Int64*", CounterBeforeXXX)

; sendinput, {LButton}
; sleep(frames(19))

; sendinput, {rbutton down}
; loop, 3
; {
;     sleep(frames(10))
;     sendinput, {space}
    
; }
; sendinput, {rbutton up}

check_skillKeys()


DllCall("QueryPerformanceCounter"      , "Int64*", CounterAfterXXX)  
ms := ((CounterAfterXXX - CounterBeforeXXX) / freqXXX * 1000)
framess := ms / (1000/60)
ToolTip, ms: %ms%   frames: %framess% first %aaaa% scecond  %bbbb%
}

/*

*/
; ============================================================================================
; run random code here
; ============================================================================================
randomTest()
{   
Global 

    listOfSkills := "warcry|falter|sprint|ip"

    counter := 1
    while (counter < 5)
    {

        Loop, Parse, listOfSkills , | 
        {
            If ( checkImage( imgsaved_%A_LoopField%1 , imgcoord_skillbar%counter% , 100 ) && skillKey_%A_LoopField% != ikey_skill%counter% )
                skillKey_%A_LoopField% := ikey_skill%counter%
        }
        counter += 1
    }

    Loop, Parse, listOfSkills , | 
    {
        If ( checkImage( imgsaved_%A_LoopField%1 , imgcoord_skillbarL , 100 ) && skillKey_%A_LoopField% != ikey_skillL )
            skillKey_%A_LoopField% := ikey_skillL
    }

    Loop, Parse, listOfSkills , | 
    {
        If ( checkImage( imgsaved_%A_LoopField%1 , imgcoord_skillbarR , 100 ) && skillKey_%A_LoopField% != ikey_skillR )
            skillKey_%A_LoopField% := ikey_skillR
    }



}
/*

ez_img( "inventorySpace"  , imgcoord_inventory   )


*/

test123()
{
    msgbox, fuck ya
}