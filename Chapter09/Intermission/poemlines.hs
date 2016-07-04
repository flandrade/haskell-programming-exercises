module Chapter09.PoemLines where

sentences :: String
sentences = "Tyger Tyger, burning bright\n" ++
            "In the forests of the night\n" ++
            "What immortal hand or eye\n" ++
            "Could frame thy fearful symmetry?"

-- putStrLn sentences -- should print
-- Tyger Tyger, burning bright
-- In the forests of the night
-- What immortal hand or eye
-- Could frame thy fearful symmetry?
-- Implement this
myLines :: String -> [String]
myLines "" = []
myLines s  = line : myLines remain
  where
    line = takeWhile (/='\n') s
    remain = dropWhile (=='\n') . dropWhile (/='\n') $ s

-- What we want 'myLines sentences' to equal
shouldEqual :: [String]
shouldEqual =
  [ "Tyger Tyger, burning bright"
  , "In the forests of the night"
  , "What immortal hand or eye"
  , "Could frame thy fearful symmetry?"
  ]

-- The main function here is a small test
-- to ensure you've written your function
-- correctly.
main :: IO ()
main =
  print $ "Are they equal? " ++ show (myLines sentences == shouldEqual)
