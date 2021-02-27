
import PointUtils
import DivideAndConquer

main = do  
    file <- readFile("testes.txt")
    let list = (map (map read . words) . lines) file ::[[Int]]
    splitTests list
    print list


splitTests [] = return()
splitTests (h:t) = do
    let list = (map listToPoint (splitList (head h) t))
    print "Lista completa:"
    print list
    let listaAB = listAB (sortByX list)
    print "Lista A"
    print(listaAB!!0)
    print "Lista B"
    print(listaAB!!1)
    let minAB = calcClosestDistanceFromInputDAC list
    print "minA e minB"
    print(minAB)
    print "global_min"
    print(minAB!!0)
    print "Lista completa sortedByY"
    print (sortByY list)
    splitTests(drop (head h) t)
