import           Unit

-- Наша версия на вградената функция flip, която „обръща“ аргументите на дадена
-- двуаргументна функция. За целта се създава lambda функция, която замества
-- оригиналната.
flip' :: (a -> b -> c) -> b -> a -> c
flip' f = \x y -> f y x

-- Втори варинт на горното, с currying. Продължава да се ползва с аргумент, като
-- той (f) се фиксира, а останалите (x и y) се взимат по-късно.
flip2' :: (a -> b -> c) -> b -> a -> c
flip2' f x y = f y x

main =
  let
    gte = flip' (<)
    gte2 = flip2' (<)
    lt = flip' gte
    lt2 = flip2' gte2
  in do {
    assertFalse $ gte 1 3;
    assertTrue $ lt 1 3;
    assertFalse $ gte2 1 3;
    assertTrue $ lt2 1 3
  }
