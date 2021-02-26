module DivideAndConquer (calcClosestDistanceFromInputDAC, divideAndConquer) where

import PointUtils (Point(..))
import ClosestPair (getMiddleIndexFromList)

divideAndConquer points left right = 10001
    where
        middle = getMiddleIndexFromList points
        dacLeft = divideAndConquer points left middle
        dacRight = divideAndConquer points (middle + 1) right

calcClosestDistanceFromInputDAC :: [Point] -> Float
calcClosestDistanceFromInputDAC [] =  10001
calcClosestDistanceFromInputDAC [points] =  10001
calcClosestDistanceFromInputDAC points =  divideAndConquer points 0 lastIndex
    where
        lastIndex = length points - 1
