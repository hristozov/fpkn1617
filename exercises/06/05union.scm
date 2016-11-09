(load "../../lib/scm/unit.scm")
(load "03filter.scm")

; Обединение на две множества, представени със списъци.
; Няма повторения в отделните списъци.
(define (union l1 l2)
  (append l1
          (filter (lambda (el) (not (member el l1))) l2)))

; Рекурсивен вариант на union
(define (union-rec l1 l2)
  (if (null? l1)
      l2
      (let ((l1-head (car l1)))
        (if (member l1-head l2)
            (union-rec (cdr l1) l2)
            (cons l1-head (union-rec (cdr l1) l2))))))

(assert-equal '(2 3 5 4 1) (union '(2 3 5) '(4 1 3 2)))
(assert-equal '(1 2 3) (union '(1 2 3) '(1 2 3)))
(assert-equal '(2) (union '(2) '(2)))
(assert-equal '() (union '() '()))

(assert-equal '(5 4 1 3 2) (union-rec '(2 3 5) '(4 1 3 2)))
(assert-equal '(1 2 3) (union-rec '(1 2 3) '(1 2 3)))
(assert-equal '(2) (union-rec '(2) '(2)))
(assert-equal '() (union-rec '() '()))
