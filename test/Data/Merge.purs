module Test.Data.Merge where

import Prelude
import Data.Merge (merge, mergeSort, split, sublist)
import Test.Assert (assertEqual)
import Effect (Effect)

testMerge :: Effect Unit
testMerge = do
  assertEqual
    { actual: split [ 1 ]
    , expected: [ [ 1 ] ]
    }
  assertEqual
    { actual: split [ 1, 4, 2 ]
    , expected: [ [ 1 ], [ 4 ], [ 2 ] ]
    }
  assertEqual
    { actual: sublist 0 1 [ 1, 2, 3 ]
    , expected: []
    }
  assertEqual
    { actual: sublist 0 10 [ 1, 2, 3 ]
    , expected: [ 1, 2, 3 ]
    }
  assertEqual
    { actual: sublist 1 2 [ 1 ]
    , expected: [ 1 ]
    }
  assertEqual
    { actual: sublist 5 8 [ 3, 4, 5, 6, 7, 8, 9 ]
    , expected: [ 5, 6, 7 ]
    }
  assertEqual
    { actual: sublist 4 5 [ 1, 2, 3 ]
    , expected: []
    }
  assertEqual
    { actual: merge [] []
    , expected: []
    }
  assertEqual
    { actual: merge [ 1 ] []
    , expected: [ 1 ]
    }
  assertEqual
    { actual: merge [] [ 1 ]
    , expected: [ 1 ]
    }
  assertEqual
    { actual: merge [ 1 ] [ 1 ]
    , expected: [ 1, 1 ]
    }
  assertEqual
    { actual: merge [ 1 ] [ 2 ]
    , expected: [ 1, 2 ]
    }
  assertEqual
    { actual: merge [ 2 ] [ 1 ]
    , expected: [ 1, 2 ]
    }
  assertEqual
    { actual: merge [ 1, 2 ] [ 1, 2 ]
    , expected: [ 1, 1, 2, 2 ]
    }
  assertEqual
    { actual: merge [ 1, 2, 5 ] [ 3, 4, 6 ]
    , expected: [ 1, 2, 3, 4, 5, 6 ]
    }
  assertEqual
    { actual: merge [ 3, 4, 6 ] [ 1, 2, 5 ]
    , expected: [ 1, 2, 3, 4, 5, 6 ]
    }
  assertEqual
    { actual: merge [ 1, 2, 3, 4 ] [ 3 ]
    , expected: [ 1, 2, 3, 3, 4 ]
    }
  assertEqual
    { actual: merge [ 1, 2, 3, 4 ] [ 4 ]
    , expected: [ 1, 2, 3, 4, 4 ]
    }
  assertEqual
    { actual: mergeSort []
    , expected: []
    }
  assertEqual
    { actual: mergeSort [ 1 ]
    , expected: [ 1 ]
    }
  assertEqual
    { actual: mergeSort [ 1, 2 ]
    , expected: [ 1, 2 ]
    }
  assertEqual
    { actual: mergeSort [ 2, 1 ]
    , expected: [ 1, 2 ]
    }
  assertEqual
    { actual: mergeSort [ 3, 2, 1 ]
    , expected: [ 1, 2, 3 ]
    }
  assertEqual
    { actual: mergeSort [ 1, 2, 3, 4, 3 ]
    , expected: [ 1, 2, 3, 3, 4 ]
    }
