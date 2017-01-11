import           Unit

fst' :: (t1, t) -> t1
fst' (x,xs) = x

snd' :: (t, t1) -> t1
snd' (x,xs) = xs

main = do {
  assertEqual 1 (fst' (1, 2));
  assertEqual 2 (snd' (1, 2));
}
