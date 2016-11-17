(load "../../lib/scm/unit.scm")

; Събира числата в даден списък. Използва това, че + приема произволен брой
; аргументи.
(define (sum l)
  (apply + l))

(assert-equal 6 (sum '(1 2 3)))

; Сума от произведения на подсписъци. Обърнете внимание, че * може да се приложи
; и на едно число. :)
(define (sum-of-products l)
  (apply + (map (lambda (sublist) (apply * sublist))
                l)))

(assert-equal 19 (sum-of-products '((1 2) (3 4) (5))))

; Още един пример за apply - най-малък елемент в матрица.
(define (min-matrix m)
  (apply min (map (lambda (l) (apply min l))
                  m)))

(assert-equal 1 (min-matrix '((1 2 3) (4 5 6) (7 8 9))))
