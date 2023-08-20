SetMouseDelay, -1

1::
{
	WinActivate, ahk_exe client.exe
	ControlSend, ahk_parent, {1}, ahk_exe client.exe
	SoundBeep, 1500, 500
	return
}

2::
{
	WinActivate, ahk_exe client.exe
	ControlSend, ahk_parent, {2}, ahk_exe client.exe
	SoundBeep, 750, 500
	return
}

3::
{
	WinActivate, ahk_exe client.exe
	ControlSend, ahk_parent, {3}, ahk_exe client.exe
	SoundBeep, 1000, 500
	return
}
