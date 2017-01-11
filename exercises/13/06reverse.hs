import           Unit

reverse' :: Foldable t => t a -> [a]
reverse' l = foldl (\ result x -> x:result) [] l

reverse2' :: Foldable t => t a -> [a]
reverse2' l = foldr (\ x result -> result ++ [x]) [] l

main = do {
  assertEqual [3,2,1] (reverse' [1,2,3]);
  assertEqual [3,2,1] (reverse2' [1,2,3])
}
