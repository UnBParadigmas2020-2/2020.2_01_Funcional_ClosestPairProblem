
main = do  
    arquivo <- readFile("testes.txt")
    let lista = (map (map read . words) . lines) arquivo :: [[Int]]
    separaLista lista
    print lista


separaLista [] = return()
separaLista (h:t) = do
    let subLista = montaSubLista (head h) t
    print subLista
    separaLista (drop (head h) t)

montaSubLista 0 lista = []
montaSubLista n (h:t) = h: montaSubLista(n-1) t
