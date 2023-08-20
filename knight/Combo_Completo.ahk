#MaxThreadsPerHotkey 5
Menu, Tray, Icon, Imagens\Fierce_Berserk.ico ; Change the tray icon

NumpadAdd::
{
	PotDoTurno:= "Supreme_Health_Potion"
	return
}

NumpadEnter::
{
	PotDoTurno := "Mana_Potion"
	return
}

NumpadDot::
{
	PotDoTurno := "Nada"
	return
}

Numpad0::
{
	CuraTurno := "Nada"
	return
}

Numpad1::
{
	CuraTurno := "Med_Ico"
	return
}

Numpad2::
{
	CuraTurno := "Exura_Ico"
	return
}

Numpad4::
{
	ExetaTurno := "Exeta_Res"
	return
}

Numpad5::
{
	ExetaTurno := "Amp_Res"
	return
}

Numpad6::
{
	ExetaTurno := "Nada"
	return
}





-::  ; Hotkey para começar o script

; ############## HOTKEY SETTINGS ############## 
ico = {1}
smp = {2} 
ghp = {3}
uhp = {3}
shp = {4}
gran = {f1}
exori = {f2}
min = {f3}
mas = {f4}
res = {f8}
ares = {f9}
utito = {r}
wait1 := 50
wait2 := 2000
wait3 := 900		


spellcura(CuraTurno)
{
		; Select CuraTurno
		if not (CuraTurno) {
			CuraTurno := "Med_Ico"
		}

		switch CuraTurno
		{
			case "Nada":
				ControlSend, ahk_parent, {}, ahk_exe client.exe
				
			case "Med_Ico":
				ControlSend, ahk_parent, {1}, ahk_exe client.exe
				
			case "Exura_Ico":
				ControlSend, ahk_parent, {7}, ahk_exe client.exe	
				
			Default:
				ControlSend, ahk_parent, {1}, ahk_exe client.exe
				
		}
	sleep 60
}

spellpot(PotDoTurno)
{
		; Select PotDoTurno
		if not (PotDoTurno) {
			PotDoTurno := "Mana_Potion"
		}

		switch PotDoTurno
		{
			case "Mana_Potion":
				ControlSend, ahk_parent, {2}, ahk_exe client.exe
				
			case "Supreme_Health_Potion":
				ControlSend, ahk_parent, {4}, ahk_exe client.exe
				
			case "Nada":
				ControlSend, ahk_parent, {}, ahk_exe client.exe	
				
			Default:
				ControlSend, ahk_parent, {2}, ahk_exe client.exe
				
		}
	sleep 1000
	}

spellatk(atk)
{
ControlSend, ahk_parent, %atk%, ahk_exe client.exe
Sleep 60
}

spellutito(utito)
{
ControlSend, ahk_parent, %utito%, ahk_exe client.exe
Sleep 60
}

;########### EXETA RES, AMP RES ###########;

spellexeta(ExetaTurno)
{
		; Select ExetaTurno
		if not (ExetaTurno) {
			ExetaTurno := "Exeta_Res"
		}

		switch ExetaTurno
		{
			case "Exeta_Res":
				ControlSend, ahk_parent, {f8}, ahk_exe client.exe
				
			case "Amp_Res":
				ControlSend, ahk_parent, {f9}, ahk_exe client.exe
				
			case "Nada":
				ControlSend, ahk_parent, {}, ahk_exe client.exe	
				
			Default:
				ControlSend, ahk_parent, {f8}, ahk_exe client.exe
				
		}
	sleep 60
}


{
GetKeyState, state, I
if (state = "D")
Send, {f9}
else
Send, %sup%
Sleep 60
}


;###############################################

if KeepWinZRunning  ; This means an underlying thread is already running the loop below.
{
    KeepWinZRunning := false  ; Signal that thread's loop to stop.
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
; Otherwise:
KeepWinZRunning := true
Loop
{
;########################### GRAN
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellutito(utito)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellatk(gran)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
;########################### EXORI
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellexeta(ExetaTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellatk(exori)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
;########################### EXORI MIN
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellexeta(ExetaTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellatk(min)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
;########################### GRAN
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellexeta(ExetaTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellatk(gran)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
;########################### EXORI
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellexeta(ExetaTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellatk(exori)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
;########################### EXORI MIN
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellutito(utito)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellatk(min)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
;########################### GRAN
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellexeta(ExetaTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellatk(gran)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
;########################### EXORI
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellexeta(ExetaTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellatk(exori)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
;########################### EXORI MIN
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellexeta(ExetaTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellatk(min)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
;########################### GRAN
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellexeta(ExetaTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellatk(gran)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
;########################### EXORI
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellutito(utito)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellatk(exori)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
;########################### EXORI MIN
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellexeta(ExetaTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellatk(min)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
;########################### GRAN
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellexeta(ExetaTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellatk(gran)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
;########################### EXORI
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellexeta(ExetaTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellatk(exori)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
;########################### EXORI MIN
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellexeta(ExetaTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellatk(min)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellcura(CuraTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(PotDoTurno)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
}
KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return