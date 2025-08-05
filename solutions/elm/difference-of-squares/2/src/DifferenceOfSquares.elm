module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)


squareOfSum : Int -> Int
squareOfSum n =
    List.range 1 n
        |> sum
        |> square


sumOfSquares : Int -> Int
sumOfSquares n =
    List.range 1 n
        |> List.map square
        |> sum


difference : Int -> Int
difference n =
    squareOfSum n - sumOfSquares n


sum : List Int -> Int
sum =
    List.foldl (+) 0


square : Int -> Int
square n =
    n ^ 2
