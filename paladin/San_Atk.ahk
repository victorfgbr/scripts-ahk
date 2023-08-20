#MaxThreadsPerHotkey 3
f24::  ; Hotkey para começar o script

; ############## HOTKEY SETTINGS ############## 

gransan = {f13} 
san = {f14}
usp = {5}
gsp= {2}
gmp = {1}
massan = {f17}
runa = {f5}	
exura_gran = {6}	

spellcura(cura,cura1)
{
GetKeyState, state, G
if (state = "D")
Send, %cura1%
else
Send, %cura%
Sleep 60
}
spellpot(pot,pot1)
{
GetKeyState, state, G
if (state = "D")
Send, %pot1%
else
Send, %pot%
Sleep 1060
}
spellatk(atk)
{
Send, %atk%
Sleep 60
}
spellruna(xxx)
{
Send, %xxx%
Sleep 1060
}

;###############################################

if KeepWinZRunning  ; This means an underlying thread is already running the loop below.
{
    KeepWinZRunning := false  ; Signal that thread's loop to stop.
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
; Otherwise:
KeepWinZRunning := true
Loop
{
;########################### mas san
spellcura(san,gransan)
;spellcura(exura_gran,gransan)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellatk(massan)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(gsp,usp)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellcura(san,gransan)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(gmp,usp)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.

;########################### runa
;spellcura(san,gransan)
spellcura(exura_gran,gransan)
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
spellruna(runa)
    if not KeepWinZRunning  ;
        break  ; Break out of this loop.
spellcura(san,gransan)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
spellpot(gsp,usp)
    if not KeepWinZRunning  ; 
        break  ; Break out of this loop.
}
KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return