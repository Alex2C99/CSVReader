module Util where

import           Data.Char

split :: Char -> String -> [String]
split ch = split' ch []
   where
      split' :: Char -> String -> String -> [String]
      split'  _ cs [] = [reverse cs]
      split' ch cs (t:ts)
          | t == ch   = reverse cs : split' ch [] ts
          | otherwise = split' ch (t:cs) ts

outMaybe :: (a -> IO ()) -> Maybe a -> IO ()
outMaybe f (Just a) = f a
outMaybe _ Nothing  = return ()

jwrap :: String -> String -> String
jwrap tag val = "\"" ++ tag ++ "\": \"" ++ val ++ "\""

screen :: Char -> String -> String
screen ch [] = []
screen ch (h : cs)
  | h == ch =  chr 92 : ch : screen ch cs
  | otherwise = h : screen ch cs

screenQuote = screen '"'
