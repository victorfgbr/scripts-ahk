#MaxThreadsPerHotkey 5

; ### HOTKEY SETTINGS #################################################
 
-::
{
    if UseGreat {
        UseGreat := false
        ManaPotion := "ULTIMATE"
    } else {
        UseGreat := true
        ManaPotion := "GREAT"
    }
    return ;wqw
}

f24::  ; Hotkey para começar o script

avalanche = {Numpad9}
ultimate_mana = {Numpad8}
great_mana = {Numpad7}

; ### FUNÇÕES #########################################################

usar_mana_pot(ManaPotion) 
{
    ; Select ManaPotion
    if not ManaPotion {
        ManaPotion := "ULTIMATE"
    }

    switch ManaPotion
    {
        case "GREAT":
            ControlSend, ahk_parent, {Numpad7}, ahk_exe client.exe

        case "ULTIMATE":
            ControlSend, ahk_parent, {Numpad8}, ahk_exe client.exe

        Default:
            ControlSend, ahk_parent, {Numpad8}, ahk_exe client.exe
    }

    Sleep 1060
}

usar_runa(runa) {
    Send, %runa%
    Sleep 60
    MouseClick, left
    Sleep 1060
}

; ### LOOP ############################################################

if KeepWinZRunning  ; This means an underlying thread is already running the loop below.
{
    KeepWinZRunning := false  ; Signal that thread's loop to stop.
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
; Otherwise:
KeepWinZRunning := true
Loop
{
    usar_runa(avalanche) ;
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

    usar_mana_pot(ManaPotion) ;
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
}

KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return
