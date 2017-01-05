import Unit

square l = map (\x -> x ^ 2) l
square2 l = map (^ 2) l

main = do {
  assertEqual [1,4,9,16,25,36,49,64,81] (square [1..9]);
  assertEqual [1,4,9,16,25,36,49,64,81] (square2 [1..9]);
}
