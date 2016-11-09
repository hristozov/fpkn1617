(load "../../lib/scm/unit.scm")

; Тази имплементация на filter може да ви е необходима, ако ползвате R5RS
; (например DrRacket).
(define (filter p l)
  (define (helper current-l result)
    (cond
      ((null? current-l) result)
      ((p (car current-l)) (helper (cdr current-l)
                                   (append result (list (car current-l)))))
      (else (helper (cdr current-l) result))))
  (helper l '()))

(assert-equal '(1 3 5 7) (filter odd? '(1 2 3 4 5 6 7 8)))
(assert-equal '() (filter odd? '()))
