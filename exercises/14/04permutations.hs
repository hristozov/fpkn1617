import           Data.List
import           Unit

permute :: Eq a => [a] -> [[a]]
permute [] = [[]]
permute xs = concatMap (\x -> map (x:) (permute $ delete x xs)) xs

main = do {
    assertEqual [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]] $ permute [1,2,3]
}
