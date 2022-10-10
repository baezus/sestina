#!/usr/bin/env nix-script-haskell 
#!haskellPackages text

{-# LANGUAGE OverloadedStrings #-}
module Main where 

import Data.List 
import qualified Data.List.Split.Internals as L

main :: IO ()
main = do 
  let x = ["1", "2", "3", "4", "5", "6"]
  let suffix = lastThreeReversed x 
  let prefix = take 3 x
  let finalmente = tupleToList $ zip suffix prefix 
  print finalmente

lastThreeReversed :: [String] -> [String]
lastThreeReversed = reverse . drop 3 

tupleToList = foldl (\a (f,s) -> a ++ [f,s]) []


