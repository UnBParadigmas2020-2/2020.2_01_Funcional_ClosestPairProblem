
import Conversion

main = do  
    file <- readFile("testes.txt")
    let list = (map (map read . words) . lines) file ::[[Int]]
    splitCases list
    print list


splitCases [] = return()
splitCases (h:t) = do
    let pointsList = getPointsList (head h) t
    print(map listToPoint pointsList)
    splitCases(drop (head h) t)


getPointsList 0 lista = []
getPointsList n (h:t) = h: getPointsList(n-1) t
