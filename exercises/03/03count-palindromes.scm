(load "../../lib/scm/unit.scm")
(load "02palindrome.scm")

; Преброява палиндромите в интервал. Идеята е сравнително проста, затова май
; няма нужда от подробни обяснения. :)
(define (count-palindromes start end)
  (define (helper current count)
    (cond
      ((> current end) count)
      ((palindrome? current) (helper (+ current 1) (+ count 1)))
      (else (helper (+ current 1) count))))
  (helper start 0))

; Втори вариант на горното решение. Тук вместо да описваме двата случая когато
; не сме в дъното на рекурсията (т.е. когато е и когато не е палиндром), просто
; увеличаваме с различно число (1 или 0) в зависимост от това дали условието е
; изпълнено.
; Това решение е еквивалентно на горното. Давам го, защото постига същата цел
; с малко по-малко код. :)
(define (count-palindromes2 start end)
  (define (helper current count)
    (if (> current end)
      count
      (helper (+ current 1)
              (+ count (if (palindrome? current) 1 0)))))
  (helper start 0))

(assert= 9 (count-palindromes 1 10))
(assert= 11 (count-palindromes 1 22))
(assert= 15 (count-palindromes 1 66))
(assert= 9 (count-palindromes2 1 10))
(assert= 11 (count-palindromes2 1 22))
(assert= 15 (count-palindromes2 1 66))
