#MaxThreadsPerHotkey 3
Del::  ; Hotkey para começar o script
#MaxThreadsPerHotkey 1

if KeepWinZRunning  ; This means an underlying thread is already running the loop below.
{
    KeepWinZRunning := false  ; Signal that thread's loop to stop.
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
; Otherwise:
KeepWinZRunning := true
Loop
{
	ControlSend, ahk_parent, {f1} , ahk_exe client.exe
	Sleep 80
	
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
	
	ControlSend, ahk_parent, {f9} , ahk_exe client.exe
	Sleep 80
	
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
		
	Sleep 2000
	
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

}
KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return