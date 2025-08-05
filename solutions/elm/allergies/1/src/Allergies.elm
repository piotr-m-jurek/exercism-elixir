module Allergies exposing (Allergy(..), isAllergicTo, toList)

import Bitwise


type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats


isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    listOfAllergies
        |> List.filter (Tuple.second >> (>=) score)
        |> List.map Tuple.first
        |> List.member allergy


toList : Int -> List Allergy
toList score =
    listOfAllergies
        |> List.filter (Tuple.second >> matches score)
        |> List.map Tuple.first


matches : Int -> Int -> Bool
matches score =
    Bitwise.and score >> (<) 0


listOfAllergies : List ( Allergy, Int )
listOfAllergies =
    [ ( Eggs, 1 )
    , ( Peanuts, 2 )
    , ( Shellfish, 4 )
    , ( Strawberries, 8 )
    , ( Tomatoes, 16 )
    , ( Chocolate, 32 )
    , ( Pollen, 64 )
    , ( Cats, 128 )
    ]

