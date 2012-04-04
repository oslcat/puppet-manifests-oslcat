import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll [
    className =? "Gimp" --> doFloat,
    className =? "Pidgin" --> doFloat,
    className =? "MPlayer" --> doFloat
    ]

main::IO()
main = do
    xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar"
    xmonad $ defaultConfig{
        manageHook = manageDocks <+> myManageHook <+>
                    manageHook defaultConfig,
        layoutHook = avoidStruts  $  layoutHook defaultConfig,
        logHook = dynamicLogWithPP $ xmobarPP {
                ppOutput = hPutStrLn xmproc
                , ppTitle = xmobarColor "green" "" . shorten 50
            }
     }  `additionalKeys`
     [  ((mod4Mask, xK_c), kill),
        ((mod1Mask, xK_F3), spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\""), -- %! Launch dmenu
        ((controlMask .|. mod1Mask, xK_l), spawn "xscreensaver-command -lock")
        -- ((mod4mask, xK_l), spawn "xscreensaver-command -lock")
     ]
