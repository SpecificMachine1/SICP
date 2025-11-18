(define (area rectangle)
  (* (rectangle-base rectangle)
     (rectangle-height rectangle)))

(define (perimeter rectangle)
  (+ (* 2 (base rectangle)) (* 2 (height rectangle))))

;;using pairs
(define (make-rectangle base height)
  (cons base height))

(define rectangle-base car)

(define rectangle-height cdr)
