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
points = [Point 0 2, Point 6 67, Point 43 71, Point 39 107, Point 189 140]

length' :: (Num b) => [a] -> b 
length' [] = 0 
length' xs = sum [1 | _ <- xs]

getMiddleIndexFromList :: [a] -> Int
getMiddleIndexFromList [] = 0
getMiddleIndexFromList lst = ceiling (fromIntegral(length lst) / 2)

mid = getMiddleIndexFromList points
leftList :: [a] -> [a]
leftList a = x
    where 
        x = take (mid) a

--o tamanho da minha lista r = points len - leftList len

rightList :: [a] -> [a]
rightList a = y
    where 
        y = drop (mid) a  

main = print(getMiddleIndexFromList points)
l = leftList points
r = rightList points
--left = print(leftList points mid) 