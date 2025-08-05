module Triangle exposing (rows)


rows : Int -> List (List Int)
rows n =
    List.range 1 n |> List.map row


row : Int -> List Int
row n =
    case n of
        0 ->
            []

        1 ->
            [ 1 ]

        _ ->
            let
                prev =
                    row (n - 1)
            in
            List.map2 (+) (0 :: prev) (List.append prev [ 0 ])
