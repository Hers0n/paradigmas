-- 1
quad :: [Int] -> [Int]
quad [] = []
quad (x:xs) = x^2 : quad xs

-- 2
sr :: [String] -> [String]
sr [] = []
sr (x:xs) =  ("Sr. "++) x : sr xs

-- 3 
espacos :: String -> Int
espacos [] = 0
espacos (x:xs) = ( if x == ' ' then 1 else 0 ) + espacos xs

-- 4
calc :: [Float] -> [Float]
calc [] = []
calc (x:xs) = ( 3*(x^2)+(2/x)+1 ) : calc xs

-- 5
neg :: [Float] -> [Float]
neg [] = []
neg (x:xs) = if x < 0 then x : neg xs else neg xs

-- 6
semVogais :: String -> String
semVogais str = filter(\x -> x /= 'a' && x /= 'A' && x /= 'e' && x /= 'E' && x /= 'i' && x /= 'I' && x /= 'o' && x /= 'O' && x /= 'u' && x /= 'U') str

-- 7
semVogaisR :: String -> String
semVogaisR "" = ""
semVogaisR (x:xs) = if (x /= 'a' && x /= 'A' && x /= 'e' && x /= 'E' && x /= 'i' && x /= 'I' && x /= 'o' && x /= 'O' && x /= 'u' && x /= 'U') then x : semVogaisR xs else semVogaisR xs

-- 8 
codifica :: String -> String
codifica str = map(\x -> if x == ' ' then ' ' else '-') str

-- 9
codificaR :: String -> String
codificaR "" = ""
codificaR (x:xs) = if x == ' ' then ' ' : codificaR xs else '-' : codificaR xs

-- 10
charFound :: Char -> String -> Bool
charFound _ "" = False
charFound k (x:xs) = if k == x then True else charFound k xs

-- 11
translate :: [(Float, Float)] -> [(Float, Float)]
translate [] = []
translate (x:xs) = ((fst x + 2), (snd x + 2)) : translate xs

-- 12
prodVet :: [Int] -> [Int] -> [Int]
prodVet [] [] = []
prodVet (x:xs) (y:ys) =  x*y : prodVet xs ys

-- 13
prodVetA :: [Int] -> [Int] -> [Int]
prodVetA x y = zipWith (*) x y

--14
geraTabela :: Int -> [(Int,Int)]
geraTabela 0 = []
geraTabela x = ((x), (x^2)) : geraTabela (x-1)