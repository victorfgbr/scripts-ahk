

SetMouseDelay, -1
;WinSet, Transparent, 1, ahk_class Qt5QWindowOwnDCIcon

Loop 
{
	ControlSend, ahk_parent, {f21} , ahk_exe client.exe
	Sleep, 1000

	ControlSend, ahk_parent, {f21} , ahk_exe client.exe
	Sleep, 100

	ControlSend, ahk_parent, {f17} , ahk_exe client.exe
	Sleep, 1000
}

Esc::  ExitApp