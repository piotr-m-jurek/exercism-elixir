module Anagram exposing (detect)


detect : String -> List String -> List String
detect word candidates =
    let
        checker =
            chars word |> areListsEqual
    in
    candidates
        |> List.filter (chars >> checker)


areListsEqual : List comparable -> List comparable -> Bool
areListsEqual a b =
    a /= b && List.sort a == List.sort b


chars : String -> List Char
chars =
    String.toLower >> String.toList
