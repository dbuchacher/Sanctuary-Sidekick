runTest2(){   
Global
DllCall("QueryPerformanceFrequency", "Int64*", freqXXX)
DllCall("QueryPerformanceCounter", "Int64*", CounterBeforeXXX)




statusSet()




DllCall("QueryPerformanceCounter"      , "Int64*", CounterAfterXXX)  
ms := ((CounterAfterXXX - CounterBeforeXXX) / freqXXX * 1000)
ToolTip, ms= %ms%


} ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



