

NumpadIns::
{
	CuraDoTurno:= "sio_ek"
	return
}

^NumpadIns::
{
	CuraDoTurno := "sio_rp"
	return
}


!NumpadIns::
{
	CuraDoTurno := "gran_sio"
	return
}

NumpadAdd::
{

	Loop
	{
		; Select CuraDoTurno
		if not (CuraDoTurno) {
			CuraDoTurno := "vita"
		}

		switch CuraDoTurno
		{
			case "vita":
				ControlSend, ahk_parent, {f24}, ahk_exe client.exe
				
			case "sio_ek":
				ControlSend, ahk_parent, {f13}, ahk_exe client.exe
				
			case "sio_rp":
				ControlSend, ahk_parent, {f14}, ahk_exe client.exe

			case "gran_sio":
				ControlSend, ahk_parent, {f15}, ahk_exe client.exe

			Default:
				ControlSend, ahk_parent, {f24}, ahk_exe client.exe
		}

		CuraDoTurno := False

		Sleep, 1050

		ControlSend, ahk_parent, {f23}, ahk_exe client.exe

		Sleep, 1050
	}

}


; F3:: healing_loop()

; TODO: definir pause
F12:: Pause

; TODO: remover exit
; Esc:: ExitApp