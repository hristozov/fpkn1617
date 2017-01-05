import Unit

evens l = filter even l

main = do {
  assertEqual [2, 4, 6, 8] (evens [1..9]);
}
