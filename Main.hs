#!/usr/bin/env nix-script-haskell 
#!haskellPackages text table-layout 

{-# LANGUAGE OverloadedStrings #-}
module Main where 

import Data.List 
import Control.Monad 
import Text.Read 

main :: IO ()
main = do 
  putStrLn "Enter your end words one-by-one surrounded by double quotes. When finished, enter an empty line."
  endWords <- getEndWords
  let permIterate z = take 6 (iterate (\x -> tupleToList $ zip (lastThreeReversed x) (take 3 x)) z)
  let withIndex = zip (permIterate endWords) ([0..5])
  display withIndex
  
display :: [([String], Integer)] -> IO ()
display zs = sequence_ [putStrLn (show b++" is "++show a) | (a,b) <- zs]

getEndWords :: IO [String]
getEndWords = do 
  putStrLn "Enter end word: "
  input <- getLine 
  case parseInput input of 
    Nothing -> return []
    Just aString -> do 
      moreInputs <- getEndWords
      return (aString : moreInputs)

parseInput :: String -> Maybe String 
parseInput input = if 
  input == "EOL" then Nothing else 
  (readMaybe input) :: Maybe String 

lastThreeReversed :: [String] -> [String]
lastThreeReversed = reverse . drop 3 

tupleToList = foldl (\a (f,s) -> a ++ [f,s]) []


