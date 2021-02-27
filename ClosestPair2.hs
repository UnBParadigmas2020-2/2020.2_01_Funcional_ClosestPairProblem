--module ClosestPair
--( getMiddleIndexFromList
--, getMiddleItemFromList
--, halveArray
--) where

--calcula o tamanho da metade da lista
--sortByX :: [Point] -> [Point]
--sortByX = sortOn x

--sortByY :: [Point] -> [Point]
--sortByY = sortOn y

import PointUtils (Point(..))
points = [Point 0 2, Point 6 67, Point 43 71, Point 39 107, Point 189 140] ++ [Point 0 2, Point 6 67, Point 43 71, Point 39 107, Point 189 140]

getMiddleIndexFromList :: [a] -> Int
getMiddleIndexFromList [] = 0
getMiddleIndexFromList lst = ceiling (fromIntegral(length lst) / 2)

mid = getMiddleIndexFromList points
halveArray :: [a] -> [a]
halveArray a = x
    where 
        x = take (mid) a
        --y = drop (getMiddleIndexFromList a + 1) a




main = print(getMiddleIndexFromList points)
leftList = print(halveArray points)
--left = print(leftList points mid) 