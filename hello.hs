-- PARADIGMA FUNCIONAL
-- ============================
-- Aplicação e composição
-- Funções de ordem superior (funções que recebem outras funções)
-- Avaliação preguiçosa (como no spark)
-- ghc = compilador 
-- ghci = interpretador


import Data.List(partition)


-- nomes de variaveis tem letras maiusculas

-- haskell é uma linguagem preguiçosa. Ele só vai utiliazar algo se for estritamente necessario. Isso permite a ciração de listas infinitas por exemplo
-- comentarios
-- operacoes sao igual C com excessao de diferente( /= ) e de not (é not ao inves de !)
-- toda "variavel" criada é uma funçao. Ex:

dobro x = x*2
-- executando seria "dobro 2"

delta a b c = b**2 - 4*a*c 

-- caso seja um numero negativo 

-- :t = mostra tipo da funçao
-- :l = carrega as funções do arqui9vo criado para que seja possivel executa-las pelo ghci
-- linguagem sensivel a identação

-- Definindo tipos da funcao
bhaskara :: Double -> Double -> Double -> [Double]

bhaskara a b c
    -- usa-se uma notação parecida com a de chaves matematicas:
    | d < 0 = []
    | d == 0 = [x']
    | otherwise = [x', x'']
    -- assim como na notação matematica tem o "onde x é tal tal tal e etc", acontece em haskell
    where
        d = delta a b c 
        x' = (-b + sqrt d) / (2*a)
        x'' = (-b - sqrt d) / (2*a)

-- especificando tipos da entrada

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib(n-2)
-- o jeito acima é muito lento por criar uma arvore de possibilidades. Melhor montar como:

fib2 :: Int -> Int
fib2 0 = 0
fib2 1 = 1
fib2 n = fib' 0 1 2
    where
        fib' n2 n1 i = if i == n 
            then n2 + n1 
            else fib' (n1) (n2+n1) (i+1)
-- no jeito acima, a chamada recursiva gera apenas uma chamada recursiva filha

-- utilizando lista infinita (avancado)
fibSeq = 0 : 1 : zipWith (+) fibSeq (tail fibSeq)

-- ====================================
    -- LISTAS
-- ====================================

-- concatenar listas:
-- a = [0,1] ++ [1,2,3,4]

-- String é lista de char 

-- [0..10] -- gera a lista [0,1,2,3,4,5,6,7,8,9,10]
-- [0,2..10] -- gera lista de 0 a 10, pulando de 2 em 2 (segundo parametro)
-- [0,10..] --gera lista infinita pulando de 10 em 10

-- operando ':' = separa a lista em head e tail=> [a] = a:[] ; [a,b] = a:[b] = a:b:[]
-- operando ',' = deconstroi tuplas => (g,t) = ([a],[b]) == g = [a] e t = [b]

-- Contando elementos da lista
len :: [a] -> Int
len [] = 0
len (h:t) = 1 + len t --ou f lista = f (tail lista)

sum' :: [Int] -> Int
sum' [] = 0
sum' (h:t) = h + sum' t

-- funcao fold = repete coisas para uma lista. foldr realiza esse processo da direita para esquerda da lista e foldl o contrario
foldr' :: (a -> b -> b) -> b -> [a] -> b 
foldr' f z [] = z 
foldr' f z (h:t) = f h (foldr' f z t)

-- outros exemplos (note que o parametro em parenteses representa uma função):

filter' :: (a -> Bool) -> [a] -> [a] 
filter' f [] = []
filter' f (h:t) =
    if f h 
        then h : filter' f t 
        else filter' f t

map' :: (a -> b) -> [a] -> [b]
map' f [] = []
map' f (h:t) = f h : map' f t


-- \x -> x `mod` 2 == 1

--quicksort

quicksort :: (Ord a) => [a] -> [a] 
quicksort [] = [] 
quicksort (pivot:t) = quicksort lt ++ [pivot] ++ quicksort gt
    where lt = filter ( < pivot) t
          gt = filter ( >= pivot) t

-- funcao partition: retorna uma tupla com os elementos que passaram na funcao de um lado e os que foram recusados do outro

-- :t partition = (a -> Bool) -> [a] -> ([a], [a])

-- zip = junta listas => zip [1..] ['a'..'d'] retorna ([1,'a'],[2,'b'],[3,'c'],[4,'d'])

