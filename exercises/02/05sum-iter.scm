(load "../../lib/scm/unit.scm")

; Рекурсивна сума на числа
; Ако пробвате с малък start и огромен (>10^8) end ще видите колко много памет
; се използва. Това е заради необходимостта някъде в стека да се запази
; информация до къде точно сме стигнали с извикванията. Можете да си го
; представите по следния начин: интерпретаторът трябва да стигне до дъното на
; рекурсията (т.е. да разкрие всички скоби при сумирането) за да започне изобщо
; да прави някакви сметки. През това време трябва да запише някъде в паметта
; всички междинни резултати.
(define (sum-rec start end)
  (if (>= start end)
    end
    (+ start (sum-rec (+ start 1) end))))

; Итеративен вариант на сумирането. Вътрешно се изпълнява подобно на цикъл от
; императивен език. Няма проблем с голяма (>10^8) разлика между start и end.
; Забележете, че сметката се прави при рекурсивното извикване. Макар и на пръв
; поглед разликата да изглежда малка, това е доста по-различно от по-горния
; вариант - интерпретаторът върши сметките в движение, докато „върви“ към дъното
; на рекурсията - не му се налага да помни контекст.
(define (sum-iter start end)
  (define (helper current result)
    (if (> current end)
      result
      (helper (+ current 1)
              (+ result current))))
  (helper start 0))

(assert= 0 (sum-rec 0 0))
(assert= 0 (sum-iter 0 0))
(assert= 5050 (sum-rec 1 100))
(assert= 5050 (sum-iter 1 100))
