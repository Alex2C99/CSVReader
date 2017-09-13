module Client where

import           CsvRead
import           JSONWrite
import           Util

data Client = 
       UL { 
         cusnum :: Int,
         inn    :: String,
         name   :: String
       }
            | 
       FL { 
         cusnum   :: Int,
         passpSer :: String,
         passpNum :: String,
         name     :: String
       }

instance ReadCSV Client where
  parse (t : tk)
    | (cltype==1) && (length tk >= 4) =
         Just FL { cusnum = readInt (head tk),
                   passpSer = tk !! 1,
                   passpNum = tk !! 2,
                   name = tk !! 3
                 }
    | (cltype==2) && (length tk >= 3) =
         Just UL { cusnum = readInt (head tk),
                   inn = tk !! 1,
                   name = tk !! 2
                 }
    | otherwise = Nothing
    where cltype = readInt t

instance WriteJSON Client where
  json cl@UL{} = "{\"Client\": {" ++
          jwrap "Type" "UL" ++ ", " ++
          jwrap "ID" (show $ cusnum cl)  ++ ", " ++
          jwrap "INN" (screenQuote $ inn cl)  ++ ", " ++
          jwrap "Name" (screenQuote $ name cl)  ++
          "}}"

  json cl@FL{} = "{\"Client\": {" ++
          jwrap "Type" "FL" ++ ", " ++
          jwrap "ID" (show $ cusnum cl)  ++ ", " ++
          jwrap "Passport" (screenQuote (passpSer cl) ++ " " ++ screenQuote (passpNum cl))  ++ ", " ++
          jwrap "Name" (screenQuote $ name cl)  ++
          "}}"
