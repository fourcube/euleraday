module Problem010 where

  -- Code taken from https://wiki.haskell.org/Prime_numbers 7.1
  import Control.Monad
  import Control.Monad.ST
  import Data.Array.ST
  import Data.Array.Unboxed

  sieveUA :: Int -> UArray Int Bool
  sieveUA top = runSTUArray $ do
    let m = (top-1) `div` 2
        r = floor . sqrt $ fromIntegral top + 1
    sieve <- newArray (1,m) True      -- :: ST s (STUArray s Int Bool)
    forM_ [1..r `div` 2] $ \i -> do
      isPrime <- readArray sieve i
      when isPrime $ do               -- ((2*i+1)^2-1)`div`2 == 2*i*(i+1)
        forM_ [2*i*(i+1), 2*i*(i+2)+1..m] $ \j -> do
          writeArray sieve j False
    return sieve

  primesToUA :: Int -> [Int]
  primesToUA top = 2 : [i*2+1 | (i,True) <- assocs $ sieveUA top]

  sum_of_primes_to :: Int -> Int
  sum_of_primes_to upper_boundary = foldl1 (+) $ primesToUA upper_boundary
