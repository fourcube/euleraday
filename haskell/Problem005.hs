module Problem005 where
  import Data.List

  divisibleByAll :: [Int] -> Int -> Bool
  divisibleByAll ints n = all (\x -> (n `mod` x) == 0) ints

  prime_factors :: Int -> [Int]
  prime_factors n =
    case factors of
      [] -> [n]
      _  -> factors ++ prime_factors (n `div` (head factors))
    where factors = take 1 $ filter (\x -> (n `mod` x) == 0) [2 .. n-1]

  pow_tuple :: (Int, Int) -> Int
  pow_tuple (a, b) = a ^ b

  base_exponent_pairs :: [[Int]] -> [(Int, Int)]
  base_exponent_pairs nested_factors = do
    -- transform [[1], [2], [3], [2,2], [5], [3,2], [7], [2,2,2] ...]
    let factor_groups = group $ concat $ map sort nested_factors
    -- into [[1], [2], [3], [2,2], [5], [2], [3], [7], [2,2,2], ...]

    let factor_type = map head factor_groups
    let factor_count = map length factor_groups

    -- turn into a list of naturally sorted, unique (base, exponent) pairs
    sort $ nub $ zip factor_type factor_count

  group_factors :: [[Int]] -> [Int]
  group_factors nested_factors = do
    let factors = base_exponent_pairs nested_factors
    -- group them into sublists by base, take the last entry, calculate base ^ exp
    -- this takes the greatest power of each prime and then multiplies it
    map pow_tuple $ map last $ groupBy (\a b -> fst a == fst b) $ factors

  evenlyDivisible :: [Int] -> Int

  evenlyDivisible ints =
    -- Compute the prime factorization of each number in ints,
    -- and multiply the greatest power of each prime together
    foldl (*) 1 $ group_factors $ map prime_factors ints


--filter (\x -> (length x) == 1 && (head x) > 1)  $ map nub $ (map . map) snd $ map base_exponent_pairs $ (map . map) prime_factors [[36],[20]]
