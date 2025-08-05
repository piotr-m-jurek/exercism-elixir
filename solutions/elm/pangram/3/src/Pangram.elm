module Pangram exposing (isPangram)

import Set


isPangram : String -> Bool
isPangram sentence =
    else
        sentence
            |> String.toLower
            |> String.filter Char.isAlpha
            |> String.toList
            |> Set.fromList
            |> Set.size
            |> (==) 26
