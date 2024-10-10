
func_select_attack_mode(ByRef context) {
    ToolTipText := "Selecione o Modo de Ataque:`n1. AVALANCHE`n2. SD`n3. AVALANCHE / TERA_HUR`n4. TERA_HUR / FRIGO_HUR / TERA_HUR / AVALANCHE`n5. TERA_HUR / FRIGO_HUR / TERA_HUR / SD"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -6000
    context.select_mode := "SELECT_ATTACK"
}

func_select_attack_1(ByRef context) {
    ToolTipText := "AVALANCHE"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.attack_mode := "AVALANCHE"
    context.select_mode := False
}

func_select_attack_2(ByRef context) {
    ToolTipText := "SD"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.attack_mode := "SD"
    context.select_mode := False
}

func_select_attack_3(ByRef context) {
    ToolTipText := "AVALANCHE_TERAHUR"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.attack_mode := "AVALANCHE_TERAHUR"
    context.select_mode := False
}

func_select_attack_4(ByRef context) {
    ToolTipText := "TERAHUR_FRIGOHUR_AVALANCHE"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.attack_mode := "TERAHUR_FRIGOHUR_AVALANCHE"
    context.select_mode := False
}

func_select_attack_5(ByRef context) {
    ToolTipText := "TERAHUR_FRIGOHUR_SD"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.attack_mode := "TERAHUR_FRIGOHUR_SD"
    context.select_mode := False
}

func_select_attack_6(ByRef context) {
    ToolTipText := "Attack_6"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.attack_mode := ""
    context.select_mode := False
}

func_select_attack_7(ByRef context) {
    ToolTipText := "Attack_7"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.attack_mode := ""
    context.select_mode := False
}

func_select_attack_8(ByRef context) {
    ToolTipText := "Attack_8"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.attack_mode := ""
    context.select_mode := False
}

func_select_attack_9(ByRef context) {
    ToolTipText := "Attack_9"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.attack_mode := ""
    context.select_mode := False
}


attack_mato() {
    ControlSend, ahk_parent, {f21}, ahk_exe client.exe
    Sleep 10
    MouseClick, left
    Sleep 50
}

attack_avalanche() {
    ControlSend, ahk_parent, {f16}, ahk_exe client.exe
    Sleep 10
    MouseClick, left
    Sleep 50
}

attack_terahur() {
    ControlSend, ahk_parent, {f17}, ahk_exe client.exe
    Sleep 60
}

attack_exevoulu() {
    ControlSend, ahk_parent, {f19}, ahk_exe client.exe
    Sleep 60
}

attack_ue() {
    ControlSend, ahk_parent, {f20}, ahk_exe client.exe
    Sleep 60
}

attack_sd() {
    ControlSend, ahk_parent, {f15}, ahk_exe client.exe
    Sleep 60
}

attack_frigo_hur() {
    ControlSend, ahk_parent, {f18}, ahk_exe client.exe
    Sleep 60
}


func_force_attack(ByRef context) {
    switch context.force_attack
    {
        case "SD": attack_sd()
        case "AVALANCHE": attack_avalanche()
        case "TERA_HUR": attack_terahur()
        case "FRIGO_HUR": attack_frigo_hur()
        case "EXEVO_ULU": attack_exevoulu()
        case "UE": attack_ue()
        case "MATO": attack_mato()
    }
    context.force_attack := False
}

func_attack(turno, ByRef context) {
    if context.force_attack {
        func_force_attack(context)
        return
    }

    ; Select attack_mode
    if context.attack_mode {
        switch context.attack_mode
        {
            case "AVALANCHE":
                attack_avalanche()

            case "SD":
                attack_sd()

            case "AVALANCHE_TERAHUR":
                if (InStr(turno, "1_") or InStr(turno, "3_"))
                    attack_avalanche()
                if (InStr(turno, "2_") or InStr(turno, "4_"))
                    attack_terahur()

            case "TERAHUR_FRIGOHUR_AVALANCHE":
                if (InStr(turno, "1_") or InStr(turno, "3_"))
                    attack_terahur()
                if (InStr(turno, "2_"))
                    attack_frigo_hur()
                if (InStr(turno, "4_"))
                    attack_avalanche()

            case "TERAHUR_FRIGOHUR_SD":
                if (InStr(turno, "1_") or InStr(turno, "3_"))
                    attack_terahur()
                if (InStr(turno, "2_"))
                    attack_frigo_hur()
                if (InStr(turno, "4_"))
                    attack_sd()

            default: 
                Sleep 60
        }
    }
}
