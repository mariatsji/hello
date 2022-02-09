module Profunctor where

import Data.Profunctor

newtype Function a b where
    Function :: {
        runFunction :: a -> b
    } -> Function a b

example :: Function a a
example = Function id

instance Functor (Function a) where
    fmap f (Function g) = Function (f . g)

instance Profunctor Function where
    dimap fab fcd (Function f) = Function (fcd . f . fab)

thus :: Function Int String
thus = 
    let myFunc = Function succ :: Function Int Int
    in dimap succ show myFunc

unWrapped :: Int -> String
unWrapped = runFunction thus

runIt :: String
runIt = unWrapped 5