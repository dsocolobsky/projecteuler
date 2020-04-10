-- Which starting number, under one million, produces the longest chain (of collatz terms)?

collatz :: Integer -> [Integer]
collatz 1 = [1]
collatz n
    | even n = n : collatz (n `div` 2)
    | odd n  = n : collatz (3*n+1)

collatzLen :: Integer -> Integer
collatzLen n = toInteger $ length $ collatz n

findMaxCollatzAux :: Integer -> (Integer, (Integer, Integer)) -> (Integer, Integer)
findMaxCollatzAux n (current, (whichSeen, maxSeen))
    | current == n = (whichSeen, maxSeen)
    | otherwise    = findMaxCollatzAux n (current+1, (ws, ms)) where
        ws = if (collatzLen current) > maxSeen then current              else whichSeen
        ms = if (collatzLen current) > maxSeen then (collatzLen current) else maxSeen

findMaxCollatz :: Integer -> (Integer, Integer)
findMaxCollatz n = findMaxCollatzAux n (1, (1, 1))