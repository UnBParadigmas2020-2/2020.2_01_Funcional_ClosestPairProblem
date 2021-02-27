module PointUtils
( Point(..)
, euclidianDistance
, sortByX
, sortByY
, listToPoint
, splitList
) where

import Data.List (sortOn)

data Point = Point { x :: Float, y :: Float } deriving (Eq, Ord, Show)

euclidianDistance :: Point -> Point -> Float
euclidianDistance p1 p2 = sqrt (dx*dx + dy*dy)
    where
        dx = x p1 - x p2
        dy = y p1 - y p2

sortByX :: [Point] -> [Point]
sortByX = sortOn x

sortByY :: [Point] -> [Point]
sortByY = sortOn y

--[Int]= lista de inteiro
listToPoint:: [Int] -> Point
listToPoint point = Point (fromIntegral (point!!0)) (fromIntegral (point!!1))

splitList 0 list = []
splitList n (h:t) = h: splitList(n-1) t

splitList2:: Int -> [Point] -> [Point]
splitList2 0 _ = []
splitList2 n (h:t) = h: splitList(n-1) t