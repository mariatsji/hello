module Parser where

-- a parser of things
-- is a function from strings
-- to a list of pair
-- of things and strings
data Parser a where
    Parser :: String -> Parser [(a, String)]

{--int :: Parser Int
int = Parser $
    \s -> case null s of
        True -> Parser []--}