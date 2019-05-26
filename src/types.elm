module Types exposing (Model, Msg(..), Square(..))

import Array exposing (Array)


type Square
    = X
    | O
    | Empty


type Msg
    = SetSquare Int
    | ClearBoard
    | Move Int
    | CheckWinner
    | ChangeTurn


type alias Model =
    { squares : Array Square, turn : Square, winner : Square }
