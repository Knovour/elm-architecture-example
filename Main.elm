module Main exposing (..)
import Html exposing (Html, div, input, button, text, h1, p)
import Html.Attributes exposing (type_, name, placeholder, value)
import Html.Events exposing (onClick, onInput)

import Architecture.Main as Main exposing (..)
import Architecture.Video exposing (..)
import Architecture.Audio exposing (..)



main : Program Never Main.Model Main.Msg
main =
  Html.beginnerProgram
    { model = Main.model
    , view = view
    , update = Main.update
    }



-- VIEW

view : Main.Model -> Html Main.Msg
view model =
  div []
    [ div []
      [ h1 [] [ text "Video" ]
      , input
        [ type_ "text"
        , name "video"
        , placeholder "video"
        , value model.video.typing
        , onInput (\val -> VideoMsg <| Type val)
        ] []
      , button [ onClick (VideoMsg Add) ] [ text "add video" ]
      , button [ onClick (VideoMsg Clear) ] [ text "clear" ]
      , p [] [ text (String.join ", " model.video.list) ]
      ]
    , div []
      [ h1 [] [ text "Audio" ]
      , button [ onClick (AudioMsg Play) ] [ text "play" ]
      , button [ onClick (AudioMsg Stop) ] [ text "stop" ]
      , p [] [ text ("Is Playing: " ++ (toString model.audio.isPlaying)) ]
      ]
    ]
