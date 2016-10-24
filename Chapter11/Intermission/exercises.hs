-- CHAPTER 11. ALGEBRAIC DATATYPES
-- CHAPTER 11: INTERMISSION
--------------------------------------------------------------------------------

module Chapter11.Intermission where

--------------------------------------------
-- 11.5. Exercises: Dog Types
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


--------------------------------------------
-- 11.6. Exercises: Vehicles
--------------------------------------------

data Price = Price Integer deriving (Eq, Show)

data Manufacturer = Mini | Mazda | Tata
  deriving (Eq, Show)

data Vehicle = Car Manufacturer Price
             | Plane Airline
  deriving (Eq, Show)

data Airline = PapuAir | CatapultsR'Us | TakeYourChancesUnited
  deriving (Eq, Show)

myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir

-- 1. What is the type of myCar?
-- myCar :: Vehicle

-- 2. Given the following, define the functions:
isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _         = False

isPlane :: Vehicle -> Bool
isPlane (Plane _) = True
isPlane _         = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

-- 3. Now we’re going to write a function to tell us the manufacturer
--    of a piece of data:
getManu :: Vehicle -> Manufacturer
getManu (Car manufacturer _) = manufacturer

-- 4. Given that we’re returning the Manufacturer, what will happen if
--    you use this on Plane data?
-- It fails because of Non-exhaustive pattern matching.

-- 5. All right. Let’s say you’ve decided to add the size of the plane as
-- an argument to the Plane constructor. Add that to your datatypes
-- in the appropriate places and change your data and functions
-- appropriately.
data Size = Size Integer deriving (Eq, Show)

data Vehicle' = Car' Manufacturer Price
              | Plane' Airline Size
  deriving (Eq, Show)

doge' = Plane' PapuAir (Size 300)

isPlane' :: Vehicle' -> Bool
isPlane' (Plane' _ _) = True
isPlane' _            = False


--------------------------------------------
-- 11.8. Exercises: Cardinality
--------------------------------------------

-- While we haven’t explicitly described the rules for calculating the
-- cardinality of datatypes yet, you might already have an idea of how to do
-- it for simple datatypes with nullary constructors.

-- 1.
data PugType = PugData
-- It's 1

-- 2. For this one, recall that Bool is also defined with the |:
data Airline =
       PapuAir
     | CatapultsR'Us
     | TakeYourChancesUnited
-- It's 2

-- 3. Given what we know about Int8, what’s the cardinality of Int16?
-- It's 65536

-- 4. Use the REPL and maxBound and minBound to examine Int and Integer.
-- What can you say about the cardinality of those types?
-- minBound and maxBound is not defined for Integer.

-- 5. Extra credit (impress your friends!): What’s the connection between the
-- 8 in Int8 and that type’s cardinality of 256?
-- Int8 = 2 ^ 8 = 256 
