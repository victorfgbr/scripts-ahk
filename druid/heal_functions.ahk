
func_select_heal_mode(ByRef context) {
    ToolTipText := "Selecione o Modo de Cura:`n1. SIO_EK`n2. EXURA_VITA / MAS_RES`n3. SIO_EK / MAS_RES`n4. MAS_RES`n5. SIO_EK / SIO_RP`n6. SIO_EK / MAS_RES / SIO_RP / MAS_RES`n7. Full EXURA_VITA`n8. EXURA_VITA / EXURA_GRAN`n9. EXURA_GRAN"
    ToolTip, %ToolTipText% 
    SetTimer, RemoveToolTip, -6000
    context.select_mode := "SELECT_HEAL"
}

func_select_heal_1(ByRef context) {
    ToolTipText := "FULL_SIO"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.heal_mode := "FULL_SIO"
    context.select_mode := False
}

func_select_heal_2(ByRef context) {
    ToolTipText := "VITA_MASRES"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.heal_mode := "VITA_MASRES"
    context.select_mode := False
}

func_select_heal_3(ByRef context) {
    ToolTipText := "SIO_MASRES"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.heal_mode := "SIO_MASRES"
    context.select_mode := False
}

func_select_heal_4(ByRef context) {
    ToolTipText := "MASRES"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.heal_mode := "MASRES"
    context.select_mode := False
}

func_select_heal_5(ByRef context) {
    ToolTipText := "SIO_EK_RP"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.heal_mode := "SIO_EK_RP"
    context.select_mode := False
}

func_select_heal_6(ByRef context) {
    ToolTipText := "SIO_EK_RP_MASRES"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.heal_mode := "SIO_EK_RP_MASRES"
    context.select_mode := False
}

func_select_heal_7(ByRef context) {
    ToolTipText := "FULL_VITA"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.heal_mode := "FULL_VITA"
    context.select_mode := False
}

func_select_heal_8(ByRef context) {
    ToolTipText := "VITA_GRAN"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.heal_mode := "VITA_GRAN"
    context.select_mode := False
}

func_select_heal_9(ByRef context) {
    ToolTipText := "FULL_GRAN"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.heal_mode := "FULL_GRAN"
    context.select_mode := False
}

func_force_heal(ByRef context) {
    switch context.force_heal
    {
        case "VITA": heal_vita()
        case "MASRES": heal_masres()
        case "SIO_EK": heal_sio_ek()
        case "SIO_RP": heal_sio_rp()
        case "GRAN_SIO_EK": heal_gran_sio()
    }
    context.force_heal := False
}

func_heal(turno, ByRef context) {

    ; Modo Force Cura
    if context.force_heal {
        func_force_heal(context)
        return
    }

    ; Select heal_mode
    if context.heal_mode {
        switch context.heal_mode
        {
            case "FULL_SIO":
                heal_sio_ek()

            case "VITA_MASRES":
                if (InStr(turno, "_HALF"))
                    heal_masres()
                else
                    heal_vita()

            case "SIO_MASRES":
                if (InStr(turno, "_HALF"))
                    heal_masres()
                else
                    heal_sio_ek()

            case "MASRES":
                if (InStr(turno, "_HALF"))
                    heal_masres()

            case "SIO_EK_RP":
                if (InStr(turno, "_HALF"))
                    heal_sio_ek()
                else
                    heal_sio_rp()
            
            case "SIO_EK_RP_MASRES":
            case "SIO_MASRES":
                if (InStr(turno, "_HALF"))
                    heal_masres()
                else
                    if (InStr(turno, "1_") or InStr(turno, "3_"))
                        heal_sio_ek()
                    if (InStr(turno, "2_") or InStr(turno, "4_"))
                        heal_sio_rp()

            case "FULL_VITA":
                heal_vita()

            case "VITA_GRAN":
                if (InStr(turno, "_HALF"))
                    heal_vita()
                else
                    heal_exura_gran()

            case "FULL_GRAN":
                heal_exura_gran()

            default: 
                Sleep 60
        }
    }
}

heal_gran_sio() {
    ControlSend, ahk_parent, {5}, ahk_exe client.exe
    Sleep 60
}

heal_sio_rp() {
    ControlSend, ahk_parent, {4}, ahk_exe client.exe
    Sleep 60
}

heal_sio_ek() {
    ControlSend, ahk_parent, {3}, ahk_exe client.exe
    Sleep 60
}

heal_masres() {
    ControlSend, ahk_parent, {2}, ahk_exe client.exe
    Sleep 60
}

heal_vita() {
    ControlSend, ahk_parent, {9}, ahk_exe client.exe
    Sleep 10
    ControlSend, ahk_parent, {1}, ahk_exe client.exe
    Sleep 50
}

heal_exura_gran() {
    ControlSend, ahk_parent, {8}, ahk_exe client.exe
    Sleep 60
}
