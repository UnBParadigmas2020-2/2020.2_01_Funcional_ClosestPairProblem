

main = do  
    arquivo <- readFile("testes.txt")
    let lista = (map (map read . words) . lines) arquivo :: [[Int]]
    print lista
