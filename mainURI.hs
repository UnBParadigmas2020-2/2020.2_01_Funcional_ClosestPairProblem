
import GHC.Exts(sortWith)
--import Data.List.Key (sort)
import Text.Printf

main = do
    entries <- getLine
    if (read entries :: Float) == 0
    then return()
    else do
       entriesInput <- getMultipleLines (read entries :: Double)
       let inputPoints = getAllEntries entriesInput
       let result = fst (calcClosestDistanceFromInputDAC (sortByX inputPoints))
       if result > 10000 
            then putStrLn $ id "INFINITY"
            else printf "%.4f\n" result
       main


calcClosestDistanceFromInputDAC :: [Point] -> (Double, [Point])
calcClosestDistanceFromInputDAC [] =  (10001, [])
calcClosestDistanceFromInputDAC [points] =  (10001, [points])
calcClosestDistanceFromInputDAC points =  (realMin, s)
    where
        s = sortByY (a ++ b)
        minDistance = min minEsq minDir
        sLimited = getLeastDistanceIfLowerThan minDistance (getMiddleItemFromList points) points
        updateMin = calcClosestDistanceFromInputBruteForce sLimited
        realMin = min updateMin minDistance
        (minEsq, a) = calcClosestDistanceFromInputDAC (left)
        (minDir, b) = calcClosestDistanceFromInputDAC (right)
        (left, right) = halveArray(points)


getLeastDistanceIfLowerThan:: Double -> Point -> [Point] -> [Point]
getLeastDistanceIfLowerThan _ _ [] = []
getLeastDistanceIfLowerThan distance median [a] = isLowerThanMinimum distance (x median) a
getLeastDistanceIfLowerThan distance median points = 
    isLowerThanMinimum distance (x median) firstPoint ++ getLeastDistanceIfLowerThan distance median tail
    where
        (firstPoint:tail) = points

isLowerThanMinimum:: Double -> Double -> Point -> [Point]
isLowerThanMinimum distance median pointN = 
    if (euclidianDistance pointN pointB) < distance 
        then [pointN]
        else []
    where
        pointB = Point median yP
        yP = y pointN



data Point = Point { x :: Double, y :: Double } deriving (Eq, Ord, Show)

euclidianDistance :: Point -> Point -> Double
euclidianDistance p1 p2 = sqrt (dx*dx + dy*dy)
    where
        dx = x p1 - x p2
        dy = y p1 - y p2

sortByX :: [Point] -> [Point]
sortByX = sortWith x


sortByY :: [Point] -> [Point]
sortByY = sortWith y

convertInputToPoint:: String -> Point
convertInputToPoint input = Point x y
    where
        x = convertStringToFLoat $ head $ words input
        y = convertStringToFLoat $ last $ words input

convertStringToFLoat:: String -> Double
convertStringToFLoat str = read str :: Double


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


calcDistanceFromVector :: Point -> [Point] -> Double
calcDistanceFromVector point [] =  10001
calcDistanceFromVector point [pointb] =  euclidianDistance point pointb
calcDistanceFromVector point pointList =  minimum [ euclidianDistance point pointB | pointB <- pointList]

calcClosestDistanceFromInputBruteForce :: [Point] -> Double
calcClosestDistanceFromInputBruteForce [] =  10001
calcClosestDistanceFromInputBruteForce [points] =  10001
calcClosestDistanceFromInputBruteForce points =  minimum (calcDistanceFromVector x y : [calcClosestDistanceFromInputBruteForce y])
    where
        x:y = points



getAllEntries:: [String] -> [Point]
getAllEntries values = map convertInputToPoint values

getMultipleLines :: Double -> IO [String]
getMultipleLines n
    | n <= 0 = return []
    | otherwise = do
        x <- getLine
        xs <- getMultipleLines (n-1)
        return (x:xs)
