module Problem008 where

splitAny :: String -> [[Char]]
splitAny s = case drop 1 s of
  "" -> [s]
  rest -> char : splitAny s
    where (char, s) = (take 1 rest, rest)

nthWindow :: String -> Int -> Int -> String
nthWindow searchSpace n width = take width $ drop n searchSpace

makeInts :: [[Char]] -> [Int]
makeInts chars = map (\n -> read n :: Int) chars

multiplyWindows :: [Int] -> Int
multiplyWindows ints = foldl (*) 1 ints

windows :: Int -> String -> [Int]
windows windowWidth searchSpace = map (multiplyWindows . makeInts . splitAny) $ map (\nth -> nthWindow searchSpace (nth - windowWidth) windowWidth) [windowWidth..length searchSpace]

maximumNum :: Int -> String -> Int
maximumNum windowWidth searchSpace = maximum (windows windowWidth searchSpace)
