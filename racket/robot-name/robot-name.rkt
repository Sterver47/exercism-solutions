#lang racket

(provide make-robot
         name
         reset!
         reset-name-cache!)

(define robot-name-cache null)

(define (make-robot)
  (let ([robot (cons null null)]) (cons (lambda (robot) (car robot)) (lambda (robot) (cdr robot)))))
(define (random-letter)
  (integer->char (+ 65 (random 26))))
(define (random-digit)
  (integer->char (+ 48 (random 10))))
(define (random-name)
  (format "~a~a~a~a~a" (random-letter) (random-letter) (random-digit) (random-digit) (random-digit)))
(define (generate-name)
  (let ([name (random-name)])
    (if (member name robot-name-cache)
        (generate-name)
        (begin
          (set! robot-name-cache (cons name robot-name-cache))
          name))))
(define (get-name)
  (cond
    [(null? robot-name-cache) (generate-name)]
    [else (car robot-name-cache)]))
(define (set-name name)
  (set! robot-name-cache (cons name robot-name-cache)))
(define (get-name! robot)
  (let ([name (get-name)])
    (set-name name)
    name))

(define (name robot)
  (get-name! robot))

(define (reset! robot)
  (set-name (get-name)))

(define (reset-name-cache!)
  (set! robot-name-cache null))
