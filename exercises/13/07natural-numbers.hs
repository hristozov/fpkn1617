import           Unit

naturals :: [Integer]
naturals = helper 1 where
  helper start = start : helper (start + 1)

main = do {
  assertEqual [1..3] (take 3 naturals);
  assertEqual [16..19] (take 4 (drop 15 naturals));
}
