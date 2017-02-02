import           Unit

sublists :: Ord t => [t] -> [[t]]
sublists l = helper l [] where
  helper :: Ord t => [t] -> [t] -> [[t]]
  helper [] current = [current]
  helper (x:xs) current
    | null current || x > last current = helper xs (current ++ [x])
    | otherwise = current : helper xs [x]

median :: [a] -> a
median l = l !! (length l `div` 2)

solution :: Ord a => [a] -> [a]
solution l = map median $ sublists l

main = do {
  assertEqual [1,2,3,9,1] $ solution [1,1,2,3,1,2,3,4,5,5,9,15,1];
  assertEqual [1,2,4] $ solution [1,1,2,1,2,3,4,5,6];
  assertEqual [1,1,1,1,1,1] $ solution [1,1,1,1,1,1];
  assertEqual [6,6,6] $ solution [5,6,5,6,5,6];
  assertEqual [6,6,6,5] $ solution [6,5,6,5,6,5];
  assertEqual [1] $ solution [1]
}
