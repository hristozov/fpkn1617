(load "../../lib/scm/unit.scm")

(define (matrix-numbers m)
  '())

(assert-equal '(9 6 3 8 5 2 7 4 1) (matrix-numbers '((1 2 3) (4 5 6) (7 8 9))))
