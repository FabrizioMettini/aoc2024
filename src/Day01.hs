module Day01 ( parseContent, part1, part2 ) where 

import Data.List ( sort )

-- Parse input 
parseContent :: String -> ([Int], [Int])
parseContent content = let values = map read $ words content
                           -- I could use Data.List partition here
                           group1List = sort [x | (x, i) <- zip values [0..], even i]
                           group2List = sort [x | (x, i) <- zip values [0..], odd i]
                       in (group1List, group2List)

-- Part 1 : calculate total distance score
part1 :: ([Int], [Int]) -> Int
part1 (group1List, group2List) = sum [abs (x - y) | (x, y) <- zip group1List group2List] 

-- Part2 : calculate total similarity score
-- O(N.M) algorithm, it can be improved
part2 :: ([Int], [Int]) -> Int
part2 (group1List, group2List) = sum [x * countA x group2List | x <- group1List] 
  where
    countA x = length . filter (x==) 
