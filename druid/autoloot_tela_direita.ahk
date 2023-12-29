; ===CHANGE SCRIPT ICON=======================================
I_Icon = C:\Users\Victor Goulart\Documents\scripts_autohotkey\images\Crystal_Coin.ico
ICON [I_Icon]
if I_Icon <>
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%   ;Changes menu tray icon 
	
	
SetMouseDelay, 0
Hotkey, ', MyLabel
return


MyLabel:
	Send +{Click 760 382 Right}
	sleep 10 
	Send +{Click 830 382 Right}
	sleep 10
	Send +{Click 896 382 Right}
	sleep 10
	Send +{Click 896 450 Right}
	sleep 10
	Send +{Click 896 519 Right}
	sleep 10
	Send +{Click 830 519 Right}
	sleep 10
	Send +{Click 760 519 Right}
	sleep 10
	Send +{Click 760 450 Right}
	sleep 10
	Send +{Click 830 450 Right}
	sleep 10
		
	sleep 100
return
