import           Unit

combinations :: Int -> [a] -> [[a]]
combinations 0 _ = [[]]
combinations n xs = [ (xs !! i) : x | i <- [0..(length xs)-1],
                                      x <- combinations (n-1) (drop (i+1) xs) ]

main = do {
    assertEqual [[1,2],[1,3],[2,3]] $ combinations 2 [1,2,3]
}
