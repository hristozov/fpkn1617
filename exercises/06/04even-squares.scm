(load "../../lib/scm/unit.scm")
(load "03filter.scm")

(define (squares l)
  (map (lambda (x) (* x x)) l))

(assert-equal '(4 9 25) (squares '(2 3 5)))

; Сума на квадратите на четните числа в списъка l.
(define (even-squares l)
  (squares (filter even? l)))

(assert-equal '(4 16) (even-squares '(2 3 5 4)))
