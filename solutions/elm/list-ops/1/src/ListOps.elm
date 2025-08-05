module ListOps exposing
    ( append
    , concat
    , filter
    , foldl
    , foldr
    , length
    , map
    , reverse
    )


length : List a -> Int
length list =
    case list of 
        [] -> 0
        _:: t -> 1 + length t


reverse : List a -> List a
reverse list =
    case list of 
        [] -> []
        h :: t -> (reverse t) ++ [h]


foldl : (a -> b -> b) -> b -> List a -> b
foldl f acc list =
    case list of 
        [] -> acc
        h :: t -> foldl f (f h acc) t


foldr : (a -> b -> b) -> b -> List a -> b
foldr f acc list =
    case reverse list of
        [] -> acc
        h :: t -> foldl f (f h acc) t


map : (a -> b) -> List a -> List b
map f list =
    case list of
        [] -> []
        h :: t -> [ f h ] ++ map f t




filter : (a -> Bool) -> List a -> List a
filter f list =
    case list of 
        [] -> []
        h :: [] -> 
            if f h then [h]
            else [] 
        h :: t -> 
            if f h then h :: filter f t
            else filter f t

append : List a -> List a -> List a
append xs ys =
    xs ++ ys


concat : List (List a) -> List a
concat list =
    case list of 
        [] -> []
        h :: t -> h ++ concat t
