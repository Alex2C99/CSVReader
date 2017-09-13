module JSONWrite where

class WriteJSON a where
  json :: a -> String
