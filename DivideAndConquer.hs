
module DivideAndConquer (calcClosestDistanceFromInputDAC, getMinAB, findListMin, listAB) where

import PointUtils
import ClosestPair (getMiddleIndexFromList)
import Data.Ord

getMinAB:: [Point] -> [Point]
getMinAB points = findListMin points:findListMin(drop middle points):[]
    where 
        middle = getMiddleIndexFromList points ::Int

findListMin points
    | length points <= 1 = points!!0
    | otherwise = findListMin (splitList middle points)
    where 
        middle = getMiddleIndexFromList points ::Int
		
listAB:: [Point] -> [[Point]]
listAB list = splitList middle list : drop middle list : []
    where 
        middle = getMiddleIndexFromList list ::Int

calcClosestDistanceFromInputDAC:: [Point] -> [Point]
calcClosestDistanceFromInputDAC [] =  []
calcClosestDistanceFromInputDAC [points] =  []
calcClosestDistanceFromInputDAC points =  getMinAB (sortByX points)
