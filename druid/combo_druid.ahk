#MaxThreadsPerHotkey 5
#HotkeyInterval 2000  ; This is the default value (milliseconds).
#MaxHotkeysPerInterval 500

; ### HOTKEY SETTINGS #################################################
RemoveToolTip:
ToolTip
return

; ######### Mana Potion On/Off #########
NumpadAdd:: 
{
    if not UseMana {
        ToolTip, Mana Ligado
        SetTimer, RemoveToolTip, -2000
        UseMana := true
    } else {
        ToolTip, Mana Desligado
        SetTimer, RemoveToolTip, -2000
        UseMana := false
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

usar_mana(ForceMana, UseMana) {
    if ForceMana {
        ControlSend, ahk_parent, {f7}, ahk_exe client.exe
        return
    }
    
    if UseMana {
        ControlSend, ahk_parent, {f7}, ahk_exe client.exe
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

attack_3(ForceAttack, AttackMode) {
    
    if ForceAttack {
        force_attack(ForceAttack)
        return
    }

    ; Select attack AttackMode
    if AttackMode {
        switch AttackMode
        {
            case "ROTACAO":
                attack_sd()
    
            case "TERAHUR_AVALANCHE":
                attack_terahur()
    
            case "AVALANCHE":
                attack_avalanche()
    
            case "SD":
                attack_sd()
        }
    }
}

attack_2(ForceAttack, AttackMode) {
    
    if ForceAttack {
        force_attack(ForceAttack)
        return
    }

    if AttackMode {
        switch AttackMode
        {
            case "ROTACAO":
                attack_frigo_hur()

            case "TERAHUR_AVALANCHE":
                attack_terahur()

            case "AVALANCHE":
                attack_avalanche()

            case "SD":
                attack_sd()
        }
    }
}

attack_1(ForceAttack, AttackMode) {

    if ForceAttack {
        force_attack(ForceAttack)
        return
    }

    ; Select attack AttackMode
    if AttackMode {
        switch AttackMode
        {
            case "ROTACAO":
                attack_terahur()

            case "TERAHUR_AVALANCHE":
                attack_avalanche()

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

usar_cura_1(CuraMode, ForceCura) {

    ; Modo Force Cura
    if ForceCura {
        force_cure(ForceCura)
        return
    }

    ; Select attack CuraMode
    if CuraMode {
        switch CuraMode
        {
            case "AUTO_SIO":
                cure_sio_ek()
    
            case "VITA_MASRES":
                cure_masres()
    
            case "SIO_MASRES":
                cure_sio_ek()
    
            case "MASRES":
                cure_masres()
        }
    }
}

usar_cura_2(CuraMode, ForceCura) {

    if ForceCura {
        force_cure(ForceCura)
        return
    }

    ; Select attack CuraMode
    if CuraMode {
        switch CuraMode
        {
            case "AUTO_SIO":
                cure_sio_ek()
    
            case "VITA_MASRES":
                cure_vita()
    
            case "SIO_MASRES":
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

    usar_cura_1(CuraMode, ForceCura)
    ForceCura := False
    Sleep 60
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack_1(ForceAttack, AttackMode)
    ForceAttack := False
    Sleep 1045
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    usar_cura_2(CuraMode, ForceCura)
    ForceCura := False
    Sleep 60
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
        
    usar_mana(ForceMana, UseMana)
    ForceMana := False
    Sleep 1045
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
    
    ; TURNO 2 ###################################################

    usar_cura_1(CuraMode, ForceCura)
    ForceCura := False
    Sleep 60
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack_2(ForceAttack, AttackMode)
    ForceAttack := False
    Sleep 1045
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    usar_cura_2(CuraMode, ForceCura)
    ForceCura := False
    Sleep 60
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    usar_mana(ForceMana, UseMana)
    ForceMana := False
    Sleep 1045
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    ; TURNO 3 ###################################################

    usar_cura_1(CuraMode, ForceCura)
    ForceCura := False
    Sleep 60
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack_1(ForceAttack, AttackMode)
    ForceAttack := False
    Sleep 1045
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    usar_cura_2(CuraMode, ForceCura)
    ForceCura := False
    Sleep 60
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
        
    usar_mana(ForceMana, UseMana)
    ForceMana := False
    Sleep 1045
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
    
    ;  TURNO 4 ###################################################

    usar_cura_1(CuraMode, ForceCura)
    ForceCura := False
    Sleep 60
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack_3(ForceAttack, AttackMode)
    ForceAttack := False
    Sleep 1045
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    usar_cura_2(CuraMode, ForceCura)
    ForceCura := False
    Sleep 60
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    usar_mana(ForceMana, UseMana)
    ForceMana := False
    Sleep 1045
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
}

KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return
