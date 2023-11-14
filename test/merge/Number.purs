module Test.Merge.Number where

import Prelude
import Merge.Number (bits)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert

testMergeNumber :: TestSuite
testMergeNumber = suite "Number" do
  test "bits" do
    Assert.equal 1
      $ bits 0

    Assert.equal 1
      $ bits 1

    Assert.equal 2
      $ bits 2

    Assert.equal 2
      $ bits 3

    Assert.equal 3
      $ bits 4
