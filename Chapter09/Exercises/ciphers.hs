module Chapter09.Ciphers where

import Data.Char

-- Apply caesar cipher to list
caesar :: Int -> String -> String
caesar _ "" = ""
caesar n x  = map (shiftToChar n) x

-- Apply uncaesar to list
unCaesar :: Int -> String -> String
unCaesar _ "" = ""
unCaesar n x  = map (shiftToChar val) x
  where val = negate n

-- Shifts one charater
shiftToChar :: Int -> Char -> Char
shiftToChar n x = chr shiftedNorm
  where shifted     = (+(normalize n)) (ord x)
        shiftedNorm =  valUnNorm (normalize (valNorm shifted))

-- Normalize value (26)
normalize :: Int -> Int
normalize n = n `mod` 26

-- Transform the character value in a value between 1 and 26
valNorm :: Int -> Int
valNorm = flip (-) 96

-- Transform value between 1 and 26 to the charater value
valUnNorm :: Int -> Int
valUnNorm = (+96)
