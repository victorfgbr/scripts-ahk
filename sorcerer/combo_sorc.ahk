#MaxThreadsPerHotkey 5

; ### HOTKEY SETTINGS #################################################


; Mana Potion on/off
M::
{
    if not UseMana {
        UseMana := true
    } else {
        UseMana := false
    }
    return
}

; use exura vita
F::
{
    ; set to use exura_vita
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {f}, ahk_exe client.exe
        return
    }
    ForceCura := "exura_vita"
    return
}

; use uh
G::
{
    if not KeepWinZRunning {
        ;ControlSend, ahk_parent, {g}, ahk_exe client.exe
        usar_uh()
        return
    }
    ForceCura := "uh"
    return
}

; auto uh on/off
U::
{
    if not AutoUH {
        AutoUH := true
    } else {
        AutoUH := false
    }
    return
}

; ### FUNÇÕES #########################################################

mana_pot(useMana){
    if useMana {
        ControlSend, ahk_parent, {r}, ahk_exe client.exe
    }
}

usar_uh() {
    ; X = 1571
    X = 2236
    ;Y = 34
    Y = 58 

    MouseGetPos, StartX, StartY
	ControlSend, ahk_parent, {g}, ahk_exe client.exe ; UH
	Sleep, 100
	MouseClick, left, %X%, %Y%
	MouseMove, StartX, StartY
}

cura_1(AutoUH, ForceCura){

    ; Modo Force Cura
    if ForceCura {
        switch ForceCura {
            case "exura_vita":
                ControlSend, ahk_parent, {f}, ahk_exe client.exe
            case "uh":
                usar_uh()
        }
        return
    }

    ; Select attack AutoUH
    if AutoUH {
        usar_uh()
    }
}

cura_2(AutoUH, ForceCura){

    ; Modo Force Cura
    if ForceCura {
        switch ForceCura {
            case "exura_vita":
                ControlSend, ahk_parent, {f}, ahk_exe client.exe
            case "uh":
                usar_uh()
        }
        return
    }
}

attack_1(){
    ; flam hur
    ; del
    ControlSend, ahk_parent, {Del}, ahk_exe client.exe
}

attack_2(){
    ; vis hur
    ; end
    ControlSend, ahk_parent, {End}, ahk_exe client.exe
}

attack_3(){
    ; sd
    ; pgdn
    ControlSend, ahk_parent, {PgDn}, ahk_exe client.exe
}

use_debuf(){
    ; pgup
    ControlSend, ahk_parent, {PgUp}, ahk_exe client.exe
}

; ### LOOP ############################################################

f24::  ; Hotkey para começar o script

if KeepWinZRunning  ; This means an underlying thread is already running the loop below.
{
    KeepWinZRunning := false  ; Signal that thread's loop to stop.
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
; Otherwise:
KeepWinZRunning := true
Loop
{
    ; TURNO 1 ###################################################

    use_debuf()
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    cura_1(AutoUH, ForceCura)
    ForceCura := False
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack_1()
    Sleep 1045
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    ; ###

    cura_2(AutoUH, ForceCura)
    ForceCura := False
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
        
    mana_pot(UseMana)
    Sleep 1045
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
    
    ; TURNO 2 ###################################################

    cura_1(AutoUH, ForceCura)
    ForceCura := False
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack_2()
    Sleep 1045
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    ; ###

    cura_2(AutoUH, ForceCura)
    ForceCura := False
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    mana_pot(UseMana)
    Sleep 1045
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    ; TURNO 3 ###################################################

    cura_1(AutoUH, ForceCura)
    ForceCura := False
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack_1()
    Sleep 1045
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    ; ###

    cura_2(AutoUH, ForceCura)
    ForceCura := False
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
        
    mana_pot(UseMana)
    Sleep 1045
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
    
    ;  TURNO 4 ###################################################

    cura_2(AutoUH, ForceCura)
    ForceCura := False
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack_3()
    Sleep 1045
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    ; ###

    cura_2(AutoUH, ForceCura)
    ForceCura := False
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    mana_pot(UseMana)
    Sleep 1045
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
}

KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return
