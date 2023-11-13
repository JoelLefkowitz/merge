module Merge.Pairs where

import Prelude
import Data.Array (head, index, length, range, tail, zip)
import Data.Maybe (fromMaybe)
import Data.Tuple (Tuple(..))

pairs :: ∀ a. Array a -> Array (Tuple a a)
pairs arr = zip arr (fromMaybe [] $ tail arr)

pairsSep :: ∀ a. Array (Array a) -> Array (Tuple (Array a) (Array a))
pairsSep arr = do
  x <- (range 0 len)
  pure $ Tuple (fromMaybe [] $ index arr (2 * x)) (fromMaybe [] $ index arr (2 * x + 1))

  where
  len = length arr / 2

order :: ∀ a. Ord a => Array a -> Array a -> (Tuple (Array a) (Array a))
order x y = if (head x) < (head y) then Tuple x y else Tuple y x
