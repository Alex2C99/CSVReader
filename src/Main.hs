module Main where

import System.Environment
import CsvRead
import JSONWrite
import Client
import Util

main :: IO ()
main = do
  args <- getArgs
  strs <- linesFromFile (head args)
  mapM_ (outMaybe (putStrLn . json) . readClient) strs
  where linesFromFile fn = fmap lines (readFile fn)
        readClient :: String -> Maybe Client
        readClient = readSemi
