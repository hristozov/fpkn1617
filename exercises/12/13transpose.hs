import           Unit

getColumn :: [[b]] -> Int -> [b]
getColumn m n = map (!! n) m

transpose :: [[a]] -> [[a]]
transpose m = map (\n -> getColumn m n) [0..(length(head m) - 1)]

-- lambda-та може да се трансформира с currying:
transpose2 :: [[a]] -> [[a]]
transpose2 m = map (getColumn m) [0..(length(head m) - 1)]

main = do {
  assertEqual [[1, 4, 7], [2, 5, 8], [3, 6, 9]] $ transpose [[1..3], [4..6], [7..9]];
  assertEqual [[1, 4, 7], [2, 5, 8], [3, 6, 9]] $ transpose2 [[1..3], [4..6], [7..9]]
}
