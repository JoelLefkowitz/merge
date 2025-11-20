module Test.Main where

import Prelude

import Data.Array (sort)
import Data.Merge (mergeSort)
import Effect (Effect)
import Test.Data.Merge (testMerge)
import Test.Data.Numbers (testNumbers)
import Test.Data.Pair (testPair)
import Test.QuickCheck (quickCheck)

main ∷ Effect Unit
main = do
  testNumbers
  testPair
  testMerge
  quickCheck (\x → mergeSort x == sort x)
