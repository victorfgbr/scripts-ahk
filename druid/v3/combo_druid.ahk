#MaxThreadsPerHotkey 5
#HotkeyInterval 2000  ; This is the default value (milliseconds).
#MaxHotkeysPerInterval 500

SetMouseDelay, 0

#Include ./attack_functions.ahk
#Include ./heal_functions.ahk
#Include ./mana_functions.ahk

context := { select_mode: "", heal_mode: "NONE", attack_mode: "NONE", mana_mode: "NONE" }

RemoveToolTip:
ToolTip
return

; Esc:: ExitApp

; #########################################################

Numpad1::
{
    switch context.select_mode
    {
        case "SELECT_ATTACK": func_select_attack_1(context)
        case "SELECT_HEAL": func_select_heal_1(context)
        case "SELECT_MANA": func_select_mana_1(context)
        default: func_select_heal_mode(context)
    }
    return
}

Numpad2::
{
    switch context.select_mode
    {
        case "SELECT_ATTACK": func_select_attack_2(context)
        case "SELECT_HEAL": func_select_heal_2(context)
        case "SELECT_MANA": func_select_mana_2(context)
        default: func_select_attack_mode(context)
    }
    return
}

Numpad3::
{
    switch context.select_mode
    {
        case "SELECT_ATTACK": func_select_attack_3(context)
        case "SELECT_HEAL": func_select_heal_3(context)
        case "SELECT_MANA": func_select_mana_3(context)
        default: func_select_mana_mode(context)
    }
    return
}

Numpad4::
{
    switch context.select_mode
    {
        case "SELECT_ATTACK": func_select_attack_4(context)
        case "SELECT_HEAL": func_select_heal_4(context)
        case "SELECT_MANA": func_select_mana_4(context)
    }
    return
}

Numpad5::
{
    switch context.select_mode
    {
        case "SELECT_ATTACK": func_select_attack_5(context)
        case "SELECT_HEAL": func_select_heal_5(context)
        case "SELECT_MANA": func_select_mana_5(context)
    }
    return
}

Numpad6::
{
    switch context.select_mode
    {
        case "SELECT_ATTACK": func_select_attack_6(context)
        case "SELECT_HEAL": func_select_heal_6(context)
        case "SELECT_MANA": func_select_mana_6(context)
    }
    return
}

Numpad7::
{
    switch context.select_mode
    {
        case "SELECT_ATTACK": func_select_attack_7(context)
        case "SELECT_HEAL": func_select_heal_7(context)
        case "SELECT_MANA": func_select_mana_7(context)
    }
    return
}

Numpad8::
{
    switch context.select_mode
    {
        case "SELECT_ATTACK": func_select_attack_8(context)
        case "SELECT_HEAL": func_select_heal_8(context)
        case "SELECT_MANA": func_select_mana_8(context)
    }
    return
}

Numpad9::
{
    switch context.select_mode
    {
        case "SELECT_ATTACK": func_select_attack_9(context)
        case "SELECT_HEAL": func_select_heal_9(context)
        case "SELECT_MANA": func_select_mana_9(context)
        default:
            if not context.get_loot {
                ToolTip, Pegar Loot Ligado
                SetTimer, RemoveToolTip, -2000
                context.get_loot := true
            } else {
                ToolTip, Pegar Loot Desligado
                SetTimer, RemoveToolTip, -2000
                context.get_loot := false
            }
    }
    return
}

; #########################################################

f7::
{
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {f7}, ahk_exe client.exe
        return
    }
    context.force_mana := true
    return
}
f6::
{
    context.force_heal := "SIO_EK"
    if not KeepWinZRunning {
        func_force_heal(context)
    }
    return
}
f13::
{
    context.force_heal := "VITA"
    if not KeepWinZRunning {
        func_force_heal(context)
    }
    return
}
f14::
{
    context.force_heal := "MASRES"
    if not KeepWinZRunning {
        func_force_heal(context)
    }
    return
}
f::
{
    if not KeepWinZRunning {
        ControlSend, ahk_parent, {f}, ahk_exe client.exe
        return
    }
    context.force_heal := "VITA"
    return
}
1::
{
    context.force_heal := "VITA"
    if not KeepWinZRunning {
        func_force_heal(context)
    }
    return
}
2::
{
    context.force_heal := "MASRES"
    if not KeepWinZRunning {
        func_force_heal(context)
    }
    return
}
3::
{
    context.force_heal := "SIO_EK"
    if not KeepWinZRunning {
        func_force_heal(context)
    }
    return
}
4::
{
    context.force_heal := "SIO_RP"
    if not KeepWinZRunning {
        func_force_heal(context)
    }
    return
}
5::
{
    context.force_heal := "GRAN_SIO_EK"
    if not KeepWinZRunning {
        func_force_heal(context)
    }
    return
}
f15::
{
    context.force_attack := "SD"
    if not KeepWinZRunning {
        func_force_attack(context)
    }
    return
}
f16::
{
    context.force_attack := "AVALANCHE"
    if not KeepWinZRunning {
        func_force_attack(context)
    }
    return
}
f17::
{
    context.force_attack := "TERA_HUR"
    if not KeepWinZRunning {
        func_force_attack(context)
    }
    return
}
f18::
{
    context.force_attack := "FRIGO_HUR"
    if not KeepWinZRunning {
        func_force_attack(context)
    }
    return
}
f19::
{
    context.force_attack := "EXEVO_ULU"
    if not KeepWinZRunning {
        func_force_attack(context)
    }
    return
}
f20::
{
    context.force_attack := "UE"
    if not KeepWinZRunning {
        func_force_attack(context)
    }
    return
}
f21::
{
    context.force_attack := "MATO"
    if not KeepWinZRunning {
        func_force_attack(context)
    }
    return
}

; #########################################################

func_pegar_loot(context) {
    if context.get_loot {
        ControlSend, ahk_parent, {'}, ahk_exe client.exe
    }
    Sleep 60
}

fn_turno(turno_id, ByRef context) {

    ; INIT TURNO ###
    sub_turno_id := turno_id "_INIT"

    func_heal(sub_turno_id, context)

    func_attack(sub_turno_id, context)

    func_pegar_loot(context)
    
    sleep 840
    
    ; HALF TURNO ###
    sub_turno_id := turno_id "_HALF"

    func_heal(sub_turno_id, context)

    func_use_mana(sub_turno_id, context)

    func_pegar_loot(context)

    sleep 840
}

; #########################################################

f24::
; MsgBox % "select_mode: " context.select_mode "`nheal_mode: " context.heal_mode "`nattack_mode: " context.attack_mode "`nmana_mode" context.mana_mode
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
    fn_turno(1, context)
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    ; TURNO 2 ###################################################
    fn_turno(2, context)
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    ; TURNO 3 ###################################################
    fn_turno(3, context)
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

    ;  TURNO 4 ###################################################
    fn_turno(4, context)
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.

}

KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return
