import           Unit

-- Реализация на quicksort чрез list comprehension.
qsort :: Ord t => [t] -> [t]
qsort [] = []
qsort (pivot:rest) = lessThan ++ [pivot] ++ moreThan where
  lessThan = qsort [x | x <- rest, x <= pivot]
  moreThan = qsort [x | x <- rest, x > pivot]

-- Това е еквивалентно решение с filter:
qsort2 :: Ord t => [t] -> [t]
qsort2 [] = []
qsort2 (x:xs) = lessThan ++ [x] ++ moreThan where
  lessThan = qsort2(filter (<=x) xs)
  moreThan = qsort2(filter (>x) xs)

main = do {
  assertEqual [1,2,3] (qsort [1,2,3]);
  assertEqual [1,2,4,7,8] (qsort [8,4,1,7,2]);
  assertEqual [1,2,3] (qsort2 [1,2,3]);
  assertEqual [1,2,4,7,8] (qsort2 [8,4,1,7,2])
}
