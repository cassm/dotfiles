import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog (dzen)
import XMonad.Util.Run
import XMonad.Util.EZConfig

myFocusedBorderColor = "#585858"
myNormalBorderColor  = "#1C1C1C"
myXmonadBar = "dzen2 -x '1440' -y '0' -h '24' -w '640' -ta 'l' -fg '#FFFFFF' -bg '#1B1D1E'"
myStatusBar = "conky -c /home/my_user/.xmonad/.conky_dzen | dzen2 -x '2080' -w '1040' -h '24' -ta 'r' -bg '#1B1D1E' -fg '#FFFFFF' -y '0'"
main = do xmonad $ desktopConfig
                 { focusFollowsMouse  = True
                 , focusedBorderColor = myFocusedBorderColor
                 , normalBorderColor  = myNormalBorderColor
                 , terminal           = "konsole"
		 }
		 `removeKeys` [(mod1Mask, n) | n <- [xK_comma, xK_period]]