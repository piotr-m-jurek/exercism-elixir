module SpaceAge exposing (Planet(..), ageOn)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


planetFactor : Planet -> Float
planetFactor planet =
    case planet of
        Mercury ->
            0.2408467

        Venus ->
            0.61519726

        Earth ->
            1

        Mars ->
            1.8808158

        Jupiter ->
            11.862615

        Saturn ->
            29.447498

        Uranus ->
            84.016846

        Neptune ->
            164.79132


onEarth : Float -> Float
onEarth seconds =
    seconds / 31557600


ageOn : Planet -> Float -> Float
ageOn planet seconds =
    onEarth seconds / planetFactor planet



-- 1y - 31557600s
-- x - seconds
-- x = 1 * seconds / 31557600s
