import Data.Array.Repa as R 
main = do 
   let xs = fromListUnboxed (Z :. 2 :. 2 :: DIM2) [0..(3::Int)]
   putStrLn $ show $ xs ! (Z :. 1 :. 1)