(load "../../lib/scm/unit.scm")

; Пример за проста употреба на let:
(define (testlet x)
  (let
    ((x-plus-3 (+ x 3))
     (x-plus-5 (+ x 5)))
    (* x-plus-3 x-plus-5)))

(assert= 35 (testlet 2))

; Същият пример, с lambda:
(define (withoutlet x)
  ((lambda (xplus3 xplus5)
           (* xplus3 xplus5))
   (+ x 3) (+ x 5)))

(assert= 35 (withoutlet 2))

; Долното няма да работи с let, тъй като x-plus-3 няма да е достъпно в средата,
; в която се изчислява стойността на x-plus-5.
(define (testlet* x)
  (let*
    ((x-plus-3 (+ x 3))
     (x-plus-5 (+ x-plus-3 2)))
    (* x-plus-3 x-plus-5)))

(assert= 35 (testlet* 2))

; letrec ни позволява дефинициите да са взаимно рекурсивни. Долното няма да
; работи с let*
(define (testletrec x)
  (letrec
    ((my-even? (lambda (x)
                 (if (= x 1)
                     #f
                     (my-odd? (- x 1)))))
     (my-odd? (lambda (x)
                (not (my-even? x)))))
    (my-odd? x)))

(assert-false (testletrec 2))
(assert-true (testletrec 3))
(assert-false (testletrec 20))
(assert-true (testletrec 5))
