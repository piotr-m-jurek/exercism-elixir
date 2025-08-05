module Isogram exposing (isIsogram)

import Set


isIsogram : String -> Bool
isIsogram sentence =
    let
        list =
            sentence
                |> String.toLower
                |> String.toList
                |> List.filter Char.isAlphaNum

        unique =
            list
                |> Set.fromList
                |> Set.toList
    in
    case compare (List.length list) (List.length unique) of
        EQ ->
            True

        GT ->
            False

        LT ->
            False
