(load "../../lib/scm/unit.scm")

; Брои цифрите на число. На всяка стъпка го дели на 10 (т.е. маха по една цифра
; от края му).
(define (count-digits n)
  (if (<= n 0)
      0
      (+ 1 (count-digits (quotient n 10)))))

(assert= 0 (count-digits 0))
(assert= 1 (count-digits 1))
(assert= 1 (count-digits 9))
(assert= 2 (count-digits 10))
(assert= 2 (count-digits 27))
(assert= 3 (count-digits 100))
;(assert= 100000 (count-digits (expt 10 99999)))
