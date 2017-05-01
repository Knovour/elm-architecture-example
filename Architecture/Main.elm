module Architecture.Main exposing (..)

import Architecture.Video as Video
import Architecture.Audio as Audio

type alias Model =
  { video : Video.Model
  , audio : Audio.Model
  }


model : Model
model =
  { video = Video.model
  , audio = Audio.model
  }


type Msg
  = VideoMsg Video.Msg
  | AudioMsg Audio.Msg


update : Msg -> Model -> Model
update video model =
  case video of
    VideoMsg msg -> { model | video = Video.update msg model.video }
    AudioMsg msg -> { model | audio = Audio.update msg model.audio }
