(load "../../lib/scm/unit.scm")

(define (compose f g)
  (lambda (x)
    (g (f x))))

; Целта на задачата е да се напише (repeat-n f n), която изчислява n-тото
; „влагане“ на функцията f от вида: f(f(f(...f(x)))), където n е „дълбочината“
; на вложените викания.
;
; Например, ако искаме да го приложим за (lambda (x) (+ x 1)), то
; (repeat-n (lambda (x) (+ x 1)) 5) ще върне процедура, която 5 пъти прибавя
; единица към аргумента си.
;
; Всичко това се прави рекурсивно, като на всяка стъпка прилагаме compose.
; Дъното на рекурсията е функцията идентитет, която просто връща x (т.е.
; най-вътрешното изчисление в условието със скобите по-горе).

; Рекурсивен вариант на repeat.
(define (repeat-n-recur f n)
  (if (= n 0)
      (lambda (x) x)
      (compose f (repeat-n-recur f (- n 1)))))

; Итеративен вариант.
(define (repeat-n f n)
  (define (helper result i)
    (if (= i 0)
        result
        (helper (compose f result) (- i 1))))
  (helper (lambda (x) x) n))

(define (plus1 x) (+ x 1))

(assert= 6 ((repeat-n-recur plus1 5) 1))
(assert= 6 ((repeat-n plus1 5) 1))
