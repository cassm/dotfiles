import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog (dzen)
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Hooks.ManageDocks

myFocusedBorderColor = "#585858"
myNormalBorderColor  = "#1C1C1C"

myWorkspaces = ["1:org","2:build","3:src","4:ref","5:ff", "6:emacs", "7:emacs", "8:conf", "9:scratch"]

myTerminal = "konsole"

myLayoutHook = avoidStruts (tall ||| Mirror tall ||| Full)
                    where  tall = Tall 1 (3/100) (1/2)

main = do xmonad $ desktopConfig
                 { focusFollowsMouse  = True
                 , focusedBorderColor = myFocusedBorderColor
                 , normalBorderColor  = myNormalBorderColor
                 , terminal           = myTerminal
		 , workspaces         = myWorkspaces
		 , manageHook         = manageHook desktopConfig <+>  manageDocks
		 , XMonad.layoutHook  = myLayoutHook
		 }
		 `removeKeys` [(mod1Mask, n) | n <- [xK_comma, xK_period]]