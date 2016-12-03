(load "../08/05tree.scm")

(define tree
  '(1
    (3
      (5 () ())
      (6
        (8 () ())
        ()))
    (9
      ()
      (7
        (2 () ())
        (4 () ())))))

(define (path-from-root val tree)
  (define (helper val tree current-path)
    (cond
      ((tree-empty? tree) #f)
      ((= val (value tree)) (append current-path (list (value tree))))
      (else (or (helper val (left tree) (append current-path (list (value tree))))
                (helper val (right tree) (append current-path (list (value tree))))))))
  (helper val tree '()))
