module Conversion where

import PointUtils

listToPoint:: [Int] -> Point
listToPoint point = Point (intToFloat (point!!0)) (intToFloat (point!!1))

intToFloat :: Int -> Float
intToFloat = fromIntegral