module Test.Merge.Sort where

import Prelude
import Merge.Sort (merge, mergeSort)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert

testMergeSort :: TestSuite
testMergeSort =
  suite "Sort" do
    test "merge" do
      Assert.equal []
        $ merge [] []
      Assert.equal [ 1 ]
        $ merge [ 1 ] []
      Assert.equal [ 1 ]
        $ merge [] [ 1 ]
      Assert.equal [ 1, 1 ]
        $ merge [ 1 ] [ 1 ]
      Assert.equal [ 1, 2 ]
        $ merge [ 1 ] [ 2 ]
      Assert.equal [ 1, 2 ]
        $ merge [ 2 ] [ 1 ]
      Assert.equal [ 1, 1, 2, 2 ]
        $ merge [ 1, 2 ] [ 1, 2 ]
      Assert.equal [ 1, 2, 3, 4, 5, 6 ]
        $ merge [ 1, 2, 5 ] [ 3, 4, 6 ]
      Assert.equal [ 1, 2, 3, 4, 5, 6 ]
        $ merge [ 3, 4, 6 ] [ 1, 2, 5 ]
      Assert.equal [ 1, 2, 3, 3, 4 ]
        $ merge [ 1, 2, 3, 4 ] [ 3 ]
      Assert.equal [ 1, 2, 3, 4, 4 ]
        $ merge [ 1, 2, 3, 4 ] [ 4 ]
    test "mergeSort" do
      Assert.equal []
        $ mergeSort []
      Assert.equal [ 1 ]
        $ mergeSort [ 1 ]
      Assert.equal [ 1, 2 ]
        $ mergeSort [ 1, 2 ]
      Assert.equal [ 1, 2 ]
        $ mergeSort [ 2, 1 ]
      Assert.equal [ 1, 2, 3 ]
        $ mergeSort [ 3, 2, 1 ]
      Assert.equal [ 1, 2, 3, 3, 4 ]
        $ mergeSort [ 1, 2, 3, 4, 3 ]
