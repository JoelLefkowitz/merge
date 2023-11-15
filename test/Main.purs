module Test.Main where

import Prelude

import Data.Array (sort)
import Data.Traversable (class Traversable, sequence)
import Effect (Effect)
import Merge.Sort (mergeSort)
import Test.Merge.Array (testMergeArray)
import Test.Merge.Number (testMergeNumber)
import Test.Merge.Pair (testMergePair)
import Test.Merge.Sort (testMergeSort)
import Test.QuickCheck (quickCheck)
import Test.Unit (TestSuite)
import Test.Unit.Main (runTest)

suites :: Array TestSuite
suites =
  [ testMergeArray
  , testMergeNumber
  , testMergePair
  , testMergeSort
  ]

merge :: ∀ t m a. Traversable t => Applicative m => t (m a) -> m Unit
merge = void <<< sequence

main :: Effect Unit
main = merge [ runTest (merge suites), quickCheck (\x -> mergeSort x == sort x) ]
