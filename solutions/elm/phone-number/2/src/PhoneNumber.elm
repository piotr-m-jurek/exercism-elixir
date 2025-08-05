module PhoneNumber exposing (getNumber)

import Regex


getNumber : String -> Maybe String
getNumber phoneNumber =
    getNumber_ phoneNumber
        |> Maybe.andThen validateLength
        |> Maybe.andThen (validateIndex 0)
        |> Maybe.andThen (validateIndex 3)


getNumber_ : String -> Maybe String
getNumber_ num =
    "[0-9]"
        |> Regex.fromString
        |> Maybe.map (flip Regex.find num)
        |> Maybe.map (List.map .match >> String.concat)
        |> Maybe.map
            (\str ->
                if String.startsWith "1" str then
                    String.dropLeft 1 str

                else
                    str
            )


validateLength : String -> Maybe String
validateLength str =
    case String.length str of
        10 ->
            Just str

        _ ->
            Nothing


validateIndex : Int -> String -> Maybe String
validateIndex i str =
    case String.slice i (i + 1) str of
        "1" ->
            Nothing

        "0" ->
            Nothing

        _ ->
            Just str


flip : (a -> b -> c) -> b -> a -> c
flip fn a1 a2 =
    fn a2 a1
