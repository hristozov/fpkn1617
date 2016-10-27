(load "../../lib/scm/unit.scm")

; Изчислява приближение на корен квадратен итеративно.
;
; epsilon - определя колко близо трябва да е квадратът на текущия резултат до
; числото на което търсим корен квадратен
; good-enough? - проверка, която гледа дали е изпълнено условието за epsilon
; improve - по даден член на редицата намира следващия
; helper - вика improve докато good-enough? не се изпълни
;
; Забележете, че викаме helper с числото 1. Там може да сложите всяко
; положително число. Итеративният процес винаги ще е сходящ и членовете ще
; клонят към корен квадратен от x.
(define (sqrt-iter x)
  (define epsilon 0.01)
  (define (good-enough? rn)
    (< (abs (- (* rn rn) x))
       epsilon))
  (define (improve rn)
    (/ (+ rn (/ x rn))
       2))
  (define (helper rn)
    (if (good-enough? rn)
        rn
        (helper (improve rn))))
  (helper 1))

(assert-approx 4 0.01 (sqrt-iter 16))
(assert-approx 2 0.01 (sqrt-iter 4))
(assert-approx 10 0.01 (sqrt-iter 100))
(assert-approx (expt 2 0.5) 0.01 (sqrt-iter 2))
(assert-approx (expt 171 0.5) 0.01 (sqrt-iter 171))
(assert-approx (expt 2237 0.5) 0.01 (sqrt-iter 2237))
