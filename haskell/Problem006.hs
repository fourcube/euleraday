module Problem006 where

  sumOfSquares :: [Int] -> Int
  sumOfSquares ints = foldl (\a b -> a + b^2) 0 ints

  squareOfsum :: [Int] -> Int
  squareOfsum ints = (foldl (+) 0 ints) ^ 2
