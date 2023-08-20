SetMouseDelay, -1

; ===CHANGE SCRIPT ICON=======================================
I_Icon = C:\Users\Victor Goulart\Documents\scripts_autohotkey\images\Stealth_Ring.ico
ICON [I_Icon]
if I_Icon <>
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%   ;Changes menu tray icon 



; ===KEY TO START=============================================	
; WinActivate, ahk_exe client.exe

; ===ACTIONS==================================================

DelayTime = 601000
; DelayTime = 2000

Loop 
{
    ControlSend, ahk_parent, {f10}, ahk_exe client.exe
    Sleep DelayTime
}
