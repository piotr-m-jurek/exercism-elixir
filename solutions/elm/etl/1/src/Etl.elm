module Etl exposing (transform)

import Dict exposing (Dict)


transform : Dict Int (List String) -> Dict String Int
transform input =
    input
        |> Dict.toList
        |> List.map toList
        |> List.foldr (++) []
        |> Dict.fromList


toList : ( Int, List String ) -> List ( String, Int )
toList ( k, vs ) =
    vs |> List.map (\v -> ( String.toLower v, k ))
