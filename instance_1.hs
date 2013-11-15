{-# LANGUAGE FlexibleInstances #-}

class Listable a where
  toList :: a -> [Int]

instance Listable Int where
  -- toList :: Int -> [Int]
  toList x = [x]

data Tree a = Empty | Node a (Tree a) (Tree a)

instance Listable [Int] where
  toList = id

instance Listable (Tree Int) where
  toList Empty        = []
  toList (Node x l r) = toList l ++ [x] ++ toList r

myTree :: Tree Int
myTree = Node 1 (Node 2 Empty (Node 3 Empty Empty)) (Node 4 Empty Empty)

-- show
instance (Listable a, Listable b) => Listable (a,b) where
  toList (x,y) = toList x ++ toList y
  
main = print (toList (3::Int), toList myTree)