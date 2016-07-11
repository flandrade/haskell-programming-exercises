-- CHAPTER 10. LISTS
-- CHAPTER 10: FOLDING LISTS
--------------------------------------------------------------------------------

module Chapter10.Intermission where

import Data.Time

--------------------------------------------
-- 10.5. Exercise: Undertanding Folds
--------------------------------------------

-- 1. foldr (*) 1 [1..5]
-- will return the same result as which of the following:
-- b) foldl (flip (*)) 1 [1..5]
-- c) foldl (*) 1 [1..5]

-- foldl (*) and foldl (flip (*)) have the same result.
-- foldl (*) 1 [1..5]
-- foldl (*) ((*) 1 1) [2..5]
-- foldl (*) ((*) 1 2) [3..5]
-- foldl (*) ((*) 2 3) [4..5]
-- foldl (*) ((*) 6 4) [5]
-- foldl (*) ((*) 24 5) []
-- 120

-- 2. Write out the evaluation steps for
-- foldl (flip (*)) 1 [1..3]
-- foldl (flip (*)) ((flip (*)) 1 1) [2..3]
-- foldl (flip (*)) (1 * 1) [2..3]
-- foldl (flip (*)) ((flip (*)) 1 2) [3]
-- foldl (flip (*)) (2 * 1) [3]
-- foldl (flip (*)) ((flip (*)) 2 3) []
-- foldl (flip (*)) (3 * 2) []
-- foldl (flip (*)) (6) []
-- 6

-- 3. One difference between foldr and foldl is:
-- c) foldr, but not foldl, associates to the right

-- 4. Folds are catamorphisms, which means they are generally used to
-- a) reduce structure

-- 5. The following are simple folds very similar to what you’ve already seen,
-- but each has at least one error.
-- a) foldr (++) ["woot", "WOOT", "woot"]
--    foldr (++) "" ["woot", "WOOT", "woot"]
-- b) foldr max [] "fear is the little death"
--    foldr max minBound "fear is the little death"
-- c) foldr and True [False, True]
--    foldr (&&) True [False, True]
-- d) This one is more subtle than the previous. Can it ever return a
-- different answer?
-- foldr (||) True [False, True]
--    No, because True || _ = is always True.
-- e) foldl ((++) . show) "" [1..5]
--    foldr (flip ((++) . show)) "" [1..5]
-- f) foldr const 'a' [1..5]
--    foldl const 'a' [1..5]
-- g) foldr const 0 "tacos"
--    foldl const 0 "tacos"
-- h) foldl (flip const) 0 "burritos"
--    foldr (flip const) 0 "burritos"
-- i) foldl (flip const) 'z' [1..5]
--    foldr (flip const) 'z' [1..5]

-- For exercises f and g.
-- foldr definition: foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
-- Given foldr const 'a' [1..3]:
-- foldr const 'a' :: Foldable t => t Char -> Char
--                                  ^- argument should be Char.
-- Therefore, the list elements should be Char.
-- On the other hand, with foldl:
-- foldl const 'a' :: Foldable t => t b -> Char
--                                    ^- argument is not binded.
-- foldl const 'a' [1..3]
-- const ((const (const 'a' 1) 2)) 3 --> 'a'

--------------------------------------------
-- 10.6. Exercises: Database Processing
--------------------------------------------
-- database.hs

--------------------------------------------
-- 10.9. Scans Exercises
--------------------------------------------
-- 1. Modify your fibs function to only return the first 20 Fibonacci numbers.
fibs = 1 : scanl (+) 1 fibs

fibs20 :: [Integer]
fibs20 = take 20 fibs

-- 2. Modify fibs to return the Fibonacci numbers that are less than 100.
fibs100 :: [Integer]
fibs100 = takeWhile (<100) fibs

-- 3. Try to write the factorial function from Recursion as a scan. You’ll
-- want scanl again, and your start value will be 1.
factorial = scanl (*) 1 [1..]

nFactorial :: Int -> Integer
nFactorial n = factorial !! n
