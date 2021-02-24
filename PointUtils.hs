module PointUtils where

import Data.List (sortBy)
import Data.Ord (comparing)


data Point = Point { x :: Float, y :: Float } deriving Show

points = [Point 4 4, Point 1 1, Point 2 2, Point 3 3, Point 5 5, Point 6 6]

euclidianDistance :: Point -> Point -> Float
euclidianDistance p1 p2 = sqrt (dx*dx + dy*dy)
    where
        dx = (x p1) - (x p2)
        dy = (y p1) - (y p2)

sortByX :: [Point] -> [Point]
sortByX = sortBy (comparing x)

sortByY :: [Point] -> [Point]
sortByY = sortBy (comparing y)
