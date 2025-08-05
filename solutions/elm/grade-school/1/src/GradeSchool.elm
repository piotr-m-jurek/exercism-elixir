module GradeSchool exposing (addStudent, allStudents, empty, studentsInGrade)

import Dict exposing (Dict)


type alias Grade =
    Int


type alias Student =
    String


type alias School =
    Dict Grade (List Student)


empty : School
empty =
    Dict.empty


addStudent : Grade -> Student -> School -> School
addStudent grade student school =
    Dict.update grade (updateStudentInGrade student) school


updateStudentInGrade : Student -> Maybe (List Student) -> Maybe (List Student)
updateStudentInGrade student list =
    case list of
        Just ss ->
            Just (List.sort <| student :: ss)

        Nothing ->
            Just [ student ]


studentsInGrade : Grade -> School -> List Student
studentsInGrade grade school =
    case Dict.get grade school of
        Just s ->
            s

        Nothing ->
            []


allStudents : School -> List ( Grade, List Student )
allStudents school =
    Dict.toList school
