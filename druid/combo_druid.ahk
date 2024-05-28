#MaxThreadsPerHotkey 5
#HotkeyInterval 2000  ; This is the default value (milliseconds).
#MaxHotkeysPerInterval 500

; ### HOTKEY SETTINGS #################################################
RemoveToolTip:
ToolTip
return

; ######### Mana Potion On/Off #########
NumpadSub::
{
    if (UseMana = "HALF") {
        ToolTip, Mana Desligado
        SetTimer, RemoveToolTip, -2000
        UseMana := false
    } else {
        ToolTip, Half Mana Ligado
        SetTimer, RemoveToolTip, -2000
        UseMana := "HALF"
    }
    return
}
NumpadAdd::
{
    if (UseMana = "FULL") {
        ToolTip, Mana Desligado
        SetTimer, RemoveToolTip, -2000
        UseMana := false
    } else {
        ToolTip, Full Mana Ligado
        SetTimer, RemoveToolTip, -2000
        UseMana := "FULL"
    }
    return
}


; ######### Heal modes #########
Numpad0:: 
{
    ToolTip, Cura Desligada
    SetTimer, RemoveToolTip, -2000
    CuraMode := "NONE"
    return
}
Numpad1:: 
{
    ToolTip, Cura Full Sio
    SetTimer, RemoveToolTip, -2000
    CuraMode := "AUTO_SIO"
    return
}
Numpad2:: 
{
    ToolTip, Cura Vita MasRes
    SetTimer, RemoveToolTip, -2000
    CuraMode := "VITA_MASRES"
    return
}
Numpad3:: 
{
    ToolTip, Cura Sio MasRes
    SetTimer, RemoveToolTip, -2000
    CuraMode := "SIO_MASRES"
    return
}
Numpad4:: 
{
    ToolTip, Cura MasRes
    SetTimer, RemoveToolTip, -2000
    CuraMode := "MASRES"
    return
}


; ######### Force Cura Modes #########
f7::
{
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {f7}, ahk_exe client.exe
        return
    }
    ForceMana := true
    return
}
f6::
{
    if not KeepWinZRunning {
        cure_sio_ek()
        return
    }
    ForceCura := "SIO_EK"
    return
}
f13::
{
    if not KeepWinZRunning {
        cure_vita()
        return
    }
    ForceCura := "VITA"
    return
}
f14::
{
    if not KeepWinZRunning {
        cure_masres()
        return
    }
    ForceCura := "MASRES"
    return    
}
f::
{
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {f}, ahk_exe client.exe
        return
    }
    ForceCura := "VITA"
    return    
}
1::
{
    if not KeepWinZRunning {
        cure_vita()
        return
    }
    ForceCura := "VITA"
    return    
}
2::
{
    if not KeepWinZRunning {
        cure_masres()
        return
    }
    ForceCura := "MASRES"
    return    
}
3::
{
    if not KeepWinZRunning {
        cure_sio_ek()
        return
    }
    ForceCura := "SIO_EK"
    return    
}
4:: 
{
    if not KeepWinZRunning {
        cure_sio_rp()
        return
    }
    ForceCura := "SIO_RP"
    return
}
5:: 
{
    if not KeepWinZRunning {
        cure_gran_sio()
        return
    }
    ForceCura := "GRAN_SIO_EK"
    return
}


; ### Attack modes #########
Numpad5:: 
{
    ToolTip, Attack ROTACAO
    SetTimer, RemoveToolTip, -2000
    AttackMode := "ROTACAO"
    return
}
Numpad6:: 
{
    ToolTip, Attack TERAHUR_AVALANCHE
    SetTimer, RemoveToolTip, -2000
    AttackMode := "TERAHUR_AVALANCHE"
    return
}
Numpad7:: 
{
    ToolTip, Attack SD
    SetTimer, RemoveToolTip, -2000
    AttackMode := "SD"
    return
}
Numpad8:: 
{
    ToolTip, Attack AVALANCHE
    SetTimer, RemoveToolTip, -2000
    AttackMode := "AVALANCHE"
    return
}
Numpad9:: 
{
    ToolTip, Attack NONE
    SetTimer, RemoveToolTip, -2000
    AttackMode := "NONE"
    return
}

; ######### Force Attack #########
f15::
{
    if not KeepWinZRunning {
        attack_sd()
        return
    }
    ForceAttack := "SD"
    return  
}
f16::
{
    if not KeepWinZRunning {
        attack_avalanche()
        return
    }
    ForceAttack := "AVALANCHE"
    return
}
f17::
{
    if not KeepWinZRunning {
        attack_terahur()
        return
    }
    ForceAttack := "TERA_HUR"
    return  
}
f18::
{
    if not KeepWinZRunning {
        attack_frigo_hur()
        return
    }
    ForceAttack := "FRIGO_HUR"
    return  
}
f19::
{
    if not KeepWinZRunning {
        attack_exevoulu()
        return
    }
    ForceAttack := "EXEVO_ULU"
    return  
}
f20::
{
    if not KeepWinZRunning {
        attack_ue()
        return
    }
    ForceAttack := "UE"
    return  
}
f21::
{
    if not KeepWinZRunning {
        attack_mato()
        return
    }
    ForceAttack := "MATO"
    return
}

; ### FUNÇÕES #########################################################

usar_mana(turno, UseMana, ByRef ForceMana) {
    if ForceMana {
        ControlSend, ahk_parent, {f7}, ahk_exe client.exe
        ForceMana := false
        return
    }

    switch UseMana {
        case "FULL":
            ControlSend, ahk_parent, {f7}, ahk_exe client.exe
            return

        case "HALF":
            if (InStr(turno, "1_") or InStr(turno, "3_"))
                ControlSend, ahk_parent, {f7}, ahk_exe client.exe
            return
    }
}

attack_mato() {
    ControlSend, ahk_parent, {f21}, ahk_exe client.exe
    Sleep 60
    MouseClick, left
}

attack_avalanche() {
    ControlSend, ahk_parent, {f16}, ahk_exe client.exe
    Sleep 60
    MouseClick, left
}

attack_terahur() {
    ControlSend, ahk_parent, {f17}, ahk_exe client.exe
    Sleep 60
    ControlSend, ahk_parent, {f7}, ahk_exe client.exe
}

attack_exevoulu() {
    ControlSend, ahk_parent, {f19}, ahk_exe client.exe
    Sleep 60
    ControlSend, ahk_parent, {f7}, ahk_exe client.exe
}

attack_ue() {
    ControlSend, ahk_parent, {f20}, ahk_exe client.exe
    Sleep 60
    ControlSend, ahk_parent, {f7}, ahk_exe client.exe
}

attack_sd() {
    ControlSend, ahk_parent, {f15}, ahk_exe client.exe
}

attack_frigo_hur() {
    ControlSend, ahk_parent, {f18}, ahk_exe client.exe
}

cure_gran_sio() {
    ControlSend, ahk_parent, {5}, ahk_exe client.exe
}

cure_sio_rp() {
    ControlSend, ahk_parent, {4}, ahk_exe client.exe
}

cure_sio_ek() {
    ControlSend, ahk_parent, {3}, ahk_exe client.exe
}

cure_masres() {
    ControlSend, ahk_parent, {2}, ahk_exe client.exe
}

cure_vita() {
    ControlSend, ahk_parent, {9}, ahk_exe client.exe
    Sleep 10
    ControlSend, ahk_parent, {1}, ahk_exe client.exe
}

force_attack(ForceAttack) {
    switch ForceAttack
    {
        case "SD":
            attack_sd()
            return

        case "AVALANCHE":
            attack_avalanche()
            return

        case "TERA_HUR":
            attack_terahur()
            return

        case "FRIGO_HUR":
            attack_frigo_hur()
            return

        case "EXEVO_ULU":
            attack_exevoulu()
            return

        case "UE":
            attack_ue()
            return

        case "MATO":
            attack_mato()
            return
    }
}

attack(turno, AttackMode, ByRef ForceAttack) {
    if ForceAttack {
        force_attack(ForceAttack)
        ForceAttack := False
        return
    }

    ; Select AttackMode
    if AttackMode {
        switch AttackMode
        {
            case "ROTACAO":
                if (InStr(turno, "1_") or InStr(turno, "3_"))
                    attack_terahur()
                if (InStr(turno, "2_"))
                    attack_frigo_hur()
                if (InStr(turno, "4_"))
                    attack_sd()

            case "TERAHUR_AVALANCHE":
                if (InStr(turno, "1_") or InStr(turno, "3_"))
                    attack_avalanche()
                if (InStr(turno, "2_") or InStr(turno, "4_"))
                    attack_terahur()

            case "AVALANCHE":
                attack_avalanche()

            case "SD":
                attack_sd()
        }
    }
}

force_cure(ForceCura) {
    switch ForceCura
    {
        case "VITA":
            cure_vita()
            return

        case "MASRES":
            cure_masres()
            return

        case "SIO_EK":
            cure_sio_ek()
            return

        case "SIO_RP":
            cure_sio_rp()
            return

        case "GRAN_SIO_EK":
            cure_gran_sio()
            return
    }
}

usar_cura(turno, CuraMode, ByRef ForceCura) {

    ; Modo Force Cura
    if ForceCura {
        force_cure(ForceCura)
        ForceCura := False
        return
    }

    ; Select CuraMode
    if CuraMode {
        switch CuraMode
        {
            case "AUTO_SIO":
                cure_sio_ek()
    
            case "VITA_MASRES":
                if (InStr(turno, "_HALF"))
                    cure_masres()
                else
                    cure_vita()

            case "SIO_MASRES":
                if (InStr(turno, "_HALF"))
                    cure_masres()
                else
                    cure_sio_ek()

            case "MASRES":
                if (InStr(turno, "_HALF"))
                    cure_masres()

        }
    }
}

; ### LOOP ############################################################

f24::  ; Hotkey para começar o script

if KeepWinZRunning  ; This means an underlying thread is already running the loop below.
{
    ToolTip, OFF
    SetTimer, RemoveToolTip, -2000
    KeepWinZRunning := false  ; Signal that thread's loop to stop.
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
else {
    ToolTip, ON
    SetTimer, RemoveToolTip, -2000
}

; Otherwise:
KeepWinZRunning := true
Loop
{
    ; TURNO 1 ###################################################
    turno := "1_INIT"

    usar_cura(turno, CuraMode, ForceCura)
    Sleep 60
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack(turno, AttackMode, ForceAttack)
    Sleep 1045
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    ; HALF TURNO ###
    turno := "1_HALF"
    
    usar_cura(turno, CuraMode, ForceCura)
    Sleep 60
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
        
    usar_mana(turno, UseMana, ForceMana)
    Sleep 1045
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
    
    ; TURNO 2 ###################################################
    turno := "2_INIT"

    usar_cura(turno, CuraMode, ForceCura)
    Sleep 60
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack(turno, AttackMode, ForceAttack)
    Sleep 1045
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    ; HALF TURNO ###
    turno := "2_HALF"

    usar_cura(turno, CuraMode, ForceCura)
    Sleep 60
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    usar_mana(turno, UseMana, ForceMana)
    Sleep 1045
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    ; TURNO 3 ###################################################
    turno := "3_INIT"

    usar_cura(turno, CuraMode, ForceCura)
    Sleep 60
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack(turno, AttackMode, ForceAttack)
    Sleep 1045
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    ; HALF TURNO ###
    turno := "3_HALF"

    usar_cura(turno, CuraMode, ForceCura)
    Sleep 60
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
        
    usar_mana(turno, UseMana, ForceMana)
    Sleep 1045
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
    
    ;  TURNO 4 ###################################################
    turno := "4_INIT"

    usar_cura(turno, CuraMode, ForceCura)
    Sleep 60
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack(turno, AttackMode, ForceAttack)
    Sleep 1045
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    ; HALF TURNO ###
    turno := "4_HALF"

    usar_cura(turno, CuraMode, ForceCura)
    Sleep 60
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    usar_mana(turno, UseMana, ForceMana)
    Sleep 1045
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
}

KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return
