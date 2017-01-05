import           Unit

getColumn :: [[b]] -> Int -> [b]
getColumn m n = map (\row -> row !! n) m

-- Друг вариант с инфиксен currying
-- (© 2016 Vasko)
getColumn2 :: [[b]] -> Int -> [b]
getColumn2 m n = map (!! n) m

main = do {
  assertEqual [1, 4, 7] (getColumn [[1..3], [4..6], [7..9]] 0);
  assertEqual [1, 4, 7] (getColumn2 [[1..3], [4..6], [7..9]] 0)
}
