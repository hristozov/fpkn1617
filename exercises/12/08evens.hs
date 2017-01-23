import           Unit

evens l = filter even l

-- currying:
evens2 = filter even

main = do {
  assertEqual [2, 4, 6, 8] $ evens [1..9];
  assertEqual [2, 4, 6, 8] $ evens2 [1..9]
}
