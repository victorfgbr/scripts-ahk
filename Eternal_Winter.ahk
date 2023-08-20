SetMouseDelay, -1

; ===CHANGE SCRIPT ICON=======================================
I_Icon = C:\Users\Victor Goulart\Documents\scripts_autohotkey\images\Eternal_Winter.ico
ICON [I_Icon]
if I_Icon <>
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%   ;Changes menu tray icon 



; ===KEY TO START=============================================	
f8::  ; Hotkey para começar o script
WinActivate, ahk_exe client.exe

; ===ACTIONS==================================================

DelayTime = 40000
; DelayTime = 2000

ControlSend, ahk_parent, {f8}, ahk_exe client.exe
Sleep DelayTime
SoundBeep, 1000, 250
SoundBeep, 1000, 250
SoundBeep, 1000, 250

return	