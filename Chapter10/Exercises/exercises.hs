-- CHAPTER 10. FOLDING LISTS
-- CHAPTER 10: CHAPTER EXERCISES
--------------------------------------------------------------------------------

module Chapter10.Exercises where

import Data.Bool

--------------------------------------------
-- Exercise: Warm-up and review
--------------------------------------------
-- 1. Given the following sets of consonants and vowels:
stops = "pbtdkg"
vowels = "aeiou"

-- a) Write a function that takes inputs from stops and vowels
-- and makes 3-tuples of all possible stop-vowel-stop com-
-- binations. These will not all correspond to real words in
-- English, although the stop-vowel-stop pattern is common
-- enough that many of them will.
stopVowelStop :: [(Char, Char, Char)]
stopVowelStop = [(x, y, z) | x <- stops, y <- vowels, z <- stops]

-- b) Modify that function so that it only returns the combina-
-- tions that begin with a p.
stopVowelStop_p :: [(Char, Char, Char)]
stopVowelStop_p = [(x, y, z) | x <- stops, y <- vowels, z <- stops, x == 'p']

-- c) Now set up lists of nouns and verbs (instead of stops and
-- vowels) and modify the function to make tuples represent-
-- ing possible noun-verb-noun sentences.
nouns = ["cat", "dog", "book"]
verbs = ["go", "sleep", "walk"]

nounVerbNoun :: [(String, String, String)]
nounVerbNoun = [(x, y, z) | x <- nouns, y <- verbs, z <- nouns]

-- 2. What does the following mystery function do? What is its type?
-- Try to get a good sense of what it does before you test it in the
-- REPL to verify it.
seekritFunc x = div (sum (map length (words x))) (length (words x))
-- It calculates the average word length.

-- 3. We’d really like the answer to be more precise. Can you rewrite
-- that using fractional division?
seekritFunc' :: String -> Float
seekritFunc' x = fromIntegral wordLength / fromIntegral wordNum
  where wordList   = words x
        wordLength = sum $ map length wordList
        wordNum    = length wordList

--------------------------------------------
-- Exercise: Rewriting functions using folds
--------------------------------------------
-- 1. myOr returns True if any Bool in the list is True.
myOr :: [Bool] -> Bool
myOr = foldr (||) False

-- 2. myAny returns True if a -> Bool applied to any of the values in the
-- list returns True.
myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr ((||) . f) False

-- 3. In addition to the recursive and fold based myElem, write a version
-- that uses any.
myElem :: Eq a => a -> [a] -> Bool
myElem f = myAny (==f)

-- 4. Implement myReverse, don’t worry about trying to make it lazy.
-- 4. Implement myReverse.
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

-- 5. Write myMap in terms of foldr. It should have the same behavior
-- as the built-in map.
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

-- 6. Write myFilter in terms of foldr. It should have the same behav-ior
-- as the built-in filter.
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\a b -> if f a then a : b else b) []

-- 7. squish flattens a list of lists into a list
squish :: [[a]] -> [a]
squish = foldr (++) []

-- 8. squishMap maps a function over a list and concatenates the results.
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr (\a b -> f a ++ b) []

-- 9. squishAgain flattens a list of lists into a list. This time re-use the
-- squishMap function.
squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

-- 10. myMaximumBy takes a comparison function and a list and returns the
-- greatest element of the list based on the last value that the comparison
-- returned GT for.
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f (x:xs) = foldl predicate x xs
  where predicate x y = bool y x (f x y == GT)

-- 11. myMinimumBy takes a comparison function and a list and returns the
-- least element of the list based on the last value that the comparison
-- returned LT for.
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f (x:xs) = foldl predicate x xs
  where predicate x y = bool y x (f x y == LT)
