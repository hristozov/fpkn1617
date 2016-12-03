(define (my-sum l)
  (define (helper current-l result)
    (if (null? current-l)
      result
      (helper (cdr current-l) (+ (car current-l) result))))
  (helper l 0))

(define (my-sum1 l)
  (do
    ((current-l l (cdr current-l))
     (result 0 (+ (car current-l) result)))
    ((null? current-l) result)))
