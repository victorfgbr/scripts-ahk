

SetMouseDelay, -1
;WinSet, Transparent, 1, ahk_class Qt5QWindowOwnDCIcon

Loop 
{
	ControlSend, ahk_parent, {1} , ahk_exe client.exe
	Sleep, 100

	ControlSend, ahk_parent, {2} , ahk_exe client.exe
	Sleep, 100

}

Esc::  ExitApp