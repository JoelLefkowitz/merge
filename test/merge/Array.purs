module Test.Merge.Array where

import Prelude
import Merge.Array (split, sublist)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert

testMergeArray :: TestSuite
testMergeArray = suite "Array" do
  test "split" do
    Assert.equal [ [ 1 ] ]
      $ split [ 1 ]

    Assert.equal [ [ 1 ], [ 4 ], [ 2 ] ]
      $ split [ 1, 4, 2 ]

  test "sublist" do
    Assert.equal []
      $ sublist 0 1 [ 1, 2, 3 ]

    Assert.equal [ 1, 2, 3 ]
      $ sublist 0 10 [ 1, 2, 3 ]

    Assert.equal [ 1 ]
      $ sublist 1 2 [ 1 ]

    Assert.equal [ 5, 6, 7 ]
      $ sublist 5 8 [ 3, 4, 5, 6, 7, 8, 9 ]

    Assert.equal []
      $ sublist 4 5 [ 1, 2, 3 ]
