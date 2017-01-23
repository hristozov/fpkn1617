import           Unit

removeAll :: Eq t => t -> [t] -> [t]
removeAll x l = [ y | y <- l, y /= x ]

count :: (Num a, Eq a1) => a1 -> [a1] -> a
count x l = sum [ 1 | y <- l, y == x ]

histogram :: (Num t, Eq t1) => [t1] -> [(t1, t)]
histogram []     = []
histogram (x:xs) = (x, count x xs + 1) : histogram (removeAll x xs)

main = assertEqual [(1,3),(2,1),(3,2),(4,1),(7,1),(9,1)] $ histogram [1,2,3,3,1,4,7,9,1]
