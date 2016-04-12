-- Modules
import XMonad
import XMonad.Layout
import XMonad.Layout.IM
import XMonad.Layout.Named
import XMonad.Layout.Tabbed
import XMonad.Layout.Spacing           -- this makes smart space around windows
import XMonad.Util.EZConfig            -- removeKeys, additionalKeys
import XMonad.Util.Run(spawnPipe)      -- spawnPipe, hPutStrLn
import XMonad.Layout.Magnifier         -- this makes window bigger
import XMonad.Layout.ResizableTile     -- Resizable Horizontal border
import XMonad.Layout.ThreeColumns      -- for many windows
import Control.Monad (liftM2)          -- myManageHookShift
import qualified XMonad.StackSet as W  -- myManageHookShift
import System.IO                       -- for xmobar
import XMonad.Hooks.DynamicLog         -- for xmobar
import XMonad.Hooks.ManageDocks        -- avoid xmobar area
import XMonad.Layout.DragPane          -- see only two window
import XMonad.Layout.ToggleLayouts     -- Full window at any time
import XMonad.Layout.NoBorders         -- In Full mode, border is no use

-- Main
main :: IO ()
main = do
    xmproc <- spawnPipe "xmobar" -- call xmobar
    xmonad $ defaultConfig
        { terminal           = myTerminal
        , modMask            = myModMask
        , borderWidth        = myBorderWidth
        , normalBorderColor  = "#5a908e"
        , focusedBorderColor = "#99cb81"
        , startupHook = myStartupHook
        , manageHook = myManageHookShift <+> myManageHookFloat <+> manageDocks
        -- any time Full mode, avoid xmobar area
        , layoutHook = toggleLayouts (noBorders Full) $ avoidStruts $ myLayout
        -- xmobar setting
        , logHook = dynamicLogWithPP $ xmobarPP
            { ppOutput = hPutStrLn xmproc
            , ppTitle  = xmobarColor "green" "" . shorten 50
            }
        }
                `additionalKeysP`
        -- start software
                [ ("M4-g", spawn "gwenview")
        , ("M4-w", spawn "firefox")
        -- handle window size
        , ("M4--", sendMessage MagnifyLess)     -- smaller window
        , ("M4-M1--", sendMessage MagnifyMore)  -- bigger window
        , ("M4-M1-h", sendMessage MirrorShrink) -- border go down
        , ("M4-M1-l", sendMessage MirrorExpand) -- border go up
        , ("M4-f", sendMessage ToggleLayout)    -- toggle Full layout, any time
                ]


myTerminal     = "urxvt"   -- light weight terminal
myModMask      = mod4Mask  -- Super_L
myBorderWidth  = 2


-- Handle Window behaveior
myLayout =   (spacing 4 $ ResizableTall 1 (3/100) (1/2) [])
    |||  (magnifiercz 1.2 (ThreeCol 1 (3/100) (1/2)))
    |||  (spacing 2 $
             (dragPane Horizontal (1/10) (1/2)) ||| (dragPane Vertical   (1/10) (1/2))
         )


-- Start up (at xmonad beggining), like "wallpaper" or so on
myStartupHook = do
        spawn "feh --bg-fill ~/Pictures/wallpaper/WoodHouse.jpg"
        spawn "compton --config ~/.config/compton.conf"


-- some window must created there
myManageHookShift = composeAll
            -- if you want to know className, type "$ xprop|grep CLASS" on shell
            [ className =? "Firefox" --> viewShift "3"
            , className =? "Opera"   --> viewShift "3"
            ]
            where viewShift = doF . liftM2 (.) W.view W.shift

-- new window will created in Float mode
myManageHookFloat = composeAll
            [ className =? "MPlayer" --> doFloat
            , className =? "Gimp"    --> doFloat]


