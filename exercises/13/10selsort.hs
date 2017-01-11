import           Data.List
import           Unit

selsort :: Ord t => [t] -> [t]
selsort [] = []
selsort l = minElement : selsort (delete minElement l) where
  minElement = minimum l

main = do {
  assertEqual [1, 1, 2, 2, 3, 4, 5, 7, 8, 9] (selsort [1, 8, 2, 4, 9, 1, 2, 5, 7, 3]);
}
