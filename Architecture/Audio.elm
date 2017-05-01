module Architecture.Audio exposing (..)



type alias Model =
  { isPlaying : Bool
  }


model : Model
model =
  { isPlaying = False
  }


type Msg
  = Play
  | Stop


update : Msg -> Model -> Model
update audio model =
  case audio of
    Play -> { isPlaying = True }
    Stop -> { isPlaying = False }
