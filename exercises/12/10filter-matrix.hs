import           Unit

-- Филтриране на елементи в матрица.
filterMatrix :: (a -> Bool) -> [[a]] -> [[a]]
filterMatrix p m = map (\row -> filter p row) m

-- Втори вариант - с currying в lambda-та.
filterMatrix2 :: (a -> Bool) -> [[a]] -> [[a]]
filterMatrix2 p m = map (filter p) m

-- Трети вариант - с currying и за параметъра m. Ако даден параметър е
-- най-вдясно в сигнатурата на функцията и се използва най-вдясно в извикването
-- в тялото на тази функция, то можем да го пропуснем. Така реално правим
-- currying за функцията map.
filterMatrix3 :: (a -> Bool) -> [[a]] -> [[a]]
filterMatrix3 p = map (filter p)

main = do {
  assertEqual [[2],[4,6],[8]] $ filterMatrix even [[1..3], [4..6], [7..9]];
  assertEqual [[2],[4,6],[8]] $ filterMatrix2 even [[1..3], [4..6], [7..9]];
  assertEqual [[2],[4,6],[8]] $ filterMatrix3 even [[1..3], [4..6], [7..9]];
}
