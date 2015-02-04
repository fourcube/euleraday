module Problem007Spec where

  import Test.Hspec
  import Problem007

  main :: IO ()
  main = hspec $ do
    describe "isPrime" $ do
      it "checks to see if a number is prime" $ do
        isPrime 1 `shouldBe` False
        isPrime 0 `shouldBe` False
        isPrime 2 `shouldBe` True
        isPrime 4 `shouldBe` False

    describe "nthPrime" $ do
      it "generates the nth prime number" $ do
        nthPrime 1 `shouldBe` 2
        nthPrime 6 `shouldBe` 13
        nthPrime 10001 `shouldBe` 104743
