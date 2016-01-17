module Main where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console

import Electron
import Electron.App
import Electron.BrowserWindow

main :: forall eff. Eff (console :: CONSOLE, electron :: ELECTRON | eff) Unit
main = do
  appPath <- getAppPath
  log appPath
  homePath <- getPath Home
  log homePath
  onReady do
    log "starting..."
    mainWindow <- newBrowserWindow [ Width 1200
                                   , Height 600
                                   , WebPreferences [ OverlayScrollbars true
                                                    , ZoomFactor 2.0
                                                    ]
                                   ]
    mainWindow `onClose` quit
    mainWindow `loadURL` "http://purescript.org"
