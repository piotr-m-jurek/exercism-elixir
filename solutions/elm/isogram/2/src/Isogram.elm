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
    in
    case compare (List.length list) (Set.size unique) of
        EQ ->
            True

        GT ->
            False

        LT ->
            False
