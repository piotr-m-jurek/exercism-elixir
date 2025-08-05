module Gigasecond exposing (add)

import Time


add : Time.Posix -> Time.Posix
add posix =
    posix
        |> Time.toMillis Time.utc
        |> (\v -> (v + 10 ^ 9) * 1000)
        |> Time.millisToPosix
