(define (make-point x y)
  (cons x y))

(define x-point car)

(define y-point cdr)

(define (make-segment start end)
  (cons start end))

(define segment-start car)

(define segment-end cdr)

(define (midpoint-segment segment)
  (let ((start (segment-start segment))
        (end   (segment-end segment)))
    (make-segment
      (+ (x-point start)  ;; lol I forgor average
         (/ (- (x-point end) (x-point end)) 2))
      (+ (y-point start)
         (/ (- (y-point end) (y-point start)) 2)))))

(define (distance segment)
  (let ((start (segment-start segment))
        (end (segment-end segment)))
    (sqrt (+ (square (- (x-point end) (x-point start)))
             (square (- (y-point end) (y-point start)))))))

(define (print-point p)
  (display (string-append "("
                          (number->string (x-point p))
                          ","
                          (number->string (y-point p))
                          ")")))
