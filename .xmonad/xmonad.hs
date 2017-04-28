import XMonad
import XMonad.Util.EZConfig

main = xmonad $ defaultConfig `additionalKeysP` myKeys

myKeys = [ 
		("C-S-t", spawn "xdotool mousemove 1    1"), 
		("C-S-n", spawn "xdotool mousemove 1919 1"),
		("C-S-v", spawn "xdotool mousemove 1919 1079"),
		("C-S-w", spawn "xdotool mousemove 1    1079")
	]
