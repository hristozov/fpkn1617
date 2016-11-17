(load "../../lib/scm/unit.scm")

(define (get-nth-column m n)
  (map (lambda (row)
         (list-ref row n))
       m))

(assert-equal '(1 4 7) (get-nth-column '((1 2 3) (4 5 6) (7 8 9)) 0))
