module BinarySearch exposing (find)

import Array exposing (Array)


find : Int -> Array Int -> Maybe Int
find target xs =
    binarySearch target xs 0


binarySearch : Int -> Array Int -> Int -> Maybe Int
binarySearch target xs offset =
    let
        len =
            Array.length xs

        mid =
            len // 2

        lower =
            Array.slice 0 mid xs

        upper =
            Array.slice (mid + 1) len xs
    in
    Array.get mid xs
        |> Maybe.andThen
            (\val ->
                case compare val target of
                    EQ ->
                        Just (mid + offset)

                    GT ->
                        binarySearch target lower offset

                    LT ->
                        binarySearch target upper (offset + mid + 1)
            )
