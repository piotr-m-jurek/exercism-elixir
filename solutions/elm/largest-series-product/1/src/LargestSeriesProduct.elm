module LargestSeriesProduct exposing (largestProduct)


largestProduct : Int -> String -> Maybe Int
largestProduct length series =
    if String.length series < length || length < 0 then
        Nothing

    else if length == 0 then
        Just 1

    else
        getIntsFromStr series
            |> Maybe.map (largestProductRec length 0)


largestProductRec : Int -> Int -> List Int -> Int
largestProductRec length max num =
    if List.length num < length then
        max

    else
        largestProductRec length
            (List.maximum [ List.take length num |> List.foldl (*) 1, max ] |> Maybe.withDefault 1)
            (Maybe.withDefault [] (List.tail num))


getIntsFromStr : String -> Maybe (List Int)
getIntsFromStr =
    String.split ""
        >> List.map String.toInt
        >> sequence


sequence : List (Maybe a) -> Maybe (List a)
sequence =
    List.foldl (Maybe.map2 (::)) (Just [])
