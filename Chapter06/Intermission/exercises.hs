-- CHAPTER 6. TYPECLASSES
-- CHAPTER 6: INTERMISSION
--------------------------------------------------------------------------------

-- Exercises: Will They Work?
-- 1. max (length [1, 2, 3]) (length [8, 9, 10, 11, 12])
-- 5

-- 2. compare (3 * 4) (3 * 5)
-- LT

-- 3. compare "Julie" True
-- It won't work. Different types.

-- 4. (5 + 3) > (3 + 6)
-- False


-- Exercises: Will They Work?
-- Write the Eq instance for the datatype provided.
-- 1. It’s not a typo, we’re just being cute with the name.
data TisAnInteger = TisAn Integer

instance Eq TisAnInteger where
  (==) (TisAn x) (TisAn x') = x == x'

-- 2.
data TwoIntegers = Two Integer Integer

instance Eq TwoIntegers where
  (==) (Two x y) (Two x' y') = (x == x') && (y == y')

-- 3.
data StringOrInt = TisAnInt Int | TisAString String

instance Eq StringOrInt where
  (==) (TisAnInt x) (TisAnInt x')     = x == x'
  (==) (TisAString y) (TisAString y') = y == y'
  (==) _ _                            = False

-- 4.
data Pair a = Pair a a

instance Eq a => Eq (Pair a) where
  (==) (Pair x y) (Pair x' y') = (x == x') && (y == y')

-- 5.
data Tuple a b = Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple x y) (Tuple x' y') = (x == x') && (y == y')

-- 6.
data Which a = ThisOne a | ThatOne a

instance Eq a => Eq (Which a) where
  (==) (ThisOne x) (ThisOne x') = x == x'
  (==) (ThatOne y) (ThatOne y') = y == y'
  (==) _ _                      = False

-- 7.
data EitherOr a b = Hello a | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello x) (Hello x')     = x == x'
  (==) (Goodbye y) (Goodbye y') = y == y'
  (==) _ _                      = False
