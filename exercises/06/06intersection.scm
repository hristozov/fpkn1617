(load "../../lib/scm/unit.scm")
(load "03filter.scm")

; Сечение на две множества, представени със списъци.
; Няма повторения в отделните списъци.
(define (intersection l1 l2)
  (filter (lambda (el) (member el l1)) l2))

; Рекурсивен вариант
(define (intersection-rec l1 l2)
  (if (null? l1)
      '()
      (let ((l1-head (car l1)))
        (if (member l1-head l2)
            (cons l1-head (intersection-rec (cdr l1) l2))
            (intersection-rec (cdr l1) l2)))))

(assert-equal '(3 2) (intersection '(2 3 5) '(4 1 3 2)))
(assert-equal '(1 2 3) (intersection '(1 2 3) '(1 2 3)))
(assert-equal '() (intersection '(1 2 3) '(4 5 6)))
(assert-equal '(1) (intersection '(1) '(1)))

(assert-equal '(2 3) (intersection-rec '(2 3 5) '(4 1 3 2)))
(assert-equal '(1 2 3) (intersection-rec '(1 2 3) '(1 2 3)))
(assert-equal '() (intersection-rec '(1 2 3) '(4 5 6)))
(assert-equal '(1) (intersection-rec '(1) '(1)))
