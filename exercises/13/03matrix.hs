import           Unit

matrixElements :: [[t]] -> [t]
matrixElements m =
    [m!!i!!j | i<-[0..length m - 1],
               j<-[0..length(head m) - 1],
               even(i + j)]

main = assertEqual [1,3,5,7,9] $ matrixElements [[1,2,3], [4,5,6], [7,8,9]]
