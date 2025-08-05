module Raindrops exposing (raindrops)


raindrops : Int -> String
raindrops number =
    if isFactor 3 number || isFactor 5 number || isFactor 7 number then
        getRaindropString number

    else
        String.fromInt number


getRaindropString : Int -> String
getRaindropString n =
    String.concat
        [ if isFactor 3 n then
            "Pling"

          else
            ""
        , if isFactor 5 n then
            "Plang"

          else
            ""
        , if isFactor 7 n then
            "Plong"

          else
            ""
        ]


isFactor : Int -> Int -> Bool
isFactor a b =
    remainderBy a b == 0



{-
   The rules of raindrops are that if a given number:

   has 3 as a factor, add 'Pling' to the result.
   has 5 as a factor, add 'Plang' to the result.
   has 7 as a factor, add 'Plong' to the result.
   does not have any of 3, 5, or 7 as a factor, the result should be the digits of the number.

-}
