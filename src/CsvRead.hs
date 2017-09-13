module CsvRead where

import           Util

type Tokens = [String]

class ReadCSV a where

  parse :: Tokens -> Maybe a
  parse [] = Nothing

  readWithDelim :: Char -> String -> Maybe a
  readWithDelim delim str = let tokens = split delim str in parse tokens

  readSemi :: String -> Maybe a
  readSemi = readWithDelim ';'
