import XMonad
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Hooks.DynamicLog
import XMonad.Util.SpawnOnce
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig

-- Window Count
windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

-- Autostart commands
myStartupHook :: X ()
myStartupHook = do
  spawnOnce "xrandr -s 1920x1080 &"
  spawnOnce "nitrogen --restore &"
  spawnOnce "picom &"
  spawnOnce "/usr/bin/trayer --edge top --align right --SetDockType true --SetPartialStrut true --width 10 --transparent true --expand true --distance 20 --height 30 --margin 40 --tint 0x1e1e1e --padding 20 &"


-- main function
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP
myPP = xmobarPP { 
    ppCurrent = xmobarColor "#429942" "" . wrap ("<box type=Bottom width=2 mb=2 color=#429942>") "</box>" 
  , ppTitle = xmobarColor "#429942" "" . wrap ("<box type=Bottom width=2 mb=2 color=#429942>") "</box>" . shorten 60
  , ppExtras = [windowCount]
  }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main Configuraton, override the defaults to your liking
myConfig = def
	{ terminal = "kitty"
  , borderWidth = 5
	, layoutHook = spacingWithEdge 15 $ myLayoutHook
  , startupHook = myStartupHook
	}
  `additionalKeysP`
  [
    ("M-p", spawn "rofi -modi drun -show")
  , ("M-S-p", spawn "rofi -show run")
  ]

myLayoutHook = tiled ||| Mirror tiled ||| Full
	where
		tiled = Tall nmaster delta ratio
		nmaster = 1
		ratio = 1/2
		delta = 3/100
