module Test.Main where

import Prelude
import Data.Array (sort)
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Sort (merge, mergeSort, pairs, pairsSep, split, sublist)
import Test.Assert (assertEqual)
import Test.QuickCheck (quickCheck)

main :: Effect Unit
main = do
  assertEqual
    { actual: split [ 1, 4, 2 ]
    , expected: [ [ 1 ], [ 4 ], [ 2 ] ]
    }
  assertEqual
    { actual: sublist 5 8 [ 3, 4, 6, 7, 9 ]
    , expected: [ 6, 7 ]
    }
  assertEqual
    { actual: pairs [ 1, 2, 3 ]
    , expected: [ Tuple 1 2, Tuple 2 3 ]
    }
  assertEqual
    { actual: pairs [ 1 ]
    , expected: []
    }
  assertEqual
    { actual: pairsSep [ [ 1 ], [ 2 ], [ 3 ], [ 4 ], [ 5 ] ]
    , expected: [ Tuple [ 1 ] [ 2 ], Tuple [ 3 ] [ 4 ], Tuple [ 5 ] [] ]
    }
  assertEqual
    { actual: merge [ 3, 4, 6 ] [ 1, 2, 5 ]
    , expected: [ 1, 2, 3, 4, 5, 6 ]
    }
  assertEqual
    { actual: merge [ 3 ] [ 4 ]
    , expected: [ 3, 4 ]
    }
  assertEqual
    { actual: merge [ 4 ] [ 3 ]
    , expected: [ 3, 4 ]
    }
  assertEqual
    { actual: merge [ 3, 4 ] [ 3, 4 ]
    , expected: [ 3, 3, 4, 4 ]
    }
  assertEqual
    { actual: mergeSort [ 4, 3, 4, 3, 3 ]
    , expected: [ 3, 3, 3, 4, 4 ]
    }
  quickCheck \x ->
    eq (mergeSort x) (sort x)
