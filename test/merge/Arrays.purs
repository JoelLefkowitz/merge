module Test.Merge.Arrays where

import Prelude
import Merge.Arrays (findIndexWhere, findLastIndexWhere, split, sublist)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert

testMergeArrays :: TestSuite
testMergeArrays = suite "Arrays" do
  test "split" do
    Assert.equal [ [ 1 ], [ 4 ], [ 2 ] ]
      $ (split [ 1, 4, 2 ])

  test "findIndexWhere" do
    Assert.equal 1
      $ (findIndexWhere (_ > 1) [ 1, 2, 3, 4 ])

  test "findLastIndexWhere" do
    Assert.equal 1
      $ (findLastIndexWhere (_ < 3) [ 1, 2, 3, 4 ])

  test "sublist" do
    Assert.equal [ 6, 7 ]
      $ (sublist 5 8 [ 3, 4, 6, 7, 9 ])

