#lang typed/racket

(provide sum-of-squares
         square-of-sum
         difference)

(: sum-of-squares (-> Integer Integer))
(define (sum-of-squares number)
  (quotient (* number (+ number 1) (+ (* 2 number) 1)) 6))

(: square-of-sum (-> Integer Integer))
(define (square-of-sum number)
  (expt (quotient (* number (+ number 1)) 2) 2))

(: difference (-> Integer Integer))
(define (difference number)
  (- (square-of-sum number) (sum-of-squares number)))
