module Test.Merge.Pair where

import Prelude
import Data.Tuple (Tuple(..))
import Merge.Pair (enumerate, twins, pairs)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert

testMergePair :: TestSuite
testMergePair = suite "Pair" do
  test "enumerate" do
    Assert.equal [ Tuple 0 1 ]
      $ enumerate [ 1 ]

    Assert.equal [ Tuple 0 1, Tuple 1 2 ]
      $ enumerate [ 1, 2 ]

  test "twins" do
    Assert.equal []
      $ twins [ 1 ]

    Assert.equal [ Tuple 1 2 ]
      $ twins [ 1, 2 ]

    Assert.equal [ Tuple 1 2, Tuple 2 3 ]
      $ twins [ 1, 2, 3 ]

    Assert.equal [ Tuple 1 2, Tuple 2 3, Tuple 3 4 ]
      $ twins [ 1, 2, 3, 4 ]

  test "pairs" do
    Assert.equal []
      $ pairs [ 1 ]

    Assert.equal [ Tuple 1 2 ]
      $ pairs [ 1, 2 ]

    Assert.equal [ Tuple 1 2 ]
      $ pairs [ 1, 2, 3 ]

    Assert.equal [ Tuple 1 2, Tuple 3 4 ]
      $ pairs [ 1, 2, 3, 4 ]

    Assert.equal [ Tuple [ 1 ] [ 2 ] ]
      $ pairs [ [ 1 ], [ 2 ] ]

    Assert.equal [ Tuple [ 1 ] [ 2 ], Tuple [ 3 ] [] ]
      $ pairs [ [ 1 ], [ 2 ], [ 3 ], [] ]

    Assert.equal [ Tuple [ 1 ] [ 2 ], Tuple [ 3 ] [ 4 ], Tuple [ 5 ] [] ]
      $ pairs [ [ 1 ], [ 2 ], [ 3 ], [ 4 ], [ 5 ], [] ]
