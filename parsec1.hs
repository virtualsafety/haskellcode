import Control.Monad
-- show
import Text.Parsec
import Control.Applicative

integer = rd <$> many1 digit
    where rd = read :: String -> Integer
-- /show
main = forever $ do putStrLn "Enter an integer: "
                    input <- getLine
                    parseTest integer input