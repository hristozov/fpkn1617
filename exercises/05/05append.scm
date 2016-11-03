(load "../../lib/scm/unit.scm")

; Реализация на append.
(define (my-append l1 l2)
  (if (null? l1)
    l2
    (cons (car l1) (my-append (cdr l1) l2))))

(assert-equal '(1 2 3 4 5 6) (my-append '(1 2 3) '(4 5 6)))
(assert-equal '(1 2 3) (my-append '(1 2 3) '()))
(assert-equal '(4 5 6) (my-append '() '(4 5 6)))
(assert-equal '() (my-append '() '()))
