module Test.Merge.Pairs where

import Prelude
import Data.Tuple (Tuple(..))
import Merge.Pairs (pairs, pairsSep)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert

testMergePairs :: TestSuite
testMergePairs = suite "Pairs" do
  test "pairs" do
    Assert.equal []
      $ (pairs [ 1 ])

    Assert.equal [ Tuple 1 2, Tuple 2 3 ]
      $ (pairs [ 1, 2, 3 ])

  test "pairsSep" do
    Assert.equal [ Tuple [ 1 ] [ 2 ], Tuple [ 3 ] [ 4 ], Tuple [ 5 ] [] ]
      $ (pairsSep [ [ 1 ], [ 2 ], [ 3 ], [ 4 ], [ 5 ] ])
