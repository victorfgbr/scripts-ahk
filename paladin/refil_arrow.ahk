SetMouseDelay, 0


; ===CHANGE SCRIPT ICON=======================================
I_Icon = C:\Users\Victor Goulart\Documents\scripts_autohotkey\images\Blank_Rune.ico
ICON [I_Icon]
if I_Icon <>
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%   ;Changes menu tray icon 


; Auto execute section.
return
; Home:: Reload
; Esc::  ExitApp
F12::  Timer1(), Timer2()


Timer1(){
    Critical ; Do not interrupt
    Antiban1()
    SetTimer, Timer1, 20000
    return
}

Timer2(){
    Critical ; Do not interrupt,,,
    Antiban2()
    SetTimer, Timer2, 1200000
    return
}

Antiban1() {
	; Brown Mushroom
	Sleep, 500
    ControlSend, ahk_parent, {f13}, ahk_exe client.exe
	
	; Rune
	Sleep, 500
	MouseGetPos, xpos, ypos
	MouseClickDrag, left, 1748, 609, 1828, 250
	sleep 10
	Mousemove, %xpos%, %ypos%
	sleep 500

	ControlSend, ahk_parent, {f17}, ahk_exe client.exe
	
	return	
}

Antiban2() {
	; Life Ring
	Sleep, 300
    ControlSend, ahk_parent, {f15}, ahk_exe client.exe
	
	; Soft Boots
	Sleep, 300
	ControlSend, ahk_parent, {f14}, ahk_exe client.exe
	
	; Ferumbras Amulet
	Sleep, 300
	ControlSend, ahk_parent, {f18}, ahk_exe client.exe
	
    return
}
