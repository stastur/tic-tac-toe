module Update exposing (initState, update)

import Array exposing (get, initialize, set)
import Helpers exposing (..)
import Types exposing (..)


initState : Model
initState =
    { squares = initialize 9 (\_ -> Empty)
    , turn = X
    , winner = Empty
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Move index ->
            if model.winner == Empty && get index model.squares == Just Empty then
                update (SetSquare index) model |> update CheckWinner |> update ChangeTurn

            else
                model

        ClearBoard ->
            initState

        CheckWinner ->
            { model
                | winner =
                    if getWinner model == True then
                        model.turn

                    else
                        Empty
            }

        SetSquare index ->
            { model
                | squares =
                    set index model.turn model.squares
            }

        ChangeTurn ->
            { model
                | turn =
                    if model.turn == X then
                        O

                    else
                        X
            }
