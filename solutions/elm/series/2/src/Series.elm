module Series exposing (slices)


slices : Int -> String -> Result String (List (List Int))
slices size input =
    if String.length input <= 0 then
        Err "series cannot be empty"

    else if size == 0 then
        Err "slice length cannot be zero"

    else if size < 0 then
        Err "slice length cannot be negative"

    else if String.length input < size then
        Err "slice length cannot be greater than series length"

    else
        input
            |> String.split ""
            |> List.map String.toInt
            |> sequence
            |> Maybe.map (largestProductRec size)
            |> Result.fromMaybe "NOT IMPLEMENTED"


largestProductRec : Int -> List Int -> List (List Int)
largestProductRec length num =
    if List.length num <= length then
        [ num ]

    else
        List.take length num :: largestProductRec length (List.tail num |> Maybe.withDefault [])


sequence : List (Maybe a) -> Maybe (List a)
sequence =
    List.foldr (Maybe.map2 (::)) (Just [])
