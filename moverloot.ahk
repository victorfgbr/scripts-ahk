SetMouseDelay, 0
Hotkey, Tab, MyLabel
return

MyLabel:
	MouseGetPos, xpos, ypos
	MouseClickDrag, left, %xpos%, %ypos%, 1748, 609 
	sleep 10
	Mousemove, %xpos%, %ypos%
	sleep 100
return

