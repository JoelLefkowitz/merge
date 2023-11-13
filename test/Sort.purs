module Test.Main where

import Prelude
import Effect (Effect)
import Sort (split, join, sublist)
import Test.Assert (assertEqual)
import Data.Maybe (Maybe(..))

main :: Effect Unit
main = do
  assertEqual
    { actual: split [ 1, 2, 3 ]
    , expected: [ [ 1 ], [ 2 ], [ 3 ] ]
    }
  assertEqual
    { actual: sublist 5 8 [ 3, 4, 6, 7, 9 ]
    , expected: [ 6, 7 ]
    }
  assertEqual
    { actual: join [ 1, 2, 5 ] [ 3, 4, 6 ]
    , expected: [ 1, 2, 3, 4, 5, 6 ]
    }
