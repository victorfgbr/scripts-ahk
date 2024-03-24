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
	Send +{Click 1528 540 Right}
	 
	Send +{Click 1635 540 Right}
	
	Send +{Click 1740 540 Right}
	
	Send +{Click 1740 650 Right}
	
	Send +{Click 1740 755 Right}
	
	Send +{Click 1635 755 Right}
	
	Send +{Click 1528 755 Right}
	
	Send +{Click 1528 650 Right}
	
	Send +{Click 1635 650 Right}

return
