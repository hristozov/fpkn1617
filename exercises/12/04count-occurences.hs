import           Unit

-- Брои срещанията на елемент в списък.
countOccurences :: (Num res, Eq t1) => t1 -> [t1] -> res
countOccurences x []     = 0
countOccurences x (y:ys) =
  (if x == y then 1 else 0) + countOccurences x ys

-- по-нататък ще го постигаме с foldr:
countOccurences2 :: (Num res, Eq t1) => t1 -> [t1] -> res
countOccurences2 x l = foldr (\ y -> (+) (if x == y then 1 else 0)) 0 l

-- ... или с map + sum
countOccurences3 :: (Num res, Eq t1) => t1 -> [t1] -> res
countOccurences3 x l = sum $ map (\ y -> if x == y then 1 else 0) l

-- ...или с list comprehension
countOccurences4 :: (Num res, Eq t1) => t1 -> [t1] -> res
countOccurences4 x l     = sum [ 1 | y <- l, y == x ]

main = do {
  assertEqual 1 $ countOccurences 1 [1, 2, 3, 3];
  assertEqual 2 $ countOccurences 3 [1, 2, 3, 3];
  assertEqual 1 $ countOccurences2 1 [1, 2, 3, 3];
  assertEqual 2 $ countOccurences2 3 [1, 2, 3, 3];
  assertEqual 1 $ countOccurences3 1 [1, 2, 3, 3];
  assertEqual 2 $ countOccurences3 3 [1, 2, 3, 3];
  assertEqual 1 $ countOccurences4 1 [1, 2, 3, 3];
  assertEqual 2 $ countOccurences4 3 [1, 2, 3, 3]
}
