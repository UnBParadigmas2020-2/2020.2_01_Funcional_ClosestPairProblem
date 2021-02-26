module Conversion where

import PointUtils

listToPoint:: [Int] -> Point
listToPoint points = Point (intToFloat (points!!0)) (intToFloat (points!!1))

intToFloat :: Int -> Float
intToFloat = fromIntegral