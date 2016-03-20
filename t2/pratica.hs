-- Eleva um numero ao quadrado (isto eh um comentario!)
doubleMe :: Int -> Int
doubleMe x = x^2

-- Verifica se um numero eh par (usa if/then/else para expressar funcao condicional)
-- mod: retorna resto da divisao inteira
isEven :: Int -> Bool
isEven n = if mod n 2 == 0 then True else False

-- Gera um numero a partir de um caracter (usa outra estrutura condicional em Haskell)
encodeMe :: Char -> Int
encodeMe c 
 | c == 'S'  = 0
 | c == 'N'  = 1
 | otherwise = 2

-- Calcula o quadrado do primeiro elemento da lista
-- Note que '[Int]' designa uma lista de elementos do tipo Int 
doubleFirst :: [Int] -> Int
doubleFirst lis = (head lis)^2

-- 1 calcule a soma dos quadrados de dois números x e y.
somaQuad :: Int -> Int -> Int
somaQuad x y = (x^2) + (y^2)

-- 2 verifique se 2 listas possuem o mesmo primeiro elemento
hasEqHeads :: [Int] -> [Int] -> Bool
hasEqHeads lis1 lis2 = if ((head lis1) == (head lis2)) then True else False

-- 3 receba uma lista de nomes e adicione a string "Sr. "
sr :: [String] -> [String]
sr lis =  map ("Sr. "++) lis

-- 4 receba uma string e retorne o número de espaços nela contidos. 
-- Dica: aplique 2 funções consecutivamente.

espacos :: String -> Int
espacos str = length (filter(==' ') str)

-- 5 dada uma lista de números, calcule 3*n^2 + 2/n + 1 
-- Dica: defina uma função anônima.

calc :: [Float] -> [Float]
calc num = map (\x -> 3*(x^2) + (2/x) + 1) num

-- 6 dada uma lista de números, selecione somente os que forem negativos.

nega :: [Float] -> [Float]
nega neg = filter(<0) neg

-- 7 receba uma lista de números e retorne somente os que estiverem entre 1 e 100, inclusive. 
-- Dica 1: use uma função anônima. 
-- Dica 2: use o operador '&&' para expressar um 'E' lógico.

entre :: [Float] -> [Float]
entre list = filter(\x -> x>=1 && x<=100) list

-- 8 lista de idades de pessoas no ano atual, 
-- retorne uma lista somente com as idades de quem nasceu depois de 1970. 
-- Para testar a condição, sua função deverá subtrair a idade do ano atual.

idade :: [Int] -> [Int]
idade id = filter (>1970)  (map (\x -> 2016 - x) id)

-- 9 lista de números e retorne somente aqueles que forem pares

pares :: [Int] -> [Int]
pares par = filter (\x -> mod x 2==0) par

-- 10 verifique se o caracter (primeiro argumento) está contido na string (segundo argumento). 

charFound :: Char -> String -> Bool
charFound x y
 | y == [] = False
 | x == head y = True
 | x /= head y = charFound x (tail y)

-- 11 recebe uma função condicional e uma lista, retornando o "menor prefixo"
--takeWhile :: (a -> Bool) -> [a] -> [a]

-- takeWhile (\x -> x/2 <10) [0,1,2,5,10,15,16,17,18,19,20,21,100]
-- [0.0,1.0,2.0,5.0,10.0,15.0,16.0,17.0,18.0,19.0]


-- 12 lista de nomes e retorne outra lista com somente aqueles nomes que terminarem com a letra 'a'.

nomes :: [String] -> [String]
nomes nome = filter(\x -> last x == 'a') nome