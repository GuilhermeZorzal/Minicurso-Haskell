import Data.List(partition, lookup)
import Data.Maybe(fromMaybe)

-- as vezes uma funçao pode retorna um valor valido ou retornar nada. Para isso é necessario tratar esses casos
-- Nothing - é passado quando a função retorna nada e Just é quando a função retorna algo

indiceLetra :: Char -> Int
indiceLetra c =
    case m of 
        Nothing -> 0
        Just i -> i
    where m = lookup c (zip ['A' .. 'Z'] [1..])

-- ou 
indiceLetra' :: Char -> Int
indiceLetra' c =
    fromMaybe 0 m
    where m = lookup c (zip ['A' .. 'Z'] [1..])

-- exemplo para pesquisa em lista
lookUpBy :: (a -> Bool) -> [a] -> Maybe a
lookUpBy f [] = Nothing
lookUpBy f (h:t) =
    if f h 
        then Just h
        else lookUpBy f t

-- exemplo de uso: lookUpBy (\p -> head p == 'a')  ["livro","casa","asas"] 
-- o \p significa que dado um p, 

eeeeeeee = (/2)