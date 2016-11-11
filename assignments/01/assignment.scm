(load "../../lib/scm/unit.scm")

(define (sum-digits p n)
  0)

(assert= 12 (sum-digits even? 123456))
(assert= 9 (sum-digits odd? 123456))
(assert= 21 (sum-digits (lambda (x) #t) 123456))
(assert= 0 (sum-digits (lambda (x) #f) 123456))
