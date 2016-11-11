(load "../../lib/scm/unit.scm")

; compose и repeat са копирани от предишни упражнения.
(define (compose f g)
  (lambda (x)
    (g (f x))))

(define (repeat f n)
  (define (helper result i)
    (if (= i 0)
        result
        (helper (compose f result) (- i 1))))
  (helper (lambda (x) x) n))

; Намира съответните композиции на функцията f за всеки от елементите в списъка
; l.
(define (compositions l f)
  (map (lambda (x) (repeat f x)) l))

(define (square x) (* x x))
; Резултатът (result) ще e списък, който съдържа 5 функции като елементи. Тези
; функции ще са съответно 1, 2, 3, 4 и 5-та композиция на square.
(define result (compositions '(1 2 3 4 5) square))
(assert-equal 4 ((list-ref result 0) 2))
(assert-equal 16 ((list-ref result 1) 2))
(assert-equal 256 ((list-ref result 2) 2))
(assert-equal 65536 ((list-ref result 3) 2))
(assert-equal 4294967296 ((list-ref result 4) 2))
