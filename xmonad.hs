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
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.IndependentScreens
import qualified Data.Map as M
import qualified XMonad.StackSet as W
import XMonad.Config.Gnome

-- myFocusedBorderColor = "#585858"
myFocusedBorderColor = "#5FD7FF"
myNormalBorderColor  = "#1C1C1C"
myBorderWidth        = 2

myWorkspaces :: [String]
myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

myLayoutHook = mkToggle (single REFLECTX) $
	       mkToggle (single REFLECTX) $
               avoidStruts (tall ||| tallPrimary ||| Full)
          where
	      tall        = Tall 1 (3/100) (1/2)
	      tallPrimary = Tall 1 (3/100) (75/100)

myManageHook = composeAll
    [ className =? "Gimp"           --> doFloat ]

renameWS :: String -> X ()
renameWS newTag = windows $ \s -> let old = W.tag $ W.workspace $ W.current s
                                  in W.renameTag old newTag s

main = do
        xmonad $ gnomeConfig
           { focusedBorderColor = myFocusedBorderColor
           , normalBorderColor  = myNormalBorderColor
           , borderWidth        = myBorderWidth
           , handleEventHook    = fullscreenEventHook <+> ewmhDesktopsEventHook
           , workspaces         = myWorkspaces
           , manageHook         = myManageHook <+> manageDocks <+> manageHook desktopConfig
           , XMonad.layoutHook  = myLayoutHook
           , logHook            = updatePointer (0.05,0.5) (1,1) <+> ewmhDesktopsLogHook
           }
           `removeKeys`
           [(mod1Mask, n) | n <- [xK_comma, xK_period, xK_x, xK_X]]
           `removeKeysP` ["M-x"]
           `additionalKeys`
           [((mod1Mask, xK_b),
                    windows W.focusDown)
           ,((mod1Mask, xK_m),
                    sequence_ [viewScreen 0, windows W.focusMaster])
           ,((mod1Mask, xK_w),
                    sequence_ [viewScreen 1, windows W.focusMaster])
           ,((mod1Mask, xK_v),
                    sequence_ [viewScreen 2, windows W.focusMaster])
           ,((mod1Mask, xK_o),
                    sequence_ [withFocused $ windows . (flip W.float $ W.RationalRect 0 0 1 1),
                               sendToScreen 1,
                               viewScreen 1,
                               withFocused $ keysResizeWindow (2160, 0) (0.5, 0)])
           ,((mod1Mask, xK_e),
                    sequence_ [withFocused $ windows . (flip W.float $ W.RationalRect 0 0 1 1),
                               sendToScreen 0,
                               viewScreen 0,
                               withFocused $ keysResizeWindow (1080, 0) (0, 0)])
           ,((mod1Mask, xK_u),
                    sequence_ [withFocused $ windows . (flip W.float $ W.RationalRect 0 0 1 1),
                               sendToScreen 1,
                               viewScreen 1,
                               withFocused $ keysResizeWindow (1080, 0) (0, 0)])
           , ((mod1Mask, xK_g), sendMessage $ Toggle REFLECTX)
           , ((mod1Mask, xK_f), sendMessage $ Toggle REFLECTY)]
