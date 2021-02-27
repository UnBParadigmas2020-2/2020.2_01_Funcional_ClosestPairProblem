module BruteForce where

import PointUtils

calcDistanceFromVector :: Point -> [Point] -> Float
calcDistanceFromVector point [] =  10001
calcDistanceFromVector point [pointb] =  euclidianDistance point pointb
calcDistanceFromVector point pointList =  minimum [ euclidianDistance point pointB | pointB <- pointList]

calcClosestDistanceFromInputBruteForce :: [Point] -> Float
calcClosestDistanceFromInputBruteForce [] =  10001
calcClosestDistanceFromInputBruteForce [point] =  10001
calcClosestDistanceFromInputBruteForce point =  minimum ([calcDistanceFromVector x y] ++ [ calcClosestDistanceFromInputBruteForce y])
    where
        (x:y) = point