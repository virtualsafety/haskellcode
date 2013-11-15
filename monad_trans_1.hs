import Control.Monad.State
import Data.Map as M
import Data.Char

main = print =<< runStateT (updateState [0..25]) M.empty

getUserChar :: Int -> IO Char
getUserChar x = do
    putStrLn $ "Enter character for " ++ show x ++ ":"
    c <- getLine
    if length c == 1
        then return $ head c
        else getUserChar x

updateState :: [Int] -> StateT (M.Map Int Char) IO String
updateState (x:xs) = do
    previousState <- get
    c <- lift $ getUserChar x
    let updatedState = M.insert x c previousState
    lift $ print $ "current map: " ++ show updatedState
    put updatedState
    updateState xs
updateState [] = return "done"
