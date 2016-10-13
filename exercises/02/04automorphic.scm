(load "../../lib/scm/unit.scm")
(load "01count-digits.scm")

; Проверява дали число е автоморфно - квадратът му завършва със самото него.
; Например, 25 е автоморфно, защото 25^2=625.
; Можете да го решите и рекурсивно, като направите процедура, която проверява
; дали число завършва на друго число.
(define (automorphic? n)
  (= n
     (remainder (expt n 2)
                (expt 10 (count-digits n)))))

(assert-true (automorphic? 1))
(assert-false (automorphic? 2))
(assert-false (automorphic? 3))
(assert-false (automorphic? 4))
(assert-true (automorphic? 5))
(assert-true (automorphic? 6))
(assert-false (automorphic? 7))
(assert-false (automorphic? 8))
(assert-false (automorphic? 9))
(assert-false (automorphic? 10))
(assert-true (automorphic? 25))
(assert-true (automorphic? 76))
(assert-true (automorphic? 376))
(assert-true (automorphic? 625))
(assert-true (automorphic? 9376))
