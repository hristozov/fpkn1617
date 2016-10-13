(load "../../lib/scm/unit.scm")

; Итеративен вариант на сумирането на цифри. Единствената разлика с предишната
; задача (броене на цифри) е, че вместо единица се добавя последната цифра в
; резултата.
(define (sum-digits-iter n)
  (define (helper current result)
    (if (<= current 0)
        result
        (helper (quotient current 10)
                (+ result (remainder current 10)))))
  (helper n 0))

(assert= 0 (sum-digits-iter 0))
(assert= 1 (sum-digits-iter 1))
(assert= 9 (sum-digits-iter 9))
(assert= 1 (sum-digits-iter 10))
(assert= 9 (sum-digits-iter 27))
(assert= 1 (sum-digits-iter 100))
