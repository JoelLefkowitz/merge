module Test.Data.Numbers where

import Prelude
import Data.Numbers (bits)
import Test.Assert (assertEqual)
import Effect (Effect)

testNumbers :: Effect Unit
testNumbers = do
  assertEqual
    { actual: bits 0
    , expected: 1
    }
  assertEqual
    { actual: bits 1
    , expected: 1
    }
  assertEqual
    { actual: bits 2
    , expected: 2
    }
  assertEqual
    { actual: bits 3
    , expected: 2
    }
  assertEqual
    { actual: bits 4
    , expected: 3
    }
