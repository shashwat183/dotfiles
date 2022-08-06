import XMonad
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Hooks.DynamicLog
import XMonad.Util.SpawnOnce
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
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
  -- spawnOnce "/usr/bin/trayer --edge top --align right --SetDockType true --SetPartialStrut true --width 10 --transparent true --expand true --distance 5 --height 30 --margin 30 --tint 0x1e1e1e --padding 20 &"
  setWMName "LG3D"


-- main function
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"
-- myBar = "polybar --reload"

-- Custom PP
myPP = xmobarPP { 
    ppCurrent = xmobarColor "#429942" "" . wrap ("<box type=Bottom width=2 mb=2 color=#429942>") "</box>" 
  , ppTitle = xmobarColor "#429942" "" . wrap ("<box type=Bottom width=2 mb=2 color=#429942>") "</box>" . shorten 60
  , ppExtras = [windowCount]
  }

-- Window swallowing event hook
-- Introduced in xmonad-contrib 0.17
-- windowSwallowEventHook = swallowEventHook (className =? "Alacritty" <||> className =? "Termite") (return True)

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main Configuraton, override the defaults to your liking
myConfig = def
	{ terminal = "alacritty"
  , borderWidth = 0
	, layoutHook = spacingWithEdge 10 $ myLayoutHook
  , startupHook = myStartupHook
  , handleEventHook = fullscreenEventHook
  , modMask = mod4Mask -- command key
	}
  `additionalKeysP`
  [
    -- ("M-p", spawn "rofi -modi drun -show")
    ("M-p", spawn "/home/sp/.config/rofi/bin/launcher_misc")
  , ("M-S-p", spawn "rofi -show run")
  , ("M-S-b", spawn "brave")
  , ("M-S-n", spawn "notion-app")
  , ("M-u", spawn "brave --profile-directory=Default --app-id=edcmabgkbicempmpgmniellhbjopafjh")
  , ("M-S-s", spawn "spotify")
  , ("M-S-m", spawn "alacritty -e neomutt")
  , ("M-s", spawn "alacritty -e spt")
  , ("M-S-t", spawn "alacritty -e tmux")
  , ("M-S-g", spawn "xdg-open https://www.google.com")
  , ("M-S-y", spawn "xdg-open https://www.youtube.com")
  , ("M-t", spawn "xdg-open https://www.twitter.com")
  , ("M-S-j", spawn "intellij-idea-community")
  ]

myLayoutHook = tiled ||| Mirror tiled ||| Full
	where
		tiled = Tall nmaster delta ratio
		nmaster = 1
		ratio = 1/2
		delta = 3/100
