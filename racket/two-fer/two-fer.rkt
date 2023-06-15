#lang typed/racket

(provide two-fer)

(: two-fer (->* () (String) String))
(define (two-fer [name "you"])
  (format "One for ~a, one for me." name))