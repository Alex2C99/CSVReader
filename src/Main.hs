module Main where

import           Client
import           CsvRead
import           JSONWrite
import           System.Environment
import           Util

main :: IO ()
main = do
  args <- getArgs
  strs <- linesFromFile (head args)
  mapM_ (outMaybe (putStrLn . json) . readClient) strs
  where linesFromFile fn = fmap lines (readFile fn)
        readClient :: String -> Maybe Client
        readClient = readSemi
