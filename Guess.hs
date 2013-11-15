module Guess
    where

import System.IO
import System.Random

main = do
  hSetBuffering stdin LineBuffering
  num <- randomRIO (1::Int, 100)
  putStrLn "I’m thinking of a number between 1 and 100"
  doGuessing num

{--
doGuessing num = do
   putStrLn "Enter your guess:"
   guess <- getLine
   let guessNum = read guess
   if guessNum < num
   then do putStrLn "Too low!"
           doGuessing num
   else if read guess > num
        then do putStrLn "Too high!"
                doGuessing num
        else do putStrLn "You Win!"
 --}

doGuessing num = do
  putStrLn "Enter your guess:"
  guess <- getLine
  case compare (read guess) num of
    LT -> do putStrLn "Too low!"
             doGuessing num
    GT -> do putStrLn "Too high!"
             doGuessing num
    EQ -> putStrLn "You Win!"
