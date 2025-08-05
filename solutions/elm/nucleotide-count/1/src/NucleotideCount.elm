module NucleotideCount exposing (nucleotideCounts)


type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


nucleotideCounts : String -> NucleotideCounts
nucleotideCounts sequence =
    sequence
        |> String.toList
        |> List.foldr incrementNucleotideCounts (NucleotideCounts 0 0 0 0)


incrementNucleotideCounts : Char -> NucleotideCounts -> NucleotideCounts
incrementNucleotideCounts v acc =
    case v of
        'A' ->
            { acc | a = acc.a + 1 }

        'T' ->
            { acc | t = acc.t + 1 }

        'C' ->
            { acc | c = acc.c + 1 }

        'G' ->
            { acc | g = acc.g + 1 }

        _ ->
            acc
