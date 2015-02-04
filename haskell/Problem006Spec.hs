module Problem006Spec where

  import Test.Hspec
  import Problem006

  main :: IO ()
  main = hspec $ do
    describe "sumOfSquares" $ do
      it "returns the sum of ints squares" $ do
        sumOfSquares [1..10] `shouldBe` 385

      it "returns the sum of the first 100 squares" $ do
        sumOfSquares [1..100] `shouldBe` 338350

    describe "squareOfsum" $ do
      it "returns the square of the sum of ints" $ do
        squareOfsum [1..10] `shouldBe` 3025

      it "returns the square of the sum of first 100 ints" $ do
        squareOfsum [1..100] `shouldBe` 25502500

    describe "solution to 006" $ do
      it "is" $ do
        (squareOfsum [1..100] - sumOfSquares [1..100]) `shouldBe` 25164150

    --describe "evenlyDivisible" $ do
    --  it "returns the smallest integer that is evenly divisible by all integers between 1 and 10" $ do
    --    let ints = [1..10]
    --    evenlyDivisible ints `shouldBe` 2520
