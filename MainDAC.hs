import DivideAndConquer
import Text.Printf
import InputUtils
import PointUtils (sortByY)

main = do
    entries <- getLine
    if (read entries :: Float) == 0
    then return()
    else do
        entriesInput <- getMultipleLines (read entries :: Int)
        let inputPoints = getAllEntries entriesInput
        let (result, _) = calcClosestDistanceFromInputDAC $ sortByY inputPoints
        if result > 10000 
            then putStrLn $ id "INFINITY"
            else printf "%.4f\n" result
        main

