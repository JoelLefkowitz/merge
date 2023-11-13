module Merge.Arrays where

import Prelude
import Data.Array (findIndex, length, reverse, slice)
import Data.Maybe (fromMaybe)

split :: ∀ f a. Applicative f => f a -> f (f a)
split = map pure

findIndexWhere :: ∀ a. (a → Boolean) → Array a → Int
findIndexWhere f arr = fromMaybe (length arr) (findIndex f arr)

findLastIndexWhere :: ∀ a. (a → Boolean) → Array a → Int
findLastIndexWhere f arr = (length arr) - (fromMaybe (length arr) ((_ - 1) <$> findIndex f (reverse arr)))

sublist :: ∀ a. Ord a => a -> a -> Array a -> Array a
sublist min max arr = slice (findIndexWhere (_ >= min) arr) (findLastIndexWhere (_ <= max) arr) arr
