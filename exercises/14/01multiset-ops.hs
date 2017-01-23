import           Unit

removeAll :: Eq t => t -> [t] -> [t]
removeAll x l = [ y | y <- l, y /= x ]

count :: (Num a, Eq a1) => a1 -> [a1] -> a
count x l = sum [ 1 | y <- l, y == x ]

multiUnion :: Eq a => [a] -> [a] -> [a]
multiUnion [] y = y
multiUnion (x:xs) y =
  replicate occurences x ++ multiUnion restX restY where
    occurences = max (count x xs + 1) (count x y)
    restX = removeAll x xs
    restY = removeAll x y

main = assertEqual [0,1,2,2,3,4] $ multiUnion [0,1,2,3] [2,2,3,4]
