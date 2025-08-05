module Hamming exposing (distance)


areSameLenght : String -> String -> Bool
areSameLenght a b =
    String.length a == String.length b


distance : String -> String -> Result String Int
distance left right =
    if not (areSameLenght left right) then
        Err "left and right strands must be of equal length"

    else
        List.map2 areLettersSame (String.toList left) (String.toList right)
            |> List.sum
            |> Ok


areLettersSame : Char -> Char -> Int
areLettersSame a b =
    if a == b then
        0

    else
        1
