import XMonad
import XMonad.Util.EZConfig
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders

main = xmonad $ 
	(def
		{ startupHook = setWMName "LG3D" 
		, borderWidth = 2
		, focusedBorderColor = "#000000"
		, normalBorderColor = "#ffffff"
		}
	) `additionalKeysP` myKeys

myKeys = [ 
		("C-S-t", xdo $ safemouse 5    5), 
		("C-S-n", xdo $ safemouse 1915 5),
		("C-S-v", xdo $ safemouse 1915 1075),
		("C-S-w", xdo $ safemouse 5    1075)
	]

xdo action = spawn ("xdotool " ++ action)

mousemove x y = " mousemove " ++ show x ++ " " ++ show y

safemouse x y = mousemove (xmax - x) (ymax - y) ++ mousemove x y
	where
		xmax = 1920
		ymax = 1080
