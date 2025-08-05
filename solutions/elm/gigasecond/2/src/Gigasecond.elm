module Gigasecond exposing (add)

import Time


add : Time.Posix -> Time.Posix
add posix =
    posix
        |> Time.posixToMillis
        |> (+) (10 ^ 12)
        |> Time.millisToPosix
