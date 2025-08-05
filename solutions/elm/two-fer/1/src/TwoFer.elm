module TwoFer exposing (twoFer)


twoFer : Maybe String -> String
twoFer name =
    let
        newName =
            case name of
                Just n ->
                    n

                Nothing ->
                    "you"
    in
    "One for " ++ newName ++ ", one for me."
