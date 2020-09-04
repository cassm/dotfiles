import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog(dzen)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import XMonad.Hooks.ManageDocks
import XMonad.Actions.UpdatePointer
import XMonad.Actions.PhysicalScreens
import XMonad.Actions.FloatKeys
import XMonad.Layout.Reflect
import XMonad.Layout.MultiToggle
import qualified Data.Map as M
import qualified XMonad.StackSet as W
import XMonad.Hooks.SetWMName
import XMonad.Actions.DwmPromote

-- myFocusedBorderColor = "#585858"
myFocusedBorderColor = "#5FD7FF"
myNormalBorderColor  = "#1C1C1C"
myBorderWidth        = 2

myWorkspaces :: [String]
myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

myTerminal = "konsole"

myModMask = mod1Mask
modMask = myModMask

myLayoutHook = mkToggle (single REFLECTX) $
               mkToggle (single REFLECTY) $
               avoidStruts (Mirror tall ||| Mirror tallPrimary ||| tall ||| tallPrimary ||| Full)
          where
	      tall        = Tall 1 (3/100) (1/2)
	      tallPrimary = Tall 1 (3/100) (75/100)

renameWS :: String -> X ()
renameWS newTag = windows $ \s -> let old = W.tag $ W.workspace $ W.current s
                                  in W.renameTag old newTag s


main = do
        xmonad $ desktopConfig
           { focusedBorderColor = myFocusedBorderColor
           , normalBorderColor  = myNormalBorderColor
           , borderWidth        = myBorderWidth
           , terminal           = myTerminal
           , workspaces         = myWorkspaces
           , manageHook         = manageDocks <+> manageHook desktopConfig
           , XMonad.layoutHook  = myLayoutHook
           , logHook            = updatePointer (Relative 0.05 0.5)
           , startupHook        = setWMName "LG3D"
           }
           `removeKeys`
           [(myModMask, n) | n <- [xK_Return, xK_comma, xK_period, xK_x, xK_X, xK_f, xK_b]]
           `removeKeysP` ["M-x"]
           `additionalKeys`
           [((myModMask, xK_m),
                    sequence_ [viewScreen 0, windows W.focusMaster])
           ,((myModMask, xK_w),
                    sequence_ [viewScreen 2, windows W.focusMaster])
           ,((myModMask, xK_v),
                    sequence_ [viewScreen 1, windows W.focusMaster])
           ,((myModMask, xK_o),
                    sequence_ [withFocused $ windows . (flip W.float $ W.RationalRect 0 0 1 1),
                               sendToScreen 1,
                               viewScreen 1,
                               withFocused $ keysResizeWindow (2160, 0) (0.5, 0)])
           ,((myModMask, xK_e),
                    sequence_ [withFocused $ windows . (flip W.float $ W.RationalRect 0 0 1 1),
                               sendToScreen 0,
                               viewScreen 0,
                               withFocused $ keysResizeWindow (1080, 0) (0, 0)])
           ,((myModMask, xK_u),
                    sequence_ [withFocused $ windows . (flip W.float $ W.RationalRect 0 0 1 1),
                               sendToScreen 2,
                               viewScreen 2,
                               withFocused $ keysResizeWindow (1080, 0) (0, 0)])
           , ((myModMask, xK_BackSpace), dwmpromote)
           , ((myModMask, xK_p), sendMessage $ Toggle REFLECTX)
           , ((myModMask, xK_y), sendMessage $ Toggle REFLECTY)]
