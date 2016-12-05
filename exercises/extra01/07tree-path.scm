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

; Да се намери път от корена до даден връх в дърво. Приемаме, че в дървото няма
; повторение на върхове (въпреки, че това решение би работило дори ако има -
; просто ще ползва първото срещане на дединя връх).
(define (path-from-root val tree)
  (define (helper val tree current-path)
    (cond
      ; Изчерпали сме дървото без да намерим върха. Връщаме #f, а не например
      ; празен списък, за да можем с or-а долу да игнорираме този резултат.
      ((tree-empty? tree) #f)
      ((= val (value tree)) (append current-path (list (value tree))))
      ; Чрез or „избираме“ клона от рекурсията, който е върнал някакъв път. Така
      ; се освобождаваме от всичките false-ове, които се появяват в листата.
      (else (or (helper val
                        (left tree)
                        (append current-path (list (value tree))))
                (helper val
                        (right tree)
                        (append current-path (list (value tree))))))))
  (helper val tree '()))
