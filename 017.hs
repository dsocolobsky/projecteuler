-- If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
-- (Without spaces or hyphens)

cartProd :: [[Char]] -> [[Char]] -> [([Char], [Char])]
cartProd xs ys = [(x,y) | x <- xs, y <- ys]

joinTuple :: ([Char], [Char]) -> [Char]
joinTuple (a, b) = a ++ b

joinTuples :: [([Char], [Char])] -> [[Char]]
joinTuples xs = map joinTuple xs

totalLengthAux :: [[Char]] -> Int -> Int
totalLengthAux [] t = t
totalLengthAux (x:xs) t = totalLengthAux xs (t + length x)

totalLength :: [[Char]] -> Int
totalLength l = totalLengthAux l 0

digits = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
tens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

twenties  = "twenty"  : (map ("twenty" ++) digits)
thirties  = "thirty"  : (map ("thirty" ++) digits)
fourties  = "forty"   : (map ("forty" ++) digits)
fifties   = "fifty"   : (map ("fifty" ++) digits)
sixties   = "sixty"   : (map ("sixty" ++) digits)
seventies = "seventy" : (map ("seventy" ++) digits)
eighties  = "eighty"  : (map ("eighty" ++) digits)
nineties  = "ninety" : (map ("ninety" ++) digits)

subHundred = digits ++ tens ++ twenties ++ thirties ++ fourties ++ fifties ++ sixties ++ seventies ++ eighties ++ nineties

hundredsSimple = map (++ "hundred") digits
hundredsAnd    = map (++ "hundredand") digits
hundredsFull   = joinTuples $ cartProd (hundredsAnd) subHundred



completeLength = (totalLength subHundred) + (totalLength (hundredsFull ++ hundredsSimple)) + length "onethousand"
