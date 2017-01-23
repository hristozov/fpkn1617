import           Unit

cartesian :: [t1] -> [t] -> [(t1, t)]
cartesian l1 l2 = [(i, j) | i <- l1, j <- l2]

main = do {
  assertEqual [(1,2)] $ cartesian [1] [2];
  assertEqual [(1,4),(1,5),(1,6),(2,4),(2,5),(2,6),(3,4),(3,5),(3,6)] $ cartesian [1,2,3] [4,5,6]
}
