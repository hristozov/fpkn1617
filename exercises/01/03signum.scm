(load "../../lib/scm/unit.scm")

(define (signum1 n)
  (if (> n 0)
    1
    (if (< n 0)
      -1
      0)))

(define (signum2 n)
  (cond
    ((> n 0) 1)
    ((< n 0) -1)
    (else 0)))

(assert= 0 (signum2 0))
(assert= -1 (signum2 -4))
(assert= 1 (signum2 4))
(assert= 0 (signum2 0))
(assert= -1 (signum2 -4))
(assert= 1 (signum2 4))
