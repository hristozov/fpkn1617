#lang racket

(define (fact i)
  (if (= i 0) 1
      (* i (fact (- i 1)))))

(define (construct-stream x)
  (define (helper num i)
    (stream-cons (/ (expt x i) (fact i)) (helper num (+ i 1))))
  (helper x 0))
