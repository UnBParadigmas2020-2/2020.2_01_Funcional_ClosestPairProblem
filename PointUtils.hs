module PointUtils
( Point(..)
, euclidianDistance
, sortByX
, sortByY
, convertInputToPoint
, convertStringToFLoat
) where

import Data.List (sortOn)

data Point = Point { x :: Float, y :: Float } deriving (Eq, Ord, Show)

euclidianDistance :: Point -> Point -> Float
euclidianDistance p1 p2 = sqrt (dx*dx + dy*dy)
    where
        dx = x p1 - x p2
        dy = y p1 - y p2

sortByX :: [Point] -> [Point]
sortByX = sortOn x

sortByY :: [Point] -> [Point]
sortByY = sortOn y

convertInputToPoint:: String -> Point
convertInputToPoint input = Point x y
    where
        x = convertStringToFLoat $ head $ words input
        y = convertStringToFLoat $ last $ words input

convertStringToFLoat:: String -> Float
convertStringToFLoat str = read str :: Float

