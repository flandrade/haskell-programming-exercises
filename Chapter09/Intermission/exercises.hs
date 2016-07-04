-- CHAPTER 9. LISTS
-- CHAPTER 9: INTERMISSION
--------------------------------------------------------------------------------

module Chapter09.Intermission where

import Data.Bool

--------------------------------------------
-- Exercise: EnumFromTo
--------------------------------------------
eftBool :: Bool -> Bool -> [Bool]
eftBool x y
  | x == y    = [y]
  | otherwise = x : eftBool (succ x) y

-- For all types
eft :: (Enum a, Eq a) => a -> a -> [a]
eft x y
  | x == y    = [y]
  | otherwise = x : eft (succ x) y

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd = eft

eftInt :: Int -> Int -> [Int]
eftInt = eft

eftChar :: Char -> Char -> [Char]
eftChar = eft

--------------------------------------------
-- Exercises: Thy Fearful Symmetry
--------------------------------------------
-- 1. Using takeWhile and dropWhile, write a function that takes a string and
-- returns a list of strings, using spaces to separate the elements of the
-- string into words
myWords :: String -> [String]
myWords "" = []
myWords s  = word : myWords remain
  where
    word   = takeWhile (/=' ') s
    remain = dropWhile (==' ') . dropWhile (/=' ') $ s

-- 2. Next, write a function that takes a string and returns a list of strings,
-- using newline separators to break up the string
-- PoemLines.hs

-- 3.  Now let’s look at what those two functions have in common. Try writing a
-- new function that parameterizes the character you’re breaking the string
-- argument on and rewrite myWords and myLines using it.
splitFun :: Char -> String -> [String]
splitFun _ ""  = []
splitFun ch s  = start : splitFun ch remain
  where
    start  = takeWhile (/=ch) s
    remain = dropWhile (==ch) . dropWhile (/=ch) $ s

myWords' :: String -> [String]
myWords' = splitFun ' '

myLines' :: String -> [String]
myLines' = splitFun '\n'

--------------------------------------------
-- Exercises: Comprehend Thy Lists
--------------------------------------------
-- Figure what you think the output lists will be.
-- let mySqr = [x^2 | x <- [1..5]]
-- [x | x <- mySqr, rem x 2 == 0]
-- [2, 16]

-- [(x, y) | x <- mySqr, y <- mySqr, x < 50, y > 50]
-- []
-- Not valid values for y

-- take 5 [(x, y) | x <- mySqr, y <- mySqr, x < 50, y > 50 ]
-- []
-- Not valid values for y

-- List comprehensions with Strings
-- Given the above, what do you think this function would do:
-- let myString xs = [x | x <- xs, elem x "aeiou"]
-- Extracts vowels

--------------------------------------------
-- Exercises: Square Cube
--------------------------------------------
-- Given the following:
mySqr = [x^2 | x <- [1..5]]
myCube = [y^3 | y <- [1..5]]
-- 1. First write an expression that will make tuples of the outputs of mySqr
-- and myCube.
e1 = [(x, y) | x <- mySqr, y <- myCube]

-- 2. Now alter that expression so that it only uses the x and y values that
-- are less than 50.
e2 = [(x, y) | x <- mySqr, y <- myCube, x < 50, y < 50]

-- 3. Apply another function to that listcomprehension to determine how many
-- tuples inhabit your output list.
e3 = length e2

--------------------------------------------
-- Exercises: Bottom Madness
--------------------------------------------
-- 1. Will the following expression return a value or be ⊥?
-- [x^y | x <- [1..5], y <- [2, undefined]]
-- ⊥

-- 2. take 1 $ [x^y | x <- [1..5], y <- [2, undefined]]
-- Returns a value: [1]

-- 3. Will the following expression return a value?
-- sum [1, undefined, 3]
-- No

-- 4. length [1, 2, undefined]
-- Returns a value: 3

-- 5. length $ [1, 2, 3] ++ undefined
-- No

-- 6. take 1 $ filter even [1, 2, 3, undefined]
-- Returns a value: [2]

-- 7. take 1 $ filter even [1, 3, undefined]
-- No

-- 8. take 1 $ filter odd [1, 3, undefined]
-- Returns a value: [1]

-- 9. take 2 $ filter odd [1, 3, undefined]
-- Returns a value: [1,3]

-- 10. take 3 $ filter odd [1, 3, undefined]
-- No

--------------------------------------------
-- Intermission: Is it in normal form?
--------------------------------------------
-- For each expression below, determine whether it’s in:
-- normal form, which implies weak head normal form;
-- weak head normal form only; or,
-- neither.
-- 1. [1, 2, 3, 4, 5]
-- NF

-- 2. 1 : 2 : 3 : 4 : _
-- WHNF

-- 3. enumFromTo 1 10
-- Neither

-- 4. length [1, 2, 3, 4, 5]
-- Neither

-- 5. sum (enumFromTo 1 10)
-- Neither

-- 6. ['a'..'m'] ++ ['n'..'z']
-- Neither

-- 7. (_, 'b')
-- WHNF

--------------------------------------------
-- Exercises: More Bottoms
--------------------------------------------
-- 1. Will the following expression return a value or be ⊥?
-- take 1 $ map (+1) [undefined, 2, 3]
-- Bottom

-- Will the following expression return a value?
-- take 1 $ map (+1) [1, undefined, 3]
-- Returns a value: [2]

-- 3. take 2 $ map (+1) [1, undefined, 3]
-- Bottom

-- 4. What does the following mystery function do? What is its type?
-- itIsMystery xs = map (\x -> elem x "aeiou") xs
-- Returns a list of Bool: True if the character in xs is a vowel.

-- What will be the result of the following functions:
-- a) map (^2) [1..10]
-- [1,4,9,16,25,36,49,64,81,100]

-- b) map minimum [[1..10], [10..20], [20..30]]
-- [1, 10, 20]

-- c) map sum [[1..5], [1..5], [1..5]]
-- [15,15,15]

-- 6. Back in the Functions chapter, you wrote a function called foldBool.
-- Write a function that does the same (or simi- lar,ifyouwish)asthemap
-- (if-then-else)function you saw above but uses bool instead.
foldBool' :: Num a => (a -> Bool) -> [a] -> [a]
foldBool' f = map (\x -> bool x (-x) (f x))

foldBool'' = foldBool' (==3) [1..10]

--------------------------------------------
-- Exercises: Filtering
--------------------------------------------
-- 1. Given the above, how might we write a filter function that would give us
-- all the multiples of 3 out of a list from 1-30?
filter1 = filter (\x -> (rem x 3) == 0) [1..30]

-- 2. How could we compose the above function with the length function to tell
-- us *how many* multiples of 3 there are between 1 and 30?
filter2 = length . filter (\x -> (rem x 3) == 0) $ [1..30]

-- 3. Next we’re going to work on removing all articles (’the’, ’a’, and ’an’)
-- from sentences.
filter3 :: String -> [String]
filter3 str = filter (`notElem`["the","an","a"]) (myWords str)

--------------------------------------------
-- Zipping exercises
--------------------------------------------
-- 1. Write your own version of zip :: [a] -> [b] -> [(a, b)] and ensure
-- it behaves the same as the original.
zip' :: [a] -> [b] -> [(a, b)]
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys
zip' _ _           = []

-- 2. Do what you did for zip, but now for
-- zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
zipWith' _ _ _           = []

-- 3. Rewrite your zip in terms of the zipWith you wrote.
zip'' :: [a] -> [b] -> [(a, b)]
zip'' = zipWith' (,)
