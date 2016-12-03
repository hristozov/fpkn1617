(define (sequences l)
  (define (ascending l last)
    (cond
      ((null? l) '())
      ((null? (cdr l)) (list (car l)))
      ((< (car l) last) (cons last (descending l (car l))))
      (else (ascending (cdr l) (car l)))))
  (define (descending l last)
    (cond
      ((null? l) '())
      ((null? (cdr l)) (list (car l)))
      ((> (car l) last) (cons last (ascending l (car l))))
      (else (descending (cdr l) (car l)))))
  (descending l (+ (car l) 1)))
