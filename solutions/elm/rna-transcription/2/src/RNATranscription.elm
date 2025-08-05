module RNATranscription exposing (toRNA)


toRNA : String -> Result Char String
toRNA s =
    s
        |> String.toList
        |> List.map findCorresponding
        |> convert
        |> Result.map (List.map String.fromChar)
        |> Result.map (String.join "")


convert : List (Result Char Char) -> Result Char (List Char)
convert =
    List.foldr (Result.map2 (::)) (Ok [])


findCorresponding : Char -> Result Char Char
findCorresponding c =
    let
        _ =
            Debug.log " Incomming" c
    in
    case c of
        'C' ->
            Ok 'G'

        'G' ->
            Ok 'C'

        'A' ->
            Ok 'U'

        'T' ->
            Ok 'A'

        _ ->
            Err c
