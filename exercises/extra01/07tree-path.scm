(define (left tree) (cadr tree))

(define (right tree) (caddr tree))

(define (value tree) (car tree))

(define (make-tree value left right)
  (list value left right))

(define (empty-tree) '())

(define (tree-empty? tree)
  (null? tree))

(define (leaf? tree)
  (and (not (tree-empty? tree))
       (tree-empty? (left tree))
       (tree-empty? (right tree))))

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
