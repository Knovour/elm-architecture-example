module Architecture.Video exposing (..)



type alias Model =
  { list : List String
  , typing: String
  }


model : Model
model =
  { list = []
  , typing = ""
  }


type Msg
  = Type String
  | Add
  | Clear


update : Msg -> Model -> Model
update video model =
  case video of
    Type str -> { model | typing = str }
    Add ->
      if model.typing /= "" then
        { model
        | list = (model.typing :: model.list)
        , typing = ""
        }
      else
        model
    Clear -> { model | list = [] }
