module DivideAndConquer (calcClosestDistanceFromInputDAC, divideAndConquer) where

import Debug.Trace

import PointUtils (Point(..), sortByY, euclidianDistance, sortByX)
import ClosestPair (getMiddleIndexFromList, halveArray, getMiddleItemFromList)
import BruteForce (calcClosestDistanceFromInputBruteForce)

divideAndConquer points left right = 10001
    where
        middle = getMiddleIndexFromList points
        dacLeft = divideAndConquer points left middle
        dacRight = divideAndConquer points (middle + 1) right

points = [Point 0 2, Point 6 67, Point 43 71, Point 39 107, Point 189 140]

calcClosestDistanceFromInputDAC :: [Point] -> (Float, [Point])
calcClosestDistanceFromInputDAC [] =  (10001, [])
calcClosestDistanceFromInputDAC [points] =  (10001, [points])
calcClosestDistanceFromInputDAC points =  (realMin, s)
    where
        s = sortByY (a ++ b)
        minDistance = min minEsq minDir
        sLimited = getLeastDistanceIfLowerThan minDistance (getMiddleItemFromList points) points
        updateMin = calcClosestDistanceFromInputBruteForce sLimited
        realMin = min updateMin ((trace $ show minDistance) ( minDistance ))
        (minEsq, a) = calcClosestDistanceFromInputDAC (left)
        (minDir, b) = calcClosestDistanceFromInputDAC (right)
        (left, right) = halveArray(points)


getLeastDistanceIfLowerThan:: Float -> Point -> [Point] -> [Point]
getLeastDistanceIfLowerThan _ _ [] = []
getLeastDistanceIfLowerThan distance median [a] = isLowerThanMinimum distance (y median) a 
getLeastDistanceIfLowerThan distance median points = 
    isLowerThanMinimum distance (y median) firstPoint ++ getLeastDistanceIfLowerThan distance median tail
    where
        (firstPoint:tail) = points

isLowerThanMinimum:: Float -> Float -> Point -> [Point]
isLowerThanMinimum distance median pointN = 
    if (euclidianDistance pointN pointB) < distance 
        then [pointN]
        else []
    where
        pointB = Point xP median
        xP = x pointN