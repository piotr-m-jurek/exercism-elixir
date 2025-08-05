module Leap exposing (isLeapYear)


isLeapYear : Int -> Bool
isLeapYear year =
    by400 year || (by4 year && not (by100 year))


byX : Int -> Int -> Bool
byX x n =
    remainderBy x n == 0


by4 : Int -> Bool
by4 =
    byX 4


by100 : Int -> Bool
by100 =
    byX 100


by400 : Int -> Bool
by400 =
    byX 400
