SetMouseDelay, 0
Hotkey, Tab, MyLabel
return

MyLabel:
	MouseGetPos, xpos, ypos
	MouseClickDrag, left, %xpos%, %ypos%, 3292, 481 
	sleep 10
	Mousemove, %xpos%, %ypos%
	sleep 100
return

