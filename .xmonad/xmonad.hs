import XMonad
import XMonad.Util.EZConfig
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import XMonad.Hooks.Script

xres, yres :: Int
xres = 2560
yres = 1440

main = xmonad $ 
	(defaultConfig
		{ startupHook = do
			setWMName "LG3D" 
			spawn $ 
			    "xrandr --output Virtual1 --mode " 
			    ++ show xres 
			    ++ "x" 
			    ++ show yres
		, borderWidth = 0
		, layoutHook = Tall 1 (1/20) (1/2)
		, focusedBorderColor = "#000000"
		, normalBorderColor = "#f4f4f4"
		, terminal = "konsole"
		}
	) `additionalKeysP` myKeys

myKeys = [ 
		("C-S-t", xdo $ safemouse 5          5), 
		("C-S-n", xdo $ safemouse (xres - 5) 5),
		("C-S-v", xdo $ safemouse (xres - 5) (yres - 5)),
		("C-S-w", xdo $ safemouse 5          (yres - 5))
	]

xdo action = spawn ("xdotool " ++ action)

mousemove x y = " mousemove " ++ show x ++ " " ++ show y

safemouse x y = mousemove (xres - x) (yres - y) ++ mousemove x y
