(define (area rectangle)
  (* (rectangle-base rectangle)
     (rectangle-height rectangle)))

(define (perimeter rectangle)
  (+ (* 2 (rectangle-base rectangle)) (* 2 (rectangle-height rectangle))))

;;using pairs
(define (make-rectangle base-seg height)
  (cons base-seg height))

(define (rectangle-base rectangle)
  (distance (car rectangle)))

(define rectangle-height cdr)
