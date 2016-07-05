-- CHAPTER 9. LISTS
-- CHAPTER 9: CHAPTER EXERCISES
--------------------------------------------------------------------------------
module Chapter09.Exercises where

import Data.Char
import Data.Bool

--------------------------------------------
-- Data.Char
--------------------------------------------
-- 1. Query the types of isUpper and toUpper.
-- isUpper :: Char -> Bool
-- toUpper :: Char -> Char

-- 2.  Write that function such that, given the input “HbEfLrLxO,” your
-- function will return “HELLO.”
removeLower :: String -> String
removeLower = filter isUpper

-- 3. Write a function that will capitalize the first letter of a String and
-- return the entire String.
capitalizeFirst :: String -> String
capitalizeFirst ""     = ""
capitalizeFirst (x:xs) = toUpper x : xs

-- 4.  Now make a new version of that function that is recursive such that
-- if you give it the input “woot” it will holler back at you “WOOT.”
capitalize :: String -> String
capitalize ""     = ""
capitalize (x:xs) = toUpper x : capitalize xs

capitalize' :: String -> String
capitalize' = map toUpper

-- 5. Now write a function that will capitalize the first letter of a String
-- and return only that letter as the result.
-- head :: [a] -> a
firstLetter :: String -> Char
firstLetter s = toUpper (head s)

-- 6. Now rewrite it as a composed function. Then, for fun, rewrite it
-- pointfree.
firstLetter' :: String -> Char
firstLetter' = toUpper . head

--------------------------------------------
-- Ciphers
--------------------------------------------
-- Ciphers.hs

--------------------------------------------
-- Writing your own standard functions
--------------------------------------------
myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = x && myAnd xs

-- 1. myOr returns True if any Bool in the list is True.
myOr :: [Bool] -> Bool
myOr []     = False
myOr (x:xs) = x || myOr xs

-- 2. myAny returns True if a -> Bool applied to any of the values in
-- the list returns True.
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ []     = False
myAny f (x:xs) = f x || myAny f xs

-- 3 .After you write the recursive myElem, write another version that
-- uses any.
myElem :: Eq a => a -> [a] -> Bool
myElem _ []     = False
myElem a (x:xs) = (a==x) || myElem a xs

myElem' :: Eq a => a -> [a] -> Bool
myElem' a = myAny (==a)

-- 4. Implement myReverse.
myReverse :: [a] -> [a]
myReverse []   = []
myReverse (x:xs) = myReverse xs ++ [x]

-- 5. squish flattens a list of lists into a list
squish :: [[a]] -> [a]
squish []     = []
squish [x]    = x
squish (x:xs) = x ++ squish xs

-- 6. squishMap maps a function over a list and concatenates the results.
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ []     = []
squishMap f (x:xs) = f x ++ squishMap f xs

-- 7. squishAgain flattens a list of lists into a list. This time re-use
-- the squishMap function.
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 8. myMaximumBy takes a comparison function and a list and returns
-- the greatest element of the list based on the last value that the
-- comparison returned GT for.
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
-- myMaximumBy _ []     = ?
myMaximumBy f (x:xs) = go f xs x
  where go _ [] r     = r
        go g [y] r    = case g y r of
                             GT -> y
                             _  -> r
        go g (y:ys) r = case g y r of
                             GT -> go g ys y
                             _  -> go g ys r

-- 9. myMinimumBy takes a comparison function and a list and returns
-- the least element of the list based on the last value that the com-
-- parison returned LT for.
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f (x:xs) = go f xs x
  where go _ [] r     = r
        go g [y] r    = case g y r of
                             LT -> y
                             _  -> r
        go g (y:ys) r = case g y r of
                             LT -> go g ys y
                             _  -> go g ys r

-- 10. Using the myMinimumBy and myMaximumBy functions, write your
-- own versions of maximum and minimum .
myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
