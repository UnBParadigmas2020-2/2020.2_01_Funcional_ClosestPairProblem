
import PointUtils

main = do  
    file <- readFile("testes.txt")
    let list = (map (map read . words) . lines) file ::[[Int]]
    splitTests list
    print list


splitTests [] = return()
splitTests (h:t) = do
    print((map listToPoint (splitList (head h) t)))
    splitTests(drop (head h) t)
