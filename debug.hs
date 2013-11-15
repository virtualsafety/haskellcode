module Main where
import Debug.Trace
 
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = trace ("n: " ++ show n) $ fib (n - 1) + fib (n - 2)
 
main = putStrLn $ "fib 4: " ++ show (fib 4)

