import XMonad
import XMonad.Util.EZConfig
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import XMonad.Hooks.Script

xres, yres :: Int
xres = 1920
yres = 1200

main = xmonad $ 
	(defaultConfig
		{ startupHook = do
			setWMName "LG3D" 
			xrandr 1
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

xrandr nDisp = spawn $
    "xrandr --output Virtual" ++ show nDisp
    ++ " --mode " ++ show xres ++ "x" ++ show yres
    ++ " --pos " ++ show ((nDisp - 1) * xres) ++ "x0"
