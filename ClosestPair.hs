import PointUtils

getMiddleIndexFromList :: [a] -> Int
getMiddleIndexFromList lst = ceiling (fromIntegral(length lst) / 2) - 1

getMiddleItemFromList :: [a] -> a
getMiddleItemFromList lst = lst !! getMiddleIndexFromList lst

halveArray :: [a] -> ([a], [a])
halveArray a = (x, y)
    where 
        x = take ((getMiddleIndexFromList a) + 1) a
        y = drop ((getMiddleIndexFromList a) + 1) a


-- 10001 por ser o valor definido no URI
closestPair :: [Point] -> Int
closestPair [] = 10001
closestPair [a] = 10001
closestPair lst = 0
    
