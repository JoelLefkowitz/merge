module Sort where

import Prelude

import Data.Array (findIndex, foldl, head, index, length, range, reverse, slice, tail, zip)
import Data.Int (ceil, toNumber)
import Data.Maybe (fromMaybe)
import Data.Number (log)
import Data.Tuple (Tuple(..), fst, snd, uncurry)

split :: ∀ a. Array a -> Array (Array a)
split = map pure

pairs :: ∀ a. Array a -> Array (Tuple a a)
pairs arr = zip arr (fromMaybe [] $ tail arr)

pairsSep :: ∀ a. Array (Array a) -> Array (Tuple (Array a) (Array a))
pairsSep arr = do
  x <- (range 0 len)
  pure $ Tuple (fromMaybe [] $ index arr (2 * x)) (fromMaybe [] $ index arr (2 * x + 1))

  where
  len = length arr / 2

sublist :: Int -> Int -> Array Int -> Array Int
sublist min max arr = slice from to arr
  where
  from = fromMaybe (length arr) (findIndex (\x -> x >= min) arr)
  to = fromMaybe 0 ((\x -> length arr - x) <$> findIndex (\x -> x <= max) (reverse arr))

order :: Array Int -> Array Int -> (Tuple (Array Int) (Array Int))
order x y = if (fromMaybe 0 $ head x) < (fromMaybe 0 $ head y) then Tuple x y else Tuple y x

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
mergeSort arr = join $ foldl (\acc x -> (uncurry merge) <$> (pairsSep $ acc)) (split arr) (range 0 (ceil $ log $ toNumber (length arr)))
