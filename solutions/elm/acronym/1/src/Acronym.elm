module Acronym exposing (abbreviate)

import String


abbreviate : String -> String
abbreviate phrase =
    phrase
        |> String.replace "-" " "
        |> String.words
        |> List.map (String.left 1)
        |> String.join ""
        |> String.toUpper
