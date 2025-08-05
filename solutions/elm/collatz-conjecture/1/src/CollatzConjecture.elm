module CollatzConjecture exposing (collatz)


collatz : Int -> Result String Int
collatz start =
    if start <= 0 then
        Err "Only positive numbers are allowed"

    else if start == 1 then
        Ok 0

    else if isEven start then
        Result.map ((+) 1) (collatz (start // 2))

    else
        Result.map ((+) 1) (collatz ((3 * start) + 1))


isEven : Int -> Bool
isEven x =
    remainderBy 2 x == 0
