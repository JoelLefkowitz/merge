module Test.Data.Pair where

import Prelude
import Data.Tuple (Tuple(..))
import Data.Pair (enumerate, twins, pairs)
import Test.Assert (assertEqual)
import Effect (Effect)

testPair :: Effect Unit
testPair = do
  assertEqual
    { actual: enumerate [ 1 ]
    , expected: [ Tuple 0 1 ]
    }
  assertEqual
    { actual: enumerate [ 1, 2 ]
    , expected: [ Tuple 0 1, Tuple 1 2 ]
    }
  assertEqual
    { actual: twins [ 1 ]
    , expected: []
    }
  assertEqual
    { actual: twins [ 1, 2 ]
    , expected: [ Tuple 1 2 ]
    }
  assertEqual
    { actual: twins [ 1, 2, 3 ]
    , expected: [ Tuple 1 2, Tuple 2 3 ]
    }
  assertEqual
    { actual: twins [ 1, 2, 3, 4 ]
    , expected: [ Tuple 1 2, Tuple 2 3, Tuple 3 4 ]
    }
  assertEqual
    { actual: pairs [ 1 ]
    , expected: []
    }
  assertEqual
    { actual: pairs [ 1, 2 ]
    , expected: [ Tuple 1 2 ]
    }
  assertEqual
    { actual: pairs [ 1, 2, 3 ]
    , expected: [ Tuple 1 2 ]
    }
  assertEqual
    { actual: pairs [ 1, 2, 3, 4 ]
    , expected: [ Tuple 1 2, Tuple 3 4 ]
    }
  assertEqual
    { actual: pairs [ [ 1 ], [ 2 ] ]
    , expected: [ Tuple [ 1 ] [ 2 ] ]
    }
  assertEqual
    { actual: pairs [ [ 1 ], [ 2 ], [ 3 ], [] ]
    , expected: [ Tuple [ 1 ] [ 2 ], Tuple [ 3 ] [] ]
    }
  assertEqual
    { actual: pairs [ [ 1 ], [ 2 ], [ 3 ], [ 4 ], [ 5 ], [] ]
    , expected: [ Tuple [ 1 ] [ 2 ], Tuple [ 3 ] [ 4 ], Tuple [ 5 ] [] ]
    }
