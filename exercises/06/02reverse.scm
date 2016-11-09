(load "../../lib/scm/unit.scm")

; Целта на задачата е да се обърне списъкът l. За целта постепенно махаме
; елементите ОТПРЕД на списъка l и ги слагаме ОТПРЕД на резултата.
; Еквивалентно на вградената процедура reverse.
(define (my-reverse l)
  (define (helper current-l result)
    (if (null? current-l)
        result
        (helper (cdr current-l)
                (cons (car current-l) result))))
  (helper l '()))

; Обръща списъка два пъти. Естествено, крайният резултат е същият списък. Давам
; задачата за да можете да видите какво трябва да се промени за да може
; операцията да се случи в другата посока. В случая просто на всяка стъпка
; залепяме ОТЗАД на резултата елемените, взети ОТПРЕД на l.
; Обърнете внимание, че тук това е много по-бавна операция, поради линейната
; сложност на append.
(define (my-reverse-reverse l)
  (define (helper current-l result)
    (if (null? current-l)
        result
        (helper (cdr current-l)
                (append result (list (car current-l))))))
  (helper l '()))

(assert-equal '(3 2 1) (my-reverse '(1 2 3)))
(assert-equal '(1 2 3) (my-reverse-reverse '(1 2 3)))
(assert-equal '() (my-reverse '()))
(assert-equal '() (my-reverse-reverse '()))
