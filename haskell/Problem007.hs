module Problem007 where

isqrt :: Int -> Int
isqrt = floor . sqrt . fromIntegral

isPrime :: Int -> Bool
isPrime n | n < 2 = False
          | otherwise = all (\i -> (n `mod` i) /= 0) [2..isqrt(n)]

nthPrime :: Int -> Int
nthPrime n
  | n <= 1 = 2
  | otherwise = (filter (isPrime) [2..]) !! (n-1)
