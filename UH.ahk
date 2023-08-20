#MaxThreadsPerHotkey 3
SetMouseDelay, 0
G::  ; Hotkey para começar o script

; ############## HOTKEY SETTINGS ############## 
UH = {G}
X = 1571
Y = 34
	
{
	MouseGetPos, StartX, StartY
	ControlSend, ahk_parent, %UH% , ahk_exe client.exe ; UH
	Sleep, 100
	MouseClick, left, %X%, %Y%
	MouseMove, StartX, StartY

{
return
}
}