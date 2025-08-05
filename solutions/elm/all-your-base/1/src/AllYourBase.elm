module AllYourBase exposing (rebase)


rebase : Int -> List Int -> Int -> Maybe (List Int)
rebase inBase digits outBase =
    if List.any (\d -> d < 0) digits then
        Nothing

    else if List.any (\d -> d >= inBase) digits then
        Nothing

    else if outBase <= 1 then
        Nothing

    else
        let
            dec =
                digits
                    |> List.reverse
                    |> List.indexedMap (toBase inBase)
                    |> List.reverse
                    |> List.foldl (+) 0

            out =
                convert dec outBase
        in
        if List.isEmpty out then
            Nothing

        else
            Just out


convert : Int -> Int -> List Int
convert num base =
    if num == 0 then
        []

    else
        convert (num // base) base ++ [ modBy base num ]


toBase : Int -> Int -> Int -> Int
toBase base index num =
    num * base ^ index
