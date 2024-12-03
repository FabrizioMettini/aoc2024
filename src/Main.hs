module Main where

-- Would like to have dynamic loadable modules
import Day01 ( parseContent, part1, part2 )

main :: IO ()
main = do putStr "Enter day XX (01, 02, ..): "
          day <- getLine
          
          -- This maybe need some refactoring
          let inputFile = "../inputs/input" ++ day
          let outputPart1File = "../outputs/output" ++ day ++ "01"
          let outputPart2File = "../outputs/output" ++ day ++ "02"
          
          content <- readFile inputFile 
          let parsedInput = parseContent content
          let answerPart1 = part1 parsedInput
          let answerPart2 = part2 parsedInput 
          writeFile outputPart1File (show answerPart1)
          writeFile outputPart2File (show answerPart2)
