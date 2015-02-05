module Problem009 where
  import Data.List

  prime_factors :: Int -> [Int]
  prime_factors n =
    case factors of
      [] -> [n]
      _  -> factors ++ prime_factors (n `div` (head factors))
    where factors = take 1 $ filter (\x -> (n `mod` x) == 0) [2 .. n-1]

  base_exponent_pairs :: [[Int]] -> [[(Int, Int)]]
  base_exponent_pairs nested_factors = do
    let grouped_factors = map group $ map sort nested_factors
    -- get base exponent pairs
    (map. map) (\x -> (head x, length x)) grouped_factors

  same_exponents :: [(Int, Int)] -> Bool
  same_exponents vector_of_pairs = do
    let questionable_exponent = (snd . head) vector_of_pairs
    all (\p -> (snd p) == questionable_exponent) vector_of_pairs
    --  find_sqrtable :: [[(Int, Int)]] -> [Int]

  even_exponent :: [(Int, Int)] -> Bool
  even_exponent vector_of_pairs = do
    let questionable_exponent = head $ nub $ map snd vector_of_pairs
    questionable_exponent `mod` 2 == 0

  is_square_root_integer :: [(Int, Int)] -> Bool
  is_square_root_integer vector_of_pairs = (same_exponents vector_of_pairs) && (even_exponent vector_of_pairs)
  
  filter_where_sqrt_is_integer :: [Int] -> [Int]
  filter_where_sqrt_is_integer candidates = do
    -- First find the prime factors of all candidates
    let factors = map prime_factors candidates
    -- Transform prime factor groups e.g. 18 [[2,3,3]] -> [[(2,1),(3,2)]]
    -- into a list of (Base, Exponent) pairs
    let base_to_exp_pairs = base_exponent_pairs factors
    -- I assume a numbers square root is an integers if
    --   A) All it's (Base, Exponent) pairs have the same exponent
    --   B) this exponent is even
    let sqrtable = map is_square_root_integer base_to_exp_pairs
    -- Return the list of only those numbers
    map fst $ filter (\x -> snd x == True) $ zip candidates sqrtable


  find_triplet_for :: Int -> (Int,Int,Int)
  find_triplet_for desired_sum = do
    let candidates = [1..desired_sum `quot` 2]
    head [ (a, b, c) |
            a <- candidates, b <- candidates, c <- [desired_sum - a - b],
            a < b,
            b < c,
            (a^2) + (b^2) == (c^2),
            a + b + c == desired_sum ]
