(load "../../lib/scm/unit.scm")

; Идеята на helper-а е да обходи възможните делители между n-1 и 1. Всъщност,
; можем да вървим от корен квадратен на n и да си спестим малко проверки, но
; ще се наложи да правим закръгляния. Също така, 1 излиза просто. Можете да
; поправите този проблем като упражнение вкъщи! :D
(define (prime? n)
  (define (helper possible-divisor)
    (cond
      ((<= possible-divisor 1) #t)
      ((= (remainder n possible-divisor) 0) #f)
      (else (helper (- possible-divisor 1)))))
  (helper (- n 1)))

(assert-true (prime? 2))
(assert-true (prime? 3))
(assert-false (prime? 4))
(assert-true (prime? 5))
(assert-false (prime? 6))
(assert-true (prime? 7))
(assert-false (prime? 8))
(assert-false (prime? 9))
(assert-false (prime? 10))
(assert-true (prime? 11))
