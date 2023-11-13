module Test.Main where

import Effect (Effect)
import Prelude
import Test.Merge.Arrays (testMergeArrays)
import Test.Merge.Sort (testMergeSort)
import Test.Unit.Main (runTest)
import Test.Merge.Pairs (testMergePairs)

main :: Effect Unit
main = runTest do
--   testMergeArrays
  testMergePairs
--   testMergeSort
