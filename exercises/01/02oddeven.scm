(load "../../lib/scm/unit.scm")

; Проверка дали число е нечетно.
(define (my-odd? a)
  (if (= (remainder a 2) 1)
    #t
    #f))

; Проверка дали число е четно.
; Този вариант е същия като с if-а горе, но с малко по-малко код. Ако имаме if,
; който връща #t или #f, то винаги можем да го премахнем и да оставим някакъв
; вариант на израза от условието (проверката за равенство, в този случай).
(define (my-even? a)
  (= (remainder a 2) 0))

(assert-true (my-odd? 3))
(assert-false (my-odd? 4))
(assert-false (my-even? 1))
(assert-true (my-even? 2))
