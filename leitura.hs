main = do  
    arquivo <- readFile("testes.txt")
    let lista = (map (map read . words) . lines) arquivo :: [[Int]]
    separaLista lista
    print lista


separaLista [] = return()
separaLista (h:t) = do
    let passo = montaLista (head h) t
    print passo
    separaLista (drop (head h) t)

montaLista 0 lista = []
montaLista n (h:t) = h: montaLista(n-1) t
