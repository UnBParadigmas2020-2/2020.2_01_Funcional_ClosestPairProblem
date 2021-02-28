import BruteForce
import Text.Printf
import InputUtils

main = do
    entries <- getLine
    if (read entries :: Float) == 0
    then return()
    else do
        entriesInput <- getMultipleLines (read entries :: Double)
        let inputPoints = getAllEntries entriesInput
        let result = calcClosestDistanceFromInputBruteForce inputPoints
        if result > 10000 
            then putStrLn $ id "INFINITY"
            else printf "%.4f\n" result
        main

