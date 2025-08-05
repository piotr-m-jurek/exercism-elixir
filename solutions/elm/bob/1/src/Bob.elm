module Bob exposing (hey)


hey : String -> String
hey r =
    let
        remark =
            String.trim r
    in
    if remark |> String.isEmpty then
        "Fine. Be that way!"

    else if remark |> String.toList |> List.any Char.isAlpha then
        if String.right 1 remark == "?" then
            if String.toUpper remark == remark then
                "Calm down, I know what I'm doing!"

            else
                "Sure."

        else if String.toUpper remark == remark then
            "Whoa, chill out!"

        else
            "Whatever."

    else if String.right 1 remark == "?" then
        "Sure."

    else
        "Whatever."
