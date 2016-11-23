(load "../../lib/scm/unit.scm")
(load "05tree.scm")

; Връща върховете, които са на дадено „ниво“ в дървото. Броенето на нивата
; започва от върха, където е 0.
; Обърнете внимание на събирането на различните клонове на дървовидната рекурсия
; чрез append.
(define (level tree n)
  (define (helper current-tree current-level)
    (cond
      ((tree-empty? current-tree) '())
      ((= current-level n) (list (value current-tree)))
      (else (append (helper (left current-tree) (+ current-level 1))
                    (helper (right current-tree) (+ current-level 1))))))
  (helper tree 0))

; Алтернативна имплементация на level, без helper. Разликата е, че вместо да
; ползваме helper с помощен индекс (i), просто намаляваме n докато не стигне до
; нулата.
(define (level2 tree n)
    (cond
      ((tree-empty? tree) '())
      ((= n 0) (list (value tree)))
      (else (append (level2 (left tree) (- n 1))
                    (level2 (right tree) (- n 1))))))

(define sample-tree
  (make-tree 1
             (make-tree 3
                        (make-tree 5
                                   (empty-tree)
                                   (empty-tree))
                        (make-tree 6
                                   (make-tree 8 (empty-tree) (empty-tree))
                                   (empty-tree)))
             (make-tree 9
                        (empty-tree)
                        (make-tree 7
                                   (make-tree 2 (empty-tree) (empty-tree))
                                   (make-tree 1 (empty-tree) (empty-tree))))))

(assert-equal '(1) (level sample-tree 0))
(assert-equal '(3 9) (level sample-tree 1))
(assert-equal '(5 6 7) (level sample-tree 2))
(assert-equal '(8 2 1) (level sample-tree 3))
(assert-equal '() (level sample-tree 4))

(assert-equal '(1) (level2 sample-tree 0))
(assert-equal '(3 9) (level2 sample-tree 1))
(assert-equal '(5 6 7) (level2 sample-tree 2))
(assert-equal '(8 2 1) (level2 sample-tree 3))
(assert-equal '() (level2 sample-tree 4))
