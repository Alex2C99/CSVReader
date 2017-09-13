module JSONWrite where

import Data.Char

class WriteJSON a where
  json :: a -> String

jwrap :: String -> String -> String
jwrap tag val = "\"" ++ tag ++ "\": \"" ++ val ++ "\""

screen :: Char -> String -> String
screen ch [] = []
screen ch (h : cs) 
  | h == ch =  chr 92 : ch : screen ch cs
  | otherwise = h : screen ch cs

screenQuote = screen '"'
