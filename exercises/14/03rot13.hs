import           Data.Char
import           Unit

returnNext c
  | c < 'A' || c > 'z' = c
  | c == 'Z' = 'A'
  | c == 'z' = 'a'
  | otherwise = chr (ord c + 1)

iterate' f x = x : iterate' f (f x)

rot13Char c = iterate returnNext c !! 13

rot13 = map rot13Char

main = assertEqual "Uryyb, jbeyq!" $ rot13 "Hello, world!"
