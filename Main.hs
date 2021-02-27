import BruteForce
import PointUtils
import Text.Printf

main = do
    entries <- getLine
    if (read entries :: Float) == 0
    then return()
    else do
        entriesInput <- getMultipleLines (read entries :: Int)
        let inputPoints = getAllEntries entriesInput
        let result = calcClosestDistanceFromInputBruteForce inputPoints
        if result > 10000 
            then putStrLn $ id "INFINITY"
            else printf "%.4f\n" result
        main

getAllEntries:: [String] -> [Point]
getAllEntries values = map convertInputToPoint values

getMultipleLines :: Int -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do
        x <- getLine
        xs <- getMultipleLines (n-1)
        return (x:xs)