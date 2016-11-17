(load "../../lib/scm/unit.scm")

(define (compose f g)
  (lambda (x)
    (g (f x))))

(define (compose-functions l)
  (fold-left compose
             (lambda (x) x)
             l))

(define (plus1 x) (+ x 1))

(assert-equal 4 ((compose-functions (list plus1 plus1 plus1)) 1))
