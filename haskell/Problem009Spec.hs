module Problem009Spec where

  import Test.Hspec
  import Problem009

  main :: IO ()
  main = hspec $ do
    describe "find_triplet_from called with 1000" $ do
      it "should result in (200,375,425)" $ do
        let tuple = find_triplet_for 1000
        tuple `shouldBe` (200,375,425)
