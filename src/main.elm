module Main exposing (main)

import Browser exposing (sandbox)
import Update exposing (initState, update)
import Views exposing (pageView)


main =
    sandbox
        { init = initState
        , view = pageView
        , update = update
        }
