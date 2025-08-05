module PhoneNumber exposing (getNumber)

import Regex


getNumber : String -> Maybe String
getNumber phoneNumber =
    let
        number =
            matchNumber phoneNumber

        length =
            String.length number

        startAreaCode =
            String.left 1 number

        startExchangeArea =
            number |> String.left 4 |> String.right 1

        checkDigit =
            Regex.contains (Regex.fromString "0|1" |> Maybe.withDefault Regex.never)

        prerequisites : List Bool
        prerequisites =
            [ length /= 10
            , checkDigit startAreaCode
            , checkDigit startExchangeArea
            ]
    in
    if checkDigit startAreaCode && length > 10 then
        number |> String.dropLeft 1 |> getNumber

    else if List.any ((==) True) prerequisites then
        Nothing

    else
        Just number


matchNumber : String -> String
matchNumber num =
    "[0-9]"
        |> Regex.fromString
        |> Maybe.withDefault Regex.never
        |> flip Regex.find num
        |> List.map .match
        >> String.concat


flip : (a -> b -> c) -> b -> a -> c
flip fn a1 a2 =
    fn a2 a1
