module BruteForce
( calcDistanceFromVector
, calcClosestDistanceFromInputBruteForce
) where

import PointUtils (Point(..), euclidianDistance)

calcDistanceFromVector :: Point -> [Point] -> Float
calcDistanceFromVector point [] =  10001
calcDistanceFromVector point [pointb] =  euclidianDistance point pointb
calcDistanceFromVector point result =  minimum [ euclidianDistance point pointB | pointB <- result]

calcClosestDistanceFromInputBruteForce :: [Point] -> Float
calcClosestDistanceFromInputBruteForce [] =  10001
calcClosestDistanceFromInputBruteForce [points] =  10001
calcClosestDistanceFromInputBruteForce points =  minimum (calcDistanceFromVector x y : [calcClosestDistanceFromInputBruteForce y])
    where
        x:y = points
