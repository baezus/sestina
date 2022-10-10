#!/usr/bin/env nix-script-haskell 
#!haskellPackages text

{-# LANGUAGE OverloadedStrings #-}
module Main where 

import qualified Data.List.Split.Internals as L

main :: IO ()
main = putStrLn "ayyo"

makeTwoLists :: [String] -> [[String]]
makeTwoLists = L.divvy 3 3 

-- reverseSecondList :: [String]

-- makePairs :: [String]

-- reCombine :: [String]

-- nextList :: [String] -> [String]
