; ===CHANGE SCRIPT ICON=======================================
I_Icon = C:\Users\Victor Goulart\Documents\scripts_autohotkey\images\Ultimate_Mana_Potion.ico
ICON [I_Icon]
if I_Icon <>
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%   ;Changes menu tray icon 

#MaxThreadsPerHotkey 3
f12::  ; Hotkey para começar o script

WinActivate, ahk_exe client.exe

if KeepWinZRunning  ; This means an underlying thread is already running the loop below.
{
    KeepWinZRunning := false  ; Signal that thread's loop to stop.
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}

; Otherwise:
KeepWinZRunning := true
Loop
{
	ControlSend, ahk_parent, {f22} , ahk_exe client.exe
	Sleep 1050

    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
}

KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return
