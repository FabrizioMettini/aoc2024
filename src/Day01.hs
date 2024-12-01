module Day01 ( part1, part2 ) where 

import Data.List ( sort )

-- Files
inputFile :: FilePath
inputFile = "input.txt"

outputPart1File :: FilePath
outputPart1File = "output1.txt"

outputPart2File :: FilePath
outputPart2File = "output2.txt"

-- Program
main :: IO ()
main = do content <- readFile inputFile 
          let answerPart1 = part1 content
          let answerPart2 = part2 content
          writeFile outputPart1File $ show answerPart1
          writeFile outputPart2File $ show answerPart2
          print answerPart1
          print answerPart2

-- Part 1 : calculate total distance score
part1 :: String -> Int
part1 content = let values     = map read $ words content
                    group1List = sort [x | (x, i) <- zip values [0..], even i]
                    group2List = sort [x | (x, i) <- zip values [0..], odd i]
                    distances  = [abs (x - y) | (x, y) <- zip group1List group2List] 
                in sum distances

-- Part2 : calculate total similarity score
part2 :: String -> Int
part2 content = let values     = map read $ words content
                    group1List = sort [x | (x, i) <- zip values [0..], even i]
                    group2List = sort [x | (x, i) <- zip values [0..], odd i]
                    similarity = [x * countA x group2List | x <- group1List] 
                in sum similarity

-- Helper function
countA :: Eq a => a -> [a] -> Int
countA x xs = length $ filter (x==) xs
