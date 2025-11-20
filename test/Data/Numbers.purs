module Test.Data.Numbers where

import Prelude

import Data.Numbers (bits)
import Effect (Effect)
import Test.Assert (assertEqual)

testNumbers ∷ Effect Unit
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
