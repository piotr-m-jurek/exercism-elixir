module Etl exposing (transform)

import Dict exposing (Dict)


transform : Dict Int (List String) -> Dict String Int
transform input =
    input
        |> Dict.toList
        |> List.concatMap pair
        |> Dict.fromList


pair : ( Int, List String ) -> List ( String, Int )
pair ( k, vs ) =
    vs |> List.map (\v -> ( String.toLower v, k ))
