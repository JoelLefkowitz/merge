module Test.Main where

import Prelude
import Effect (Effect)
import Data.Merge (mergeSort)
import Data.Array (sort)
import Test.Data.Numbers (testNumbers)
import Test.Data.Pair (testPair)
import Test.Data.Merge (testMerge)
import Test.QuickCheck (quickCheck)

main :: Effect Unit
main = do
  testNumbers
  testPair
  testMerge
  quickCheck (\x -> mergeSort x == sort x)
