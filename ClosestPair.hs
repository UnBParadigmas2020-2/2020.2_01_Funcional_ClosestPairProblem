module ClosestPair where

import PointUtils

getMiddleIndexFromList :: [a] -> Int
getMiddleIndexFromList [] = 0
getMiddleIndexFromList lst = ceiling (fromIntegral(length lst) / 2) - 1

getMiddleItemFromList :: [a] -> a
getMiddleItemFromList lst = lst !! getMiddleIndexFromList lst

halveArray :: [a] -> ([a], [a])
halveArray a = (x, y)
    where 
        x = take (getMiddleIndexFromList a + 1) a
        y = drop (getMiddleIndexFromList a + 1) a
