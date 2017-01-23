import           Unit

addTwo :: Num a => a -> a
addTwo x = x + 2

add :: Num a => a -> a -> a
add x y = x + y

addFour :: Integer -> Integer
addFour = add 4

main = do {
  assertEqual 5 $ addTwo 3;
  assertEqual 7 $ add 3 4;
  assertEqual 11 $ addFour 7
}
