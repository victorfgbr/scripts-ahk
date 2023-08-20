#MaxThreadsPerHotkey 3
f1::  ; Hotkey para começar o script
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
	; ControlSend, ahk_parent, {f1} , ahk_exe client.exe
	; Sleep 500
    

    ControlSend, ahk_parent, {Space} , ahk_exe client.exe
	Sleep 2000
	
	
    ControlSend, ahk_parent, {Esc} , ahk_exe client.exe
    Sleep 100


    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

}
KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return
