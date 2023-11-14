module Merge.Pair where

import Prelude
import Control.Alternative (guard)
import Data.Array (length, range, tail, zip)
import Data.Maybe (fromMaybe)
import Data.Tuple (Tuple, fst, snd)

enumerate :: ∀ a. Array a -> Array (Tuple Int a)
enumerate arr = zip (range 0 $ length arr) arr

twins :: ∀ a. Array a -> Array (Tuple a a)
twins arr = zip arr (fromMaybe [] $ tail arr)

pairs :: ∀ a. Array a -> Array (Tuple a a)
pairs arr = do
  x <- enumerate $ twins arr
  guard $ mod (fst x) 2 == 0
  pure $ snd x
