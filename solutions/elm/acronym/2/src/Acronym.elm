module Acronym exposing (abbreviate)

import Regex


abbreviate : String -> String
abbreviate phrase =
    phrase
        |> Regex.split splitReg
        |> List.map (String.left 1)
        |> String.join ""
        |> String.toUpper


splitReg : Regex.Regex
splitReg =
    "( |-)"
        |> Regex.fromString
        |> Maybe.withDefault Regex.never
