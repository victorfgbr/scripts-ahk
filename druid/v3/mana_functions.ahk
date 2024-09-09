
func_select_mana_mode(ByRef context) {
    ToolTipText := "Selecione o Modo de Mana Pot:`n1. MANA_OFF`n2. FULL_MANA`n3. HALF_MANA`n4. ULTIMATE_GREAT"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -6000
    context.select_mode := "SELECT_MANA"
}

func_select_mana_1(ByRef context) {
    ToolTipText := "MANA_OFF"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.mana_mode := "MANA_OFF"
    context.select_mode := False
}

func_select_mana_2(ByRef context) {
    ToolTipText := "FULL_MANA"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.mana_mode := "FULL_MANA"
    context.select_mode := False
}

func_select_mana_3(ByRef context) {
    ToolTipText := "HALF_MANA"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.mana_mode := "HALF_MANA"
    context.select_mode := False
}

func_select_mana_4(ByRef context) {
    ToolTipText := "ULTIMATE_GREAT"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.mana_mode := "ULTIMATE_GREAT"
    context.select_mode := False
}

func_select_mana_5(ByRef context) {
    ToolTipText := "Mana_5"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.mana_mode := "Mana_5"
    context.select_mode := False
}

func_select_mana_6(ByRef context) {
    ToolTipText := "Mana_6"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.mana_mode := "Mana_6"
    context.select_mode := False
}

func_select_mana_7(ByRef context) {
    ToolTipText := "Mana_7"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.mana_mode := "Mana_7"
    context.select_mode := False
}

func_select_mana_8(ByRef context) {
    ToolTipText := "Mana_8"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.mana_mode := "Mana_8"
    context.select_mode := False
}

func_select_mana_9(ByRef context) {
    ToolTipText := "Mana_9"
    ToolTip, %ToolTipText%
    SetTimer, RemoveToolTip, -3000
    context.mana_mode := "Mana_9"
    context.select_mode := False
}

ultimate_mana() {
    ControlSend, ahk_parent, {f7}, ahk_exe client.exe
    Sleep 60
}

no_mana() {
    Sleep 60
}

func_use_mana(turno, ByRef context) {
    
    if context.force_mana {
        ultimate_mana()
        context.force_mana := false
        return
    }

    switch context.mana_mode {
        case "FULL_MANA":
            ultimate_mana()
            return

        case "HALF_MANA":
            if (InStr(turno, "1_") or InStr(turno, "3_"))
                ultimate_mana()
            else
                no_mana()
            return

        default: 
            no_mana()
    }
}