module Problem010Spec where

  import Test.Hspec
  import Problem010

  main :: IO ()
  main = hspec $ do
    describe "sum_of_primes_to called with 2000000" $ do
      it "should result in success" $ do
        sum_of_primes_to 2000000 `shouldBe` 142913828922
