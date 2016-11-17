(load "../../lib/scm/unit.scm")

(define (list-sum l x)
  (fold-left + 0 (map (lambda (sub-list) (fold-left + 0 sub-list))
                      (filter (lambda (el) (member x el))
                              l))))

(assert-equal 21 (list-sum '((1 2 3) (4 3 8) (1 2 7)) 3))
