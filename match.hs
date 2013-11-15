




length' :: [a] -> Integer
length' [] = 0
length' (x:xs) = 1 + length' xs

findElement :: (a -> Bool) -> [a] -> Maybe a
findElement p [] = Nothing
findElement p (x:xs) =
   if p x then Just x
   else findElement p xs


