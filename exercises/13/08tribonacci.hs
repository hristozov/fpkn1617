import           Unit

tribonacci :: [Integer]
tribonacci = helper 1 1 1 where
  helper current prev1 prev2 = current : helper (current + prev1 + prev2) current prev1

-- може и да map-нем реализация на trib върху [1..]

main = assertEqual [1,3,5,9,17,31,57,105,193,355] (take 10 tribonacci)
