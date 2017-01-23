import           Unit

-- Примерите тук показват как можем да имплементираме наши версии на head и tail
-- чрез destruct-ване на списъка, подаден като аргумент. Това е форма на pattern
-- matching-а, познат ни от предишните упражнения.
-- Идеята е, че главата на списъка е достъпна през x, а опашката - през xs. По
-- този начин, имплементацията на head и tail всъщност става един от
-- най-тривиалните примери за destruct-ване.

head' :: [t] -> t
head' (x:xs) = x

tail' :: [t] -> [t]
tail' (x:xs) = xs

main = do {
  assertEqual 1 $ head' [1, 2, 3];
  assertEqual [2, 3] $ tail' [1, 2, 3];
}
