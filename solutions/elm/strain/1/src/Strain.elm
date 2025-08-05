module Strain exposing (discard, keep)


keep : (a -> Bool) -> List a -> List a
keep predicate list =
    case list of
        x :: rest ->
            if predicate x then
                x :: keep predicate rest

            else
                keep predicate rest

        [] ->
            []


discard : (a -> Bool) -> List a -> List a
discard predicate list =
    keep (not << predicate) list

