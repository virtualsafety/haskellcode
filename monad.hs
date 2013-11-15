{--
half x = if even x
           then Just (x `div` 2)
           else Nothing



f :: Int -> Int -> Int -> Int
f m n p
 | m>=n && m>=p  =m
 | n>=m && n>=p  =n
 | otherwise     =p 
 
 --}


f :: Int -> Maybe Int
f n = Just (n + 1)

print' = do
 	print "foo"
 	print "bar"


getName = do
	putStrLn "Enter name:"
	name <- getLine
	putStrLn ("Hi " ++ name)

getName' = putStrLn "Enter name:" >>  getLine >>= putStrLn . ("Hi " ++ )


data MyMonad a = MyMonad a  deriving (Eq, Ord, Show)
 
instance Monad MyMonad where
  return = MyMonad
  (MyMonad a) >>= f = f a



