(define (make-point x y)
  (cons x y))

(define x-point car)

(define y-point cdr)

(define (make-segment start end)
  (cons start end))

(define segment-start car)

(define segment-end cdr)

(define (midpoint-segment segment)
  (let ((start (segment-start ))) (make-point (+ (x)))))
