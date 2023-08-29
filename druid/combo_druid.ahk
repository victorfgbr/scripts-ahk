#MaxThreadsPerHotkey 5
#HotkeyInterval 2000  ; This is the default value (milliseconds).
#MaxHotkeysPerInterval 500

; ### HOTKEY SETTINGS #################################################

; ######### Mana Potion On/Off #########
NumpadAdd:: 
{
    if not UseMana {
        UseMana := true
    } else {
        UseMana := false
    }
    return
}


; ######### Heal modes #########
Numpad0:: 
{
    CuraMode := "NONE"
    return
}
Numpad1:: 
{
    CuraMode := "AUTO_SIO"
    return
}
Numpad2:: 
{
    CuraMode := "VITA_MASRES"
    return
}
Numpad3:: 
{
    CuraMode := "SIO_MASRES"
    return
}
Numpad4:: 
{
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
        ControlSend, ahk_parent, {3}, ahk_exe client.exe
        return
    }
    ForceCura := "SIO_EK"
    return
}
f13::
{
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {1}, ahk_exe client.exe
        return
    }
    ForceCura := "VITA"
    return
}
f14::
{
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {2}, ahk_exe client.exe
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
        ControlSend, ahk_parent, {1}, ahk_exe client.exe
        return
    }
    ForceCura := "VITA"
    return    
}
2::
{
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {2}, ahk_exe client.exe
        return
    }
    ForceCura := "MASRES"
    return    
}
3::
{
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {3}, ahk_exe client.exe
        return
    }
    ForceCura := "SIO_EK"
    return    
}
4:: 
{
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {4}, ahk_exe client.exe
        return
    }
    ForceCura := "SIO_RP"
    return
}
5:: 
{
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {5}, ahk_exe client.exe
        return
    }
    ForceCura := "GRAN_SIO_EK"
    return
}


; ### Attack modes #########
Numpad5:: 
{
    AttackMode := "ROTACAO"
    return
}
Numpad6:: 
{
    AttackMode := "TERAHUR_AVALANCHE"
    return
}
Numpad7:: 
{
    AttackMode := "SD"
    return
}
Numpad8:: 
{
    AttackMode := "AVALANCHE"
    return
}
Numpad9:: 
{
    AttackMode := "NONE"
    return
}

; ######### Force Attack #########
f15::
{
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {f15}, ahk_exe client.exe
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
        ControlSend, ahk_parent, {f17}, ahk_exe client.exe
        return
    }
    ForceAttack := "TERA_HUR"
    return  
}
f18::
{
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {f18}, ahk_exe client.exe
        return
    }
    ForceAttack := "FRIGO_HUR"
    return  
}
f19::
{
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {f19}, ahk_exe client.exe
        return
    }
    ForceAttack := "EXEVO_ULU"
    return  
}
f20::
{
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {f20}, ahk_exe client.exe
        return
    }
    ForceAttack := "UE"
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

attack_avalanche() {
    ControlSend, ahk_parent, {f16}, ahk_exe client.exe
    Sleep 45
    MouseClick, left
}

force_attack(ForceAttack) {
    switch ForceAttack
    {
        case "SD":
            ControlSend, ahk_parent, {f15}, ahk_exe client.exe
            return

        case "AVALANCHE":
            attack_avalanche()
            return

        case "TERA_HUR":
            ControlSend, ahk_parent, {f17}, ahk_exe client.exe
            return

        case "FRIGO_HUR":
            ControlSend, ahk_parent, {f18}, ahk_exe client.exe
            return

        case "EXEVO_ULU":
            ControlSend, ahk_parent, {f19}, ahk_exe client.exe
            return

        case "UE":
            ControlSend, ahk_parent, {f20}, ahk_exe client.exe
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
                ControlSend, ahk_parent, {f15}, ahk_exe client.exe
    
            case "TERAHUR_AVALANCHE":
                ControlSend, ahk_parent, {f17}, ahk_exe client.exe
                Sleep 45
                ControlSend, ahk_parent, {f7}, ahk_exe client.exe
    
            case "AVALANCHE":
                attack_avalanche()
    
            case "SD":
                ControlSend, ahk_parent, {f15}, ahk_exe client.exe
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
                ControlSend, ahk_parent, {f18}, ahk_exe client.exe

            case "TERAHUR_AVALANCHE":
                ControlSend, ahk_parent, {f17}, ahk_exe client.exe
                Sleep 45
                ControlSend, ahk_parent, {f7}, ahk_exe client.exe

            case "AVALANCHE":
                attack_avalanche()

            case "SD":
                ControlSend, ahk_parent, {f15}, ahk_exe client.exe
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
                ControlSend, ahk_parent, {f17}, ahk_exe client.exe

            case "TERAHUR_AVALANCHE":
                attack_avalanche()

            case "AVALANCHE":
                attack_avalanche()

            case "SD":
                ControlSend, ahk_parent, {f15}, ahk_exe client.exe
        }
    }
}

force_cure(ForceCura) {
    switch ForceCura
    {
        case "VITA":
            ControlSend, ahk_parent, {1}, ahk_exe client.exe
            return

        case "MASRES":
            ControlSend, ahk_parent, {2}, ahk_exe client.exe
            return

        case "SIO_EK":
            ControlSend, ahk_parent, {3}, ahk_exe client.exe
            return

        case "SIO_RP":
            ControlSend, ahk_parent, {4}, ahk_exe client.exe
            return

        case "GRAN_SIO_EK":
            ControlSend, ahk_parent, {5}, ahk_exe client.exe
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
                ControlSend, ahk_parent, {3}, ahk_exe client.exe
    
            case "VITA_MASRES":
                ControlSend, ahk_parent, {2}, ahk_exe client.exe
    
            case "SIO_MASRES":
                ControlSend, ahk_parent, {3}, ahk_exe client.exe
    
            case "MASRES":
                ControlSend, ahk_parent, {2}, ahk_exe client.exe
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
                ControlSend, ahk_parent, {3}, ahk_exe client.exe
    
            case "VITA_MASRES":
                ControlSend, ahk_parent, {1}, ahk_exe client.exe
    
            case "SIO_MASRES":
                ControlSend, ahk_parent, {2}, ahk_exe client.exe
        }
    }
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

    usar_cura_1(CuraMode, ForceCura)
    ForceCura := False
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack_1(ForceAttack, AttackMode)
    ForceAttack := False
    Sleep 1045
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    usar_cura_2(CuraMode, ForceCura)
    ForceCura := False
    Sleep 45
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
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack_2(ForceAttack, AttackMode)
    ForceAttack := False
    Sleep 1045
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    usar_cura_2(CuraMode, ForceCura)
    ForceCura := False
    Sleep 45
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
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack_1(ForceAttack, AttackMode)
    ForceAttack := False
    Sleep 1045
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    usar_cura_2(CuraMode, ForceCura)
    ForceCura := False
    Sleep 45
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
    Sleep 45
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    attack_3(ForceAttack, AttackMode)
    ForceAttack := False
    Sleep 1045
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    usar_cura_2(CuraMode, ForceCura)
    ForceCura := False
    Sleep 45
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
