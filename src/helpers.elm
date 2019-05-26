module Helpers exposing (getValue, getWinner, matchCombo, winningCombos)

import Array exposing (Array)
import Types exposing (..)


winningCombos : List (List number)
winningCombos =
    [ [ 0, 1, 2 ]
    , [ 3, 4, 5 ]
    , [ 6, 7, 8 ]
    , [ 0, 3, 6 ]
    , [ 1, 4, 7 ]
    , [ 2, 5, 8 ]
    , [ 0, 4, 8 ]
    , [ 2, 4, 6 ]
    ]


matchCombo : Array Square -> Square -> List Int -> Bool
matchCombo squares value combo =
    List.map (\pos -> Array.get pos squares) combo |> List.all (\n -> n == Just value)


getWinner : Model -> Bool
getWinner model =
    List.any (matchCombo model.squares model.turn) winningCombos


getValue : Square -> String
getValue value =
    case value of
        X ->
            "X"

        O ->
            "O"

        Empty ->
            ""
