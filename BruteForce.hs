module BruteForce where

import PointUtils

calcDistanceFromVector :: Point -> [Point] -> Float
calcDistanceFromVector point [] =  10001
calcDistanceFromVector point [pointb] =  euclidianDistance point pointb
calcDistanceFromVector point result =  minimum [ euclidianDistance point pointB | pointB <- result]

calcClosestDistanceFromInputBruteForce :: [Point] -> Float
calcClosestDistanceFromInputBruteForce [] =  10001
calcClosestDistanceFromInputBruteForce [point] =  10001
calcClosestDistanceFromInputBruteForce point =  minimum ([calcDistanceFromVector x y] ++ [ calcClosestDistanceFromInputBruteForce y])
    where
        (x:y) = point