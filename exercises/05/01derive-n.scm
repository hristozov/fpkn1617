(load "../../lib/scm/unit.scm")
(load "../04/05derive.scm")
(load "../04/07repeat.scm")

; n-та производна на f. Изчислява се чрез прилагане n пъти на derive.
(define (derive-n f n)
  ((repeat-n derive n) f))

; Грешен вариант на намирането на n-та производна. Това е n-та композиция на
; първата производна.
(define (derive-n-INCORRECT f n)
  (repeat-n (derive f) n))

(assert-approx 12 0.1 ((derive-n (lambda (x) (* x x x)) 1) 2))
(assert-approx 12 0.1 ((derive-n (lambda (x) (* x x x)) 2) 2))
(assert-approx 6 0.1 ((derive-n (lambda (x) (* x x x)) 3) 2))
(assert-approx 0 0.1 ((derive-n (lambda (x) (* x x x)) 4) 2))
