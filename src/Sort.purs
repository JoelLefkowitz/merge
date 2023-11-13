module Sort where

import Prelude
import Data.Array (length, foldl, slice, reverse, findIndex)
import Data.Foldable (class Foldable)
import Data.Maybe (fromMaybe, Maybe(..))

split :: ∀ a. Array a -> Array (Array a)
split = map pure

sublist :: Int -> Int -> Array Int -> Array Int
sublist min max arr = slice from to arr
  where
  from = fromMaybe 0 (findIndex (\x -> x >= min) arr)
  to = fromMaybe (length arr) ((\x -> length arr - x) <$> findIndex (\x -> x <= max) (reverse arr))

join :: Array Int -> Array Int -> Array Int
join arr1 arr2 = foldl (\acc x -> acc <> sublist 1 2 arr2 <> [ x ]) [] arr1
