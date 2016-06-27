-- CHAPTER 6. TYPECLASSES
-- CHAPTER 6: CHAPTER EXERCISES
--------------------------------------------------------------------------------

-- Multiple choice
-- 1. The Eq class
-- c) makes equality tests possible

-- 2. The typeclass Ord
-- b) is a subclass of Eq

-- 3. Suppose the typeclass Ord has an operator >. What is the type of >?
-- a) Ord a => a -> a -> Bool

-- 4. Inx = divMod 16 12
-- c) the type of 𝑥 is a tuple

-- 5. The typeclass Integral includes
-- a) Int and Integer numbers


-- Examine the following code and decide whether it will typecheck.
--

-- 1. No, Person does not implement an instance of Show.
data Person = Person Bool deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

-- 2. No, Mood does not implement an instance of Eq.
data Mood = Blah | Woot deriving (Show, Eq)

settleDown x = if x == Woot then Blah else x

-- 3. If you were able to get settleDown to typecheck:
-- a) What values are acceptable inputs to that function?
--    Blah or Woot.
-- b) What will happen if you try to run settleDown 9? Why?
--    Runtime error because Mood does not implement a Num instance.
-- c) What will happen if you try to run Blah > Woot? Why?
--    Runtime error because Mood doesn not implememt an Ord.

-- 4. Yes.
type Subject = String
type Verb = String
type Object = String

data Sentence = Sentence Subject Verb Object deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"


-- Given a datatype declaration, what can we do?
data Rocks = Rocks String deriving (Eq, Show)
data Yeah = Yeah Bool deriving (Eq, Show)
data Papu = Papu Rocks Yeah deriving (Eq, Show)

-- Which of the following will typecheck?
-- 1. No, Papu expects types Rocks and Yeah.
-- phew = Papu "chases" True

-- 2. Yes.
-- truth = Papu (Rocks "chomskydoz") (Yeah True)

-- 3. Yes.
-- equalityForall :: Papu -> Papu -> Bool
-- equalityForall p p' = p == p'

-- 4. No, Papu does not implement an Ord instance.
-- comparePapus :: Papu -> Papu -> Bool
-- comparePapus p p' = p > p'


-- Match the types
-- 1. For the following definition.
-- a)
-- i :: Num a => a
-- i = 1
