-- CHAPTER 8. RECURSION
-- CHAPTER 8: CHAPTER EXERCISES
--------------------------------------------------------------------------------

-- Review of types
-- 1. What is the type of [[True, False], [True, True], [False, True]] ?
-- d) [[Bool]]

-- 2. Which of the following has the same type as [[True, False], [True, True],
-- [False, True]]?
-- b) [[3 == 3], [6 > 5], [3 < 4]]

-- 3. For the following function
-- func :: [a] -> [a] -> [a]
-- func x y = x ++ y
-- which of the following is true?
-- d) all of the above

-- 4. For the func code above, which is a valid application of func to both of
-- its arguments?
-- b) func "Hello" "World"


-- Reviewing currying
cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

-- 1. What is the value of appedCatty "woohoo!" ?
-- "woops mrow woohoo!"

-- 2. frappe "1"
-- "1 mrow haha "

-- 3. frappe (appedCatty "2")
-- "woops mrow 2 mrow haha"

-- 4. appedCatty
-- "woops mrow blue mrow haha"

-- 5. cattyConny
-- "pink mrow haha mrow green mrow woops mrow blue"

-- 6. cattyConny
-- "are mrow Pugs mrow awesome"

-- Recursion
-- 1. Write out the steps for reducing dividedBy 15 2 to its final answer
-- according to the Haskell code.
-- dividedBy 15 2 = go 15 2 0
--                  go (15-2) 2 1
--                  go (13-2) 2 2
--                  go (11-2) 2 3
--                  go (9-2) 2 4
--                  go (7-2) 2 5
--                  go (5-2) 2 6
--                  go (3-2) 2 7
--                  (7, 1)
