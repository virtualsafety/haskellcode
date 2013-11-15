import Control.Monad.State
import Control.Monad.Identity

postincrement :: Int -> State Int Int
postincrement _ = do 
        x <- get 
        put (x+1) 
        return x  

