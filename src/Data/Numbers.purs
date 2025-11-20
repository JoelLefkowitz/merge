module Data.Numbers where

import Prelude

import Data.Int (floor, toNumber)
import Data.Number as Number

log ∷ Number → Number → Number
log base x = Number.log x / Number.log base

bits ∷ Int → Int
bits x = floor (log (toNumber 2) (toNumber x)) + 1
