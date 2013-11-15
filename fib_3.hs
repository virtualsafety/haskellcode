import System.Environment 

fib = 0:1:(zipWith (+) fib (tail fib))
 

main = do
  args <- getArgs
  print $ (fib !!) $ read $ args !! 0
