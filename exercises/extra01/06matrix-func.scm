; (задача от контролно от 2014)
; Да се дефинира фукция от по-висок ред с два аргумента - едноаргументните
; числови функции f и g и намира едноаргументна функция, която има за аргумент
; списък от списъци от вида ((a11 a12 ... a1k) (a21 a22 ... a2k) .. (an1 an2 ... ank))
; и намира списъка (f(a11) f(a12) ... f(a1k) g(a21) g(a22) ... g(a2k) f(a31) f(a32) ... f(a3k) ... f/g(an1) f/g(an2) ... f/g(ank))
;
; (С думи прости - да се върне функция, която взима матрица и редува прилагания
; на f и g върху отделните редове на матрицата)
;
; За целта ще използваме две взаимнорекурсивни функции.
(define (create-function f g)
  (define (calc1 m)
    (if (null? m)
      '()
      (cons (map f (car m))
            (calc2 (cdr m)))))
  (define (calc2 m)
    (if (null? m)
      '()
      (cons (map g (car m))
            (calc1 (cdr m)))))
  (lambda (m)
          (calc1 m)))
