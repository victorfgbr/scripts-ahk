#MaxThreadsPerHotkey 5

; ### HOTKEY SETTINGS #################################################

; ######### Force Cura #########
f13::
{
    
}
3:: ; Exura Gran San
{
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {3}, ahk_exe client.exe
        return
    }
    ForceCura := "GRANSAN"
    return    
}

4:: ; Exura San
{
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {4}, ahk_exe client.exe
        return
    }
    ForceCura := "SAN"
    return    
}

; ### FUNÇÕES #########################################################

pot_great_spirit() {
    ControlSend, ahk_parent, {2}, ahk_exe client.exe
}
pot_great_mana() {
    ControlSend, ahk_parent, {1}, ahk_exe client.exe
}
attack_massan() {
    ControlSend, ahk_parent, {f17}, ahk_exe client.exe
}
attack_runa() {
    ControlSend, ahk_parent, {f16}, ahk_exe client.exe
    Sleep 60
    MouseClick, left
}
usar_cura_1(CuraMode, ForceCura) {
    if ForceCura {
        switch ForceCura
        {
            case "GRANSAN":
                ControlSend, ahk_parent, {3}, ahk_exe client.exe
                return
        }
    }

    ; Exura San
    ControlSend, ahk_parent, {4}, ahk_exe client.exe
    return
}
usar_cura_2(CuraMode, ForceCura) {
    
    ; Exura Gran San
    if ForceCura {
        switch ForceCura
        {
            case "GRANSAN":
                ControlSend, ahk_parent, {3}, ahk_exe client.exe
                return
        }
    }

    ; Exura San
    ControlSend, ahk_parent, {3}, ahk_exe client.exe
    return
}
; ### LOOP START ############################################################

f24::  ; Hotkey para começar o script

if KeepWinZRunning  ; This means an underlying thread is already running the loop below.
{
    KeepWinZRunning := false  ; Signal that thread's loop to stop.
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
; Otherwise:
KeepWinZRunning := true

; ### LOOP #########################################

Loop
{
    ; TURNO 1 ###################################################
    usar_cura_1(CuraMode, ForceCura)
    ForceCura := False
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack_runa()
    Sleep 45
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
    
    Sleep 1000
    ; 1/2 TURNO 
    
    usar_cura_1(CuraMode, ForceCura)
    ForceCura := False
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
    
    pot_great_spirit()
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
    
    Sleep 1000
    ; TURNO 2 ###################################################

    usar_cura_1(CuraMode, ForceCura)
    ForceCura := False
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack_massan()
    Sleep 45
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    pot_great_mana()
    Sleep 45
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    Sleep 1000
    ; 1/2 TURNO 

    usar_cura_1(CuraMode, ForceCura)
    ForceCura := False
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    pot_great_spirit()
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    Sleep 1000
}

KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return
