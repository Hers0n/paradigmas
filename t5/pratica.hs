
addSuffix :: String -> [String] -> [String]
addSuffix _ [] = []
addSuffix y (x:xs) = (x++y):addSuffix y xs

addSuffix2 :: String -> [String] -> [String]
addSuffix2 mail nome = [x ++ mail | x <- nome]

countShorts :: [String] -> Int
countShorts [] = 0
countShorts (x:xs) = if length x > 5 then 1 + countShorts xs else countShorts xs

countShorts2 :: [String] -> Int
countShorts2 str  =  length [x | x <- str, (length x) < 5]