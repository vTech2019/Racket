#lang racket

(define (fib n)
  (if (<= n 2)
      1
      (+ (fib(- n 2)) (fib (- n 1)))))
(fib 6)

(define str '(1 2 3 4 5))
(list + 1 2)

(define (mul2 xs)
  (if (null? xs)
      '()
      (cons (* (car xs) 2)
       (mul2 (cdr xs)))))

(mul2 str)
(define (minus n)
  (- n))

(define (map-list f xs)
  (if (null? xs)
      '()
      (cons (f  (car xs))
            (map-list f (cdr xs)))))
(map-list minus str)

(define mul3 (lambda (x) (* x 3)))

(define (proj f y)
  (lambda (x) (f x y)))

((proj * 2) 4)

(map (curry * 1) str)

(define (sum-list xs)
  (if (null? xs)
      0
      (+ (car xs)
         (sum-list (cdr xs)))))

(sum-list str)

(define (_foldr f a xs)
  (if (null? xs)
      a
      (f (car xs)
         (_foldr f a (cdr xs)))))

(_foldr (lambda (x y) (if (> x y) x y)) 0 '(1 2 3 4) )

(define (flip)
  (if (< (random) 0.5)
      true
      false))

(flip)

(define (flip_n n)
  (if (< (random) n)
      true
      false))


(define (repeat number f)
  (if (= number 0)
      f
      (repeat (- number 1) f)))

(repeat 5 (flip))

;(define (sample)
;(rejection-query
; (define A (flip 0.8))
; (define B (flip 0.4))
; (and A B)
; (or A B)
; ))
;P(A and B | A or B)

; B A кража и сигнализация 
;(define (sample)
;(rejection-query
; (define E (flip 0.002))
; (define B (flip 0.001))
; (define A (or (and E (flip 0.29)) земл.
;            (and B (flip 0.94)) взлом
;            (flip 0.001)))
; A
; (or B E)
;))
;(hist (repeat 1000 sample))
;(foldl + 0 (map (lambda (x) (if x 1 0)) (repeat 100000 sample)))
  (define E (flip_n 0.002))
  (define B (flip_n 0.001))
  (define A (or (and E (flip_n 0.29))
                (and B (flip_n 0.94))
                (flip_n 0.001)))
(define (smp)
  A
  (or B E)
)
;(foldl + 0 (map (lambda (x) (if x 1 0)) (repeat 100000 smp)))
