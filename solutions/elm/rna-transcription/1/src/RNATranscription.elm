module RNATranscription exposing (toRNA)


toRNA : String -> Result Char String
toRNA dna =
    let
        l =
            dna |> String.toList |> List.map findCorresponding

        string =
            l
                |> List.filter (not << isErr)
                |> List.map filterOk
                |> String.concat
    in
    if List.any isErr l then
        Err 'y'

    else
        Ok string


filterOk : Result a String -> String
filterOk v =
    case v of
        Ok s ->
            s

        Err _ ->
            ""


isErr : Result a b -> Bool
isErr r =
    case r of
        Ok _ ->
            False

        Err _ ->
            True


findCorresponding : Char -> Result Char String
findCorresponding c =
    case c of
        'G' ->
            Ok "C"

        'C' ->
            Ok "G"

        'T' ->
            Ok "A"

        'A' ->
            Ok "U"

        _ ->
            Err 'Y'
