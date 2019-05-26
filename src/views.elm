module Views exposing (pageView)

import Array exposing (get)
import Helpers
import Html exposing (Html, button, div, h1, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types


squareView : Int -> Types.Model -> Html Types.Msg
squareView index model =
    div [ class "square", onClick <| Types.Move index ]
        [ text <| Helpers.getValue <| Maybe.withDefault Types.Empty <| get index model.squares ]


winnerBannerView : Types.Square -> Html Types.Msg
winnerBannerView winner =
    h1 [ class "winner-banner" ]
        [ text <|
            if winner /= Types.Empty then
                "Winner: " ++ Helpers.getValue winner

            else
                "Happy Gaming!"
        ]


newGameBtn =
    button [ onClick Types.ClearBoard, class "new-game-btn" ]
        [ text "New Game"
        ]


boardView : Types.Model -> Html Types.Msg
boardView model =
    div [ class "board" ]
        [ div [ class "row" ]
            [ squareView 0 model
            , squareView 1 model
            , squareView 2 model
            ]
        , div [ class "row" ]
            [ squareView 3 model
            , squareView 4 model
            , squareView 5 model
            ]
        , div [ class "row" ]
            [ squareView 6 model
            , squareView 7 model
            , squareView 8 model
            ]
        ]


pageView : Types.Model -> Html Types.Msg
pageView model =
    div [ class "wrapper" ]
        [ winnerBannerView model.winner
        , boardView model
        , newGameBtn
        ]
