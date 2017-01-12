import           Unit

-- „Завърта“ елементите на списък наляво. Отрицателни числа задават „завъртане“
-- надясно.
-- Имаме отделна проверка за случаите с отрицателен или много голям n. Второто
-- е с цел да спестим твърде много изпълнения - по този начин винаги функцията
-- се върти най-много length l - 1 пъти. Всъщност, това условие може дори да се
-- избегне, чрез изчисляване на mod при извикването на rotate по-долу.
rotate :: [a] -> Int -> [a]
rotate l 0 = l
rotate l n
 | n < 0 || n > length l = rotate l (mod n (length l))
 | otherwise = rotate (tail l ++ [head l]) (n - 1)

main = do {
     assertEqual [1,2,3] (rotate [1,2,3] 0);
     assertEqual [2,3,1] (rotate [1,2,3] 1);
     assertEqual [1,2,3] (rotate [1,2,3] 3);
     assertEqual [2,3,1] (rotate [1,2,3] 4);
     assertEqual [3,1,2] (rotate [1,2,3] (-1));
     assertEqual [3,1,2] (rotate [1,2,3] (-4));
     assertEqual [2,3,1] (rotate [1,2,3] (-5))
}
