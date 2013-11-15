import Data.List as L;

main = putStrLn $ show $ L.foldl1' (+) [1..1000000000]
 