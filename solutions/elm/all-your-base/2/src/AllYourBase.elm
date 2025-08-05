module AllYourBase exposing (rebase)


rebase : Int -> List Int -> Int -> Maybe (List Int)
rebase inBase digits outBase =
    if invalidateInput inBase digits outBase then
        Nothing

    else
        Just (toBase (toBase10 inBase digits) outBase)


invalidateInput : Int -> List Int -> Int -> Bool
invalidateInput inBase digits outBase =
    List.any (\d -> d >= inBase) digits
        || List.isEmpty digits
        || List.any (\d -> d < 0) digits
        || List.all (\d -> d <= 0) digits
        || (outBase < 2)
        || (inBase < 2)


toBase10 : Int -> List Int -> Int
toBase10 inBase digits =
    digits
        |> List.reverse
        |> List.indexedMap (\i n -> n * inBase ^ i)
        |> List.sum


toBase : Int -> Int -> List Int
toBase num base =
    case num of
        0 ->
            []

        _ ->
            toBase (num // base) base ++ [ remainderBy base num ]
