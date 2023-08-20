SetMouseDelay, -1

; ===CHANGE SCRIPT ICON=======================================
I_Icon = C:\Users\Victor Goulart\Documents\scripts_autohotkey\images\Mastermind_Potion.ico
ICON [I_Icon]
if I_Icon <>
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%   ;Changes menu tray icon 



; ===KEY TO START=============================================	
Del::  ; Hotkey para começar o script
WinActivate, ahk_exe client.exe

; ===ACTIONS==================================================

DelayTime = 600000
; DelayTime = 2000

ControlSend, ahk_parent, {Del}, ahk_exe client.exe
Sleep DelayTime
SoundBeep, 750, 500
SoundBeep, 750, 500

return	