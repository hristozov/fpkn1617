(load "../../lib/scm/unit.scm")

; Конструира списък с цифрите на числото. В случая са в обратен ред, но за нас
; това не е от значение.
(define (digits n)
  (if (<= n 0)
      '()
      (cons (remainder n 10) (digits (quotient n 10)))))

; Сумира цифрите по указания начин, ползвайки filter.
(define (sum-digits p n)
  (apply + (filter p (digits n))))

(assert= 12 (sum-digits even? 123456))
(assert= 9 (sum-digits odd? 123456))
(assert= 21 (sum-digits (lambda (x) #t) 123456))
(assert= 0 (sum-digits (lambda (x) #f) 123456))
