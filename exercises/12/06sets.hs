import           Unit

-- Познатите ни от Scheme операции с множества.

union :: Eq a => [a] -> [a] -> [a]
union [] l = l
union (x:xs) l = if x `elem` l
  then xs `union` l
  else x : xs `union` l

intersection :: Eq a => [a] -> [a] -> [a]
intersection [] l = []
intersection (x:xs) l = if x `elem` l
  then x : xs `intersection` l
  else xs `intersection` l

difference :: Eq a => [a] -> [a] -> [a]
difference [] l = []
difference (x:xs) l = if x `elem` l
  then xs `difference` l
  else x : xs `difference` l

main = do {
  assertEqual [1] $ [1] `union` [];
  assertEqual [1] $ [] `union` [1];
  assertEqual [1] $ [1] `union` [1];
  assertEqual [1, 2] $ [1] `union` [2];
  assertEqual [1, 2, 3] $ [1, 2] `union` [2, 3];
  assertEqual [1] $ [1, 2] `intersection` [1, 3];
  assertEqual [] $ [4, 2] `intersection` [1, 3];
  assertEqual [] $ [1, 2] `difference` [1, 2];
  assertEqual [] $ [1, 2] `difference` [1, 2, 3];
  assertEqual [4] $ [1, 2, 4] `difference` [1, 2, 3];
  assertEqual [4, 5] $ [4, 5] `difference` [1, 2, 3];
}
