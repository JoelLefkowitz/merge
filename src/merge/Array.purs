module Merge.Array where

import Prelude
import Data.Array (findIndex, length, reverse, slice)
import Data.Maybe (fromMaybe)

split :: ∀ f a. Applicative f => f a -> f (f a)
split = map pure

sublist :: ∀ a. Ord a => a -> a -> Array a -> Array a
sublist min max arr = slice lower upper arr
  where
  lower = fromMaybe (length arr - 1) $ findIndex (_ >= min) arr
  upper = fromMaybe 0 $ (length arr - _) <$> findIndex (_ < max) (reverse arr)
