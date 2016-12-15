#lang racket
(require "../../lib/rkt/unit.rkt")

; Поток с числата от
(define (enum start end)
  (if (= start end)
      (stream end)
      (stream-cons start (enum (+ start 1) end))))

(assert-equal '(1 2 3) (stream->list (enum 1 3)))
