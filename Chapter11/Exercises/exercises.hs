-- CHAPTER 11. ALGEBRAIC DATATYPES
-- CHAPTER 11: INTERMISSION
--------------------------------------------------------------------------------

module Chapter11.Intermission where

--------------------------------------------
-- 11.4. Exercises: Dog Types
--------------------------------------------

data PugType = PugData

data HuskyType a = HuskyData

data DogueDeBordeaux doge = DogueDeBordeaux doge

data Doggies a =
    Husky a
  | Mastiff a
  deriving (Eq, Show)

-- 1. Is Doggies a type constructor or a data constructor?
--    Type constructor

-- 2. What is the kind of Doggies?
--    * -> *

-- 3. What is the kind of Doggies String?
--    *

-- 4. What is the type of Husky 10?
--    Num a => Doggies a

-- 5. What is the type of Husky (10 :: Integer)?
--    Doggies Integer

-- 6. What is the type of Mastiff "Scooby Doo"?
--    Doggies [Char]

-- 7. Is DogueDeBordeaux a type constructor or a data constructor?
--    It's both

-- 8. What is the type of DogueDeBordeaux?
--    DogueDeBordeaux doge

-- 9. What is the type of DogueDeBordeaux "doggie!"
--    DogueDeBordeaux [Char]
