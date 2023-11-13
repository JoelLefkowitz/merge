module Merge.Sort where

import Prelude
import Data.Array (foldl, head, length, range, reverse)
import Data.Int (ceil, toNumber)
import Data.Maybe (fromMaybe)
import Data.Number (log)
import Data.Tuple (fst, snd, uncurry)
import Merge.Pairs (pairs, pairsSep, order)
import Merge.Arrays (split, sublist)

merge :: Array Int -> Array Int -> Array Int
merge arr [] = arr
merge [] arr = arr
merge _arr1 _arr2 = zipped <> final <> remainder
  where
  zipped = foldl (\acc x -> acc <> [ fst x ] <> sublist (fst x) (snd x) arr2) [] (pairs arr1)
  arr1 = fst $ order _arr1 _arr2
  arr2 = snd $ order _arr1 _arr2
  arr1End = ((fromMaybe 0 $ head (reverse arr1)))
  arr2End = (fromMaybe 0 $ head (reverse arr2))
  final = fromMaybe [] ((\x -> [ x ]) <$> (head $ reverse arr1))
  remainder = if arr1End < arr2End then sublist arr1End arr2End arr2 else []

mergeSort :: Array Int -> Array Int
mergeSort arr = join $ foldl (\acc _ -> (uncurry merge) <$> (pairsSep $ acc)) (split arr) (range 0 (ceil $ log $ toNumber (length arr)))
