module Merge.Sort where

import Prelude
import Data.Array (concat, foldl, head, length, range, reverse)
import Data.Int (even)
import Data.Maybe (fromMaybe)
import Data.Tuple (uncurry, Tuple(..))
import Merge.Array (split, sublist)
import Merge.Number (bits)
import Merge.Pair (twins, pairs)

-- merge [1, 2, 5, 6, 7] [3, 4, 6, 8, 9] = [1, 2, 3, 4, 5, 6, 6, 7, 8, 9]
-- 
-- zipped = foldl join [] $ twins x:
-- [a, b] -> [ acc, [a], sublist a b y ]: 
-- [1, 2] -> [[             ], [1], [    ]]
-- [2, 5] -> [[1            ], [2], [3, 4]]
-- [5, 6] -> [[1, 2, 3, 4   ], [5], [    ]]
-- [6, 7] -> [[1, 2, 3, 4, 5], [6], [6   ]]
-- [1, 2, 3, 4, 5, 6, 6]
-- 
-- [last x]:
-- [7]
-- 
-- remainder = sublist (last x) (last y + 1) y:
-- [8, 9]
merge :: Array Int -> Array Int -> Array Int
merge [] x = x

merge x y
  | head x > head y = merge y x
  | otherwise = concat [ zipped, [ last x ], remainder ]
    where
    combine acc (Tuple a b) = concat [ acc, [ a ], sublist a b y ]

    last = fromMaybe 0 <<< head <<< reverse

    zipped = foldl combine [] $ twins x

    remainder = if last x <= last y then sublist (last x) (last y + 1) y else []

-- mergeSort [1, 2, 7, 8, 7] = [1, 2, 7, 7 8]
-- 
-- acc:
-- [[ 1 ], [ 2 ], [ 7 ], [ 8 ], [ 7 ]]
-- [[ 1, 2 ], [ 7, 8 ], [ 7 ]]
-- [[ 1, 2, 7, 8 ], [ 7 ]]
-- [[ 1, 2, 7, 7 8 ]]
-- 
-- merge calls:
-- merge [1         ], [2   ] -> [1, 2         ]
-- merge [7         ], [8   ] -> [7, 8         ]
-- merge [1, 2      ], [7, 8] -> [1, 2, 7, 8   ]
-- merge [1, 2, 7, 8], [7   ] -> [1, 2, 7, 7, 8]
mergeSort :: Array Int -> Array Int
mergeSort [] = []

mergeSort [ x ] = [ x ]

mergeSort arr = join $ foldl combine (split arr) steps
  where
  pad x = if even $ length x then x else x <> [ [] ]

  combine acc _ = uncurry merge <$> pairs (pad acc)

  steps = range 0 (bits $ length arr)
