import PointUtils
import PointUtils (Point(..))
points = [Point 0 2, Point 6 67, Point 43 71, Point 39 107, Point 189 140]
--points list order by x 
px = sortByX points
--points list order by y
py = sortByY points

getMiddleIndexFromList :: [a] -> Int
getMiddleIndexFromList [] = 0
getMiddleIndexFromList lst = ceiling (fromIntegral(length lst) / 2)

leftList :: [a] -> [a]
leftList a = x
    where 
        x = take (getMiddleIndexFromList a) a

rightList :: [a] -> [a]
rightList a = y
    where 
        y = drop (getMiddleIndexFromList a) a  

--calcula o tamanho de uma lista
length' :: (Num b) => [a] -> b 
length' [] = 0 
length' xs = sum [1 | _ <- xs]

--divide ordered px list in left and right lists
let l = leftList px
let r = rightList px
--sort l and r both by x and y coordinates
let lx = sortByX l
let ly = sortByY l
let rx = sortByX r
let ry = sortByY r



main = print(getMiddleIndexFromList points)

