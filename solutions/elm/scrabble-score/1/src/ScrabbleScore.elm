module ScrabbleScore exposing (scoreWord)

import List


scoreWord : String -> Int
scoreWord x =
    x
        |> String.split ""
        |> List.map String.toLower
        |> List.foldl (\el acc -> acc + scoreLetter el) 0


scoreLetter : String -> Int
scoreLetter c =
    letterScore
        |> List.filter (\( _, ls ) -> String.contains c ls)
        |> List.head
        |> Maybe.map Tuple.first
        |> Maybe.withDefault 0


letterScore : List ( Int, String )
letterScore =
    [ ( 1, "aeioulnrst" )
    , ( 2, "dg" )
    , ( 3, "bcmp" )
    , ( 4, "fhvwy" )
    , ( 5, "k" )
    , ( 8, "jx" )
    , ( 10, "qz" )
    ]
