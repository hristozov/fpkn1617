(load "../../lib/scm/unit.scm")
(load "03filter.scm")

; Разлика на две множества, представени със списъци.
; Няма повторения в отделните списъци.
(define (difference l1 l2)
  (filter (lambda (el) (not (member el l2))) l1))

; Рекурсивен вариант.
(define (difference-rec l1 l2)
  (if (null? l1)
      '()
      (let ((l1-head (car l1)))
        (if (member l1-head l2)
            (difference-rec (cdr l1) l2)
            (cons l1-head (difference-rec (cdr l1) l2))))))

(assert-equal '(5) (difference '(2 3 5) '(4 1 3 2)))
(assert-equal '(4 1) (difference '(4 1 3 2) '(2 3 5)))

(assert-equal '(5) (difference-rec '(2 3 5) '(4 1 3 2)))
(assert-equal '(4 1) (difference-rec '(4 1 3 2) '(2 3 5)))
