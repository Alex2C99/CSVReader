module Main where

import           Client
import           CsvRead
import           JSONWrite
import           System.Environment
import           Util
import           Control.Monad

main :: IO ()
main = do
  args <- getArgs
  strs <- linesFromFile (head args)
  foldM (\_ s -> (outMaybe (putStrLn . json) . readClient) s) () strs
  where linesFromFile fn = fmap lines (readFile fn)
        readClient :: String -> Maybe Client
        readClient = readSemi
