module RobotSimulator exposing
    ( Bearing(..)
    , Robot
    , advance
    , dec
    , defaultRobot
    , inc
    , simulate
    , turnLeft
    , turnRight
    , updateX
    , updateY
    )


type Bearing
    = North
    | East
    | South
    | West


type alias Point =
    { x : Int
    , y : Int
    }


type alias Robot =
    { bearing : Bearing
    , coordinates : Point
    }


defaultRobot : Robot
defaultRobot =
    { bearing = North
    , coordinates = { x = 0, y = 0 }
    }


turnRight : Robot -> Robot
turnRight robot =
    let
        newBearing =
            case robot.bearing of
                North ->
                    East

                East ->
                    South

                South ->
                    West

                West ->
                    North
    in
    { robot | bearing = newBearing }


turnLeft : Robot -> Robot
turnLeft robot =
    let
        newBearing =
            case robot.bearing of
                North ->
                    West

                West ->
                    South

                South ->
                    East

                East ->
                    North
    in
    { robot | bearing = newBearing }


advance : Robot -> Robot
advance robot =
    let
        modifyCoords : Point -> Point
        modifyCoords =
            case robot.bearing of
                North ->
                    updateY inc

                South ->
                    updateY dec

                East ->
                    updateX inc

                West ->
                    updateX dec
    in
    { robot | coordinates = modifyCoords robot.coordinates }


inc : Int -> Int
inc x =
    x + 1


dec : Int -> Int
dec x =
    x - 1


updateX : (Int -> Int) -> Point -> Point
updateX f p =
    { p | x = f <| p.x }


updateY : (Int -> Int) -> Point -> Point
updateY f p =
    { p | y = f p.y }


simulate : String -> Robot -> Robot
simulate directions robot =
    directions
        |> String.split ""
        |> List.map getCommand
        |> List.foldl (\c r -> c r) robot


getCommand : String -> (Robot -> Robot)
getCommand letter =
    case letter of
        "L" ->
            turnLeft

        "R" ->
            turnRight

        "A" ->
            advance

        _ ->
            Debug.log "not implemented"
