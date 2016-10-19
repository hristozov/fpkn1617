(load "../../lib/scm/unit.scm")

; Обръща цифрите на число
; Идеята е на всяка стъпка да взимаме последната цифра на числото и да я слагаме
; най-отзад на резултата. На всяка стъпка махаме по една цифра от числото и
; добавяме нула в края на резултата (т.е. местим цифрите на числото надясно, а
; тези на резултата - наляво).
(define (my-reverse n)
  (define (helper current result)
    (if (<= current 0)
        result
        (helper (quotient current 10)
                (+ (* result 10)
                   (remainder current 10)))))
  (helper n 0))

(assert= 0 (my-reverse 0))
(assert= 5 (my-reverse 5))
(assert= 1 (my-reverse 10))
(assert= 21 (my-reverse 12))
(assert= 1 (my-reverse 1000))
(assert= 1234 (my-reverse 432100))
(assert= 10234 (my-reverse 43201))
