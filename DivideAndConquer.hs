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



getMinAB:: [Point] -> [Point]                                                           -- Recebe Lista completa(ordenada em x) de Point's separa na metade
getMinAB points = findListMin points:findListMin(drop middle points):[]                 -- e acha MinA(Point) e MinB(Point) e retorna [MinA, MinB]
    where 
        middle = getMiddleIndexFromList points ::Int

findListMin points
    | length points <= 1 = points!!0
    | otherwise = findListMin (splitList middle points)
    where 
        middle = getMiddleIndexFromList points ::Int
