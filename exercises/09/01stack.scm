(load "../../lib/scm/unit.scm")

; Създава нов стек. В началото има избраният от нас символ *stack*, който служи
; за отбелязване на празен стек. Това е тъй като няма как да започнем от празен
; списък - тогава няма как да направим set-cdr!. По тази причина, пазим винаги
; една „сервизна“ стойност в началото на стека.
(define (create-stack)
  '(*stack*)) ; може и (list '*stack*)

; Връща елемента в началото на стека, без да го премахва.
(define (top stack)
  (if (null? (cdr stack))
    #f
    (cadr stack)))

; Добавя елемент в стека.
(define (push! stack element)
   (set-cdr! stack
     (cons element
           (cdr stack))))

; Връща елемент от стека и го премахва.
(define (pop! stack)
  (if (null? (cdr stack))
    #f
    (let ((result (cadr stack)))
      (set-cdr! stack (cddr stack))
      result)))

; „Височината“ на стек. Вадим единица заради *stack*.
(define (stack-length stack)
  (- (length stack)
     1))

(let ((stack (create-stack)))
  (push! stack 1)
  (assert-equal 1 (top stack))
  (push! stack 2)
  (assert-equal 2 (top stack))
  (assert-equal 2 (pop! stack))
  (assert-equal 1 (top stack))
  (assert-equal 1 (pop! stack))
  (assert-equal #f (top stack))
  (assert-equal #f (pop! stack)))
