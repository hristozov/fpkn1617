(load "../../lib/scm/unit.scm")

; Композира две функции. Това означава да върне функция p(x), като p(x)=f(g(x)).
(define (compose f g)
  (lambda (x)
    (g (f x))))

; Обърнете внимание, че това е ГРЕШНО решение на задачата, тъй като не връща
; функция (т.е. lambda), а директно изчислява нейната стойност за дадено x.
; Това е груба грешка, която бива санкционирана на контролни и изпити.
(define (compose-INCORRECT f g x)
  (g (f x)))

(define (identity x) x)
(define (pow2 x) (* x x))
(define (plus1 x) (+ x 1))

(assert= 9 ((compose identity pow2) 3))
(assert= 9 ((compose pow2 identity) 3))
(assert= 3 ((compose identity identity) 3))
(assert= 81 ((compose pow2 pow2) 3))
(assert= 5 ((compose pow2 plus1) 2))
(assert= 9 ((compose plus1 pow2) 2))
