module Test.Main where

import Prelude
import Data.Array (sort)
import Data.String (joinWith)
import Data.Traversable (sequence)
import Effect (Effect)
import Merge.Sort (mergeSort)
import Test.Merge.Array (testMergeArray)
import Test.Merge.Number (testMergeNumber)
import Test.Merge.Pair (testMergePair)
import Test.Merge.Sort (testMergeSort)
import Test.QuickCheck (quickCheck', (<?>))
import Test.Unit (TestSuite)
import Test.Unit.Main (runTest)

suites :: Array TestSuite
suites =
  [ testMergeArray
  , testMergeNumber
  , testMergePair
  , testMergeSort
  ]

summary :: Array Int -> String
summary x = joinWith " " [ show x, "->", show $ mergeSort x, "!=", show $ sort x ]

main :: Effect Unit
main = void do
  runTest <<< void $ sequence suites
  quickCheck' 1000 \x -> mergeSort x == sort x <?> summary x
