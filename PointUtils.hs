module PointUtils where

import Data.List (sortBy)
import Data.Ord (comparing)


data Point = Point { x :: Float, y :: Float } deriving Show

euclidianDistance :: Point -> Point -> Float
euclidianDistance p1 p2 = sqrt (dx*dx + dy*dy)
    where
        dx = (x p1) - (x p2)
        dy = (y p1) - (y p2)

sortByX :: [Point] -> [Point]
sortByX = sortBy (comparing x)

sortByY :: [Point] -> [Point]
sortByY = sortBy (comparing y)
