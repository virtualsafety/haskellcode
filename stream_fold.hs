{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE NoImplicitPrelude #-}

import Control.Applicative
import Data.List (foldl')
import Data.Monoid
import Data.Strict.Tuple
import Prelude hiding (sum, length, product)

data Fold a b = forall w.  (Monoid w) => Fold
    { tally   :: a -> w
    , compute :: w -> b
    }

fold'' :: Fold a b -> [a] -> b
fold'' (Fold t c) xs =
    c (foldl' mappend mempty (map t xs))

instance (Monoid a, Monoid b) => Monoid (Pair a b) where
    mempty = (mempty :!: mempty)
    mappend (aL :!: aR) (bL :!: bR) =
        (mappend aL bL :!: mappend aR bR)

instance Functor (Fold a) where
    fmap f (Fold t k) = Fold t (f . k)

instance Applicative (Fold a) where
    pure a    = Fold (\_ -> ()) (\_ -> a)
    (Fold tL cL) <*> (Fold tR cR) =
        let t x = (tL x :!: tR x)
            c (wL :!: wR) = (cL wL) (cR wR)
        in  Fold t c

genericLength :: (Num b) => Fold a b
genericLength =
    Fold (\_ -> Sum (1::Int)) (fromIntegral . getSum)

sum :: (Num a) => Fold a a
sum = Fold Sum getSum

sumSq :: (Num a) => Fold a a
sumSq = Fold (\x -> Sum (x ^ 2)) getSum

average :: (Fractional a) => Fold a a
average = (\s c -> s / c) <$> sum <*> genericLength

product :: (Num a) => Fold a a
product = Fold Product getProduct

std :: (Floating a) => Fold a a
std =  (\ss s len -> sqrt (ss / len - (s / len)^2))
    <$> sumSq
    <*> sum
    <*> genericLength

main=print $ fold'' ((,) <$> sum <*> product) [1..100]
