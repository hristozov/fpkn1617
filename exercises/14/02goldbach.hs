import           Unit

prime :: Integral a => a -> Bool
prime 1 = False
prime n =
  helper (n - 1)
  where
    helper 1       = True
    helper divisor = mod n divisor /= 0 && helper (divisor - 1)

goldbach :: Integral t => t -> [(t, t)]
goldbach n = helper initial initial where
  initial = div n 2
  helper a b
    | a == 1 = []
    | prime a && prime b = (a, b) : helper (a - 1) (b + 1)
    | otherwise = helper (a - 1) (b + 1)

main = do {
    assertEqual [(2,2)] (goldbach 4);
    assertEqual [(7,7),(3,11)] (goldbach 14);
    assertEqual [(5,11),(3,13)] (goldbach 16);
    assertEqual [(271,271),(229,313),(211,331),(193,349),(163,379),
        (109,433),(103,439),(79,463),(43,499),(19,523)] (goldbach 542)
}

