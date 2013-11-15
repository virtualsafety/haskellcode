--http://blog.sigfpe.com/2006/05/grok-haskell-monad-transformers.html
--http://www.haskell.org/haskellwiki/State_Monad
import Control.Monad.State
import Control.Monad.Identity
import Data.Char(toUpper)
 

test1 :: State Int (Int,Int)
test1 =   do    
    a <- get
    modify (+1)
    b <- get
    return (a,b)


test2 :: State [Char] ([Char],[Char])
test2 =  do   
    a  <- get
    modify (++"1")
    b <- get
    return (a,b)

--let go1 = evalState test1 0
--let go2 = evalState test2 "0" 

 
test3 ::  StateT Int ( StateT [Char] Identity )  (Int, [Char])
test3 = do
    modify (+1)
    lift $ modify (++ "1")
    a <- get
    b <- lift get
    return (a,b)

--let go3 = runIdentity $ evalStateT (evalStateT test3 0) "0"

{-| 
listOfTuples :: [(Int,Char)]  
listOfTuples = do  
    n  <- [1,2]  
    ch <- ['a','b']  
    return (n,ch) 

test11 :: IO String
test11 =  do    
    a <- getLine   
    return "haha"
    return a


isGreen :: IO Bool
isGreen =
    do putStrLn "Is green your favorite color?"
       inpStr <- getLine
       return ((toUpper . head $ inpStr) == 'Y')
-}