lucky :: (Integral a) => a -> String  
lucky 7 = "LUCKY NUMBER SEVEN!"  
lucky x = "Sorry, you're out of luck, pal!" 

head' :: [a] -> a  
head' [] = error "Can't call head on an empty list, dummy!"  
head' (x:_) = x  

max' :: (Ord a) => a -> a -> a  
max' a b   
    | a > b     = a  
    | otherwise = b 


quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted  

addThree :: (Num a) => a -> a -> a -> a  
addThree = \x -> \y -> \z -> x + y + z  


infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)  

class YesNo a where  
    yesno :: a -> Bool  

instance YesNo Int where  
    yesno 0 = False  
    yesno _ = True 

instance YesNo [a] where  
    yesno [] = False  
    yesno _ = True  

instance YesNo (Maybe a) where  
    yesno (Just _) = True  
    yesno Nothing = False 