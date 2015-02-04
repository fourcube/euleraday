module Problem005Spec where

  import Test.Hspec
  import Problem005

  main :: IO ()
  main = hspec $ do
    describe "divisibleByAll" $ do
      it "returns true when a number 'n' is divisible by all 'ints'" $ do
        divisibleByAll [1..10] 2520 `shouldBe` True

    describe "evenlyDivisible" $ do
      it "returns the smallest integer that is evenly divisible by all integers between 1 and 10" $ do
        let ints = [1..10]
        evenlyDivisible ints `shouldBe` 2520

      it "returns the smallest integer that is evenly divisible by all integers between 1 and 20 " $ do
        let ints = [1..20]
        evenlyDivisible ints `shouldBe` 232792560
