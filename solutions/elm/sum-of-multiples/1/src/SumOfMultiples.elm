module SumOfMultiples exposing (sumOfMultiples)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =
    List.range 1 (limit - 1)
        |> List.filter (isDividableBy divisors)
        |> List.foldl (+) 0


isDividableBy : List Int -> Int -> Bool
isDividableBy divisors num =
    List.any (\d -> remainderBy d num == 0) divisors
