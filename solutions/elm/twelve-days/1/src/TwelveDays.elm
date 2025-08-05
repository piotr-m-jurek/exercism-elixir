module TwelveDays exposing (recite)

import Array exposing (Array)


phrase : Int -> String
phrase idx =
    let
        day =
            days |> Array.get idx |> Maybe.withDefault ""
    in
    "On the " ++ day ++ " day of Christmas my true love gave to me: "


gift : Array String -> Int -> String
gift dict idx =
    let
        _ =
            Debug.log "IDX: " idx
    in
    case idx of
        0 ->
            (Array.get 0 dict |> Maybe.withDefault "") ++ "."

        1 ->
            (Array.get 1 dict |> Maybe.withDefault "") ++ ", and " ++ (Array.get 0 dict |> Maybe.withDefault "") ++ "."

        _ ->
            let
                phr =
                    Array.get idx dict |> Maybe.withDefault ""
            in
            phr ++ ", " ++ gift dict (idx - 1)


recite : Int -> Int -> List String
recite start stop =
    if start <= 0 || stop <= 0 then
        []

    else
        List.range (start - 1) (stop - 1)
            |> List.map (\idx -> phrase idx ++ gift gifts idx)


days : Array String
days =
    Array.fromList
        [ "first"
        , "second"
        , "third"
        , "fourth"
        , "fifth"
        , "sixth"
        , "seventh"
        , "eighth"
        , "ninth"
        , "tenth"
        , "eleventh"
        , "twelfth"
        ]


gifts : Array String
gifts =
    Array.fromList
        [ "a Partridge in a Pear Tree"
        , "two Turtle Doves"
        , "three French Hens"
        , "four Calling Birds"
        , "five Gold Rings"
        , "six Geese-a-Laying"
        , "seven Swans-a-Swimming"
        , "eight Maids-a-Milking"
        , "nine Ladies Dancing"
        , "ten Lords-a-Leaping"
        , "eleven Pipers Piping"
        , "twelve Drummers Drumming"
        ]
