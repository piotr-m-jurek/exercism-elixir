module ArmstrongNumbers exposing (isArmstrongNumber)


isArmstrongNumber : Int -> Bool
isArmstrongNumber nb =
    let
        list =
            nb
                |> String.fromInt
                |> String.split ""
                |> List.map String.toInt
                |> List.map (Maybe.withDefault 0)

        length =
            List.length list
    in
    list
        |> List.foldl (\v acc -> acc + v ^ length) 0
        |> (==) nb
