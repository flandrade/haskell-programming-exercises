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
