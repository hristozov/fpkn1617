import Unit

sum' [] = 0
sum' (x:xs) = x + sum' xs

main = do {
  assertEqual 1 (sum' [1]);
  assertEqual 6 (sum' [1, 2, 3]);
}
