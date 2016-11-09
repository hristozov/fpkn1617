(load "../../lib/scm/unit.scm")
(load "01generate-list.scm")

; Създава вложени списъци чрез generate-list (вижте примера долу).
; Обърнете внимание, че generate-list се използва и за генериране на списъка,
; който да бъде обходен с map.
(define (construct-list n)
  (map generate-list (generate-list n)))

; Рекурсивен вариант
(define (construct-list-rec n)
  (if (= n 0)
    '()
    (cons (generate-list n)
          (construct-list-rec (- n 1)))))

(assert-equal '() (construct-list 0))
(assert-equal '((1)) (construct-list 1))
(assert-equal '((5 4 3 2 1) (4 3 2 1) (3 2 1) (2 1) (1)) (construct-list 5))
