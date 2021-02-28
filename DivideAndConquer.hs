module DivideAndConquer (calcClosestDistanceFromInputDAC, divideAndConquer) where

import Debug.Trace

import PointUtils (Point(..), sortByY, euclidianDistance, sortByX)
import ClosestPair (getMiddleIndexFromList, halveArray, getMiddleItemFromList)
import BruteForce (calcClosestDistanceFromInputBruteForce)

calcClosestDistanceFromInputDAC :: [Point] -> (Double, [Point])
calcClosestDistanceFromInputDAC [] =  (10001, [])
calcClosestDistanceFromInputDAC [points] =  (10001, [points])
calcClosestDistanceFromInputDAC points =  (realMin, s)
    where

        s = sortByY sLimited
        minDistance = min minEsq minDir
        sLimited = getLeastDistanceIfLowerThan minDistance (getMiddleItemFromList points) points
        updateMin = calcClosestDistanceFromInputBruteForce sLimited
        realMin = min updateMin minDistance
        (minEsq, a) = calcClosestDistanceFromInputDAC (left)
        (minDir, b) = calcClosestDistanceFromInputDAC (right)
        (left, right) = halveArray(points)


getLeastDistanceIfLowerThan:: Double -> Point -> [Point] -> [Point]
getLeastDistanceIfLowerThan _ _ [] = []
getLeastDistanceIfLowerThan distance median [a] = isLowerThanMinimum distance (y median) a 
getLeastDistanceIfLowerThan distance median points = 
    isLowerThanMinimum distance (y median) firstPoint ++ getLeastDistanceIfLowerThan distance median tail
    where
        (firstPoint:tail) = points

isLowerThanMinimum:: Double -> Double -> Point -> [Point]
isLowerThanMinimum distance median pointN = 
    if (euclidianDistance pointN pointB) < distance 
        then [pointN]
        else []
    where
        pointB = Point xP median
        xP = x pointN
