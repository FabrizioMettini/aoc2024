module Day02 ( parseContent, part1, part2 ) where

-- Parse input 
parseContent :: String -> [[Int]]
parseContent content = map read . words <$> lines content

-- Part 1 : calculate how many reports are safe
part1 :: [[Int]] -> Int
part1 = length . filter isSafe
  where
    isSafe report   = allInc report || allDec report
    allInc (x:y:xs) = y - x >= 1 && y - x <= 3 && allInc (y:xs)
    allInc _        = True
    allDec (x:y:xs) = x - y >= 1 && x - y <= 3 && allDec (y:xs)
    allDec _        = True

-- Part 2 : calculate how many reports are safe according to the new specification
part2 :: [[Int]] -> Int
part2 = undefined
