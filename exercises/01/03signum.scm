(load "../../lib/scm/unit.scm")

; signum връща -1, 0 или 1 в зависимост от това дали числото е отрицателно, нула
; или положително.

; Първи вариант - с вложени if-ове.
(define (signum1 n)
  (if (> n 0)
    1
    (if (< n 0)
      -1
      0)))

; Вариант, еквивалентен на горния, но с cond. Поради по-добрата си четимост,
; този вид е за препоръчване.
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
