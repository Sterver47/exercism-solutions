#lang racket

(provide balanced?)

(define (bracket-match? open close)
  (case open
    [("(") (string=? close ")")]
    [("[") (string=? close "]")]
    [("{") (string=? close "}")]
    [else #f]))

(define (openning-bracket? bracket)
  (case bracket
    [("(") #t]
    [("[") #t]
    [("{") #t]
    [else #f]))

(define (closing-bracket? bracket)
  (case bracket
    [(")") #t]
    [("]") #t]
    [("}") #t]
    [else #f]))

(define (balanced? str [stack ""])
  (if (string=? str "")
      (string=? stack "")
      (let ([head (substring str 0 1)] [tail (substring str 1)])
        (cond
          [(openning-bracket? head) (balanced? tail (string-append stack head))]
          [(closing-bracket? head)
           (if (and (not (string=? stack ""))
                    (bracket-match? (substring stack (- (string-length stack) 1)) head))
               (balanced? tail (substring stack 0 (- (string-length stack) 1)))
               #f)]
          [else (balanced? tail stack)]))))
