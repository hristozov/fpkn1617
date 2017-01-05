import Unit

-- flip' :: (a -> b -> c) -> b -> a -> c
flip' f = \x y -> f y x
flip2' f x y = f y x

main =
  let
    gte = flip' (<)
    gte2 = flip2' (<)
    lt = flip' gte
    lt2 = flip2' gte2
  in do {
    assertFalse (gte 1 3);
    assertTrue (lt 1 3);
    assertFalse (gte2 1 3);
    assertTrue (lt2 1 3)
  }
