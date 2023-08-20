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
	; ############# TURNO 1 #############
	ControlSend, ahk_parent, {f2} , ahk_exe client.exe
	Sleep 60
	
	ControlSend, ahk_parent, {f9} , ahk_exe client.exe
	Sleep 60000000
	
	Sleep 2000
	if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
		
	; ############# TURNO 2 #############
	ControlSend, ahk_parent, {f4} , ahk_exe client.exe
	Sleep 60
	
	ControlSend, ahk_parent, {f9} , ahk_exe client.exe
	Sleep 60
	
	Sleep 2000
	
	if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
	
	; ############# TURNO 3 #############
	ControlSend, ahk_parent, {f2} , ahk_exe client.exe
	Sleep 60
	
	ControlSend, ahk_parent, {f9} , ahk_exe client.exe
	Sleep 60
	
	Sleep 2000
	
	if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
		
	; ############# TURNO 4 #############
	ControlSend, ahk_parent, {f3} , ahk_exe client.exe
	Sleep 60
	
	ControlSend, ahk_parent, {f9} , ahk_exe client.exe
	Sleep 60
	
	Sleep 2000
	
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

}
KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return