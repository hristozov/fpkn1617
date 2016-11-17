(load "../../lib/scm/unit.scm")

(define (sum l)
  (fold-left + 0 l))

(define (clone-list l)
  (fold-right cons '() l))

(assert-equal 6 (sum '(1 2 3)))
(assert-equal '(1 2 3) (clone-list '(1 2 3)))
