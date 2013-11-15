
import Data.Vector as V;

main=print $ V.foldl1' (+) $ generate 1000000000  id

{-
import Data.List as L;
main = putStrLn $ show $ L.foldl1' (+) [1..1000000000]

--}