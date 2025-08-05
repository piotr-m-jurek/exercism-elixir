module Pangram exposing (isPangram)

import Regex


isPangram : String -> Bool
isPangram sentence =
    if String.length sentence == 0 then
        False

    else
        sentence
            |> String.toLower
            |> String.filter Char.isAlpha
            |> String.foldr concatUniqueChar ""
            |> String.length
            |> (==) 26


concatUniqueChar : Char -> String -> String
concatUniqueChar v acc =
    let
        ch =
            String.fromChar v
    in
    if String.contains ch acc then
        acc

    else
        acc ++ ch
