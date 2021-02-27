module InputUtils (getAllEntries, getMultipleLines) where

import PointUtils (Point(..), convertInputToPoint)

getAllEntries:: [String] -> [Point]
getAllEntries values = map convertInputToPoint values

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do
        x <- getLine
        xs <- getMultipleLines (n-1)
        return (x:xs)