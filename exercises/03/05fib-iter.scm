(load "../../lib/scm/unit.scm")

; Наивен вариант с дървовидна рекурсия. Много (експоненциално) бавен.
(define (fib n)
  (if (<= n 2)
    1
    (+ (fib (- n 1))
       (fib (- n 2)))))

; Итеративен вариант. Следете внимателно как се сменят current и previous. Това
; е основният подход за обръщане на дървовидна рекурсия в итеративен процес :)
(define (fib-iter n)
  (define (helper current previous count)
    (if (= count 1)
        current
        (helper (+ current previous) current (- count 1))))
  (helper 1 0 n))

(assert= 1 (fib 1))
(assert= 1 (fib 2))
(assert= 2 (fib 3))
(assert= 3 (fib 4))
(assert= 5 (fib 5))
(assert= 8 (fib 6))
(assert= 6765 (fib 20))
(assert= 1 (fib-iter 1))
(assert= 1 (fib-iter 2))
(assert= 2 (fib-iter 3))
(assert= 3 (fib-iter 4))
(assert= 5 (fib-iter 5))
(assert= 8 (fib-iter 6))
(assert= 6765 (fib-iter 20))
