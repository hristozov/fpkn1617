(load "../../lib/scm/unit.scm")

(define (transpose m)
  (apply map list m))

(define (matrix-numbers m)
  (apply append (transpose (reverse (map reverse m)))))

(assert-equal '(9 6 3 8 5 2 7 4 1) (matrix-numbers '((1 2 3) (4 5 6) (7 8 9))))
