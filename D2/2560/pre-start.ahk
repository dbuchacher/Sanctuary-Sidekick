; for main start
file := FileOpen("core\include.ahk", "w")

loop, Files , core\*
{
    String := "#include core\" A_LoopFileName "`r`n"
    file.Write(String)
}

loop, Files , plugins\*
{
    String := "#include plugins\" A_LoopFileName "`r`n"
    file.Write(String)
}

file.Close()
