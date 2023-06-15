#lang typed/racket

(provide leap-year?)

(: leap-year? (-> Integer Boolean))
(define (leap-year? year)
  (: year-divisible-by? (-> Integer Boolean))
  (define (year-divisible-by? n)
    (zero? (modulo year n)))
  (cond
    [(year-divisible-by? 400) #t]
    [(year-divisible-by? 100) #f]
    [(year-divisible-by? 4) #t]
    [else #f]))
