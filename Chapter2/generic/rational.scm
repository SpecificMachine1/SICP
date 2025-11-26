(import (scheme base) (chibi generic))


;; used (chibi generic-test) as a style guide

(define-generic make-rat)

(define-method (make-rat (num integer?) (den integer?))
   (let* ((g (gcd num den))
         (s (* (sign num) (sign den)))
         (n (* s (abs num)))
         (d (abs den)))
    (vector 'rat (/ n g) (/ d g))))

(define (rat? obj) (and (vector? obj) 
                        (eq? (vector-length obj) 3)
                        (eq? (vector-ref obj 0) 'rat)))

(define-generic numer)

(define-method (numer (rat rat?))
   (vector-ref rat 1))

(define-generic denom)

(define-method (denom (rat rat?))
   (vector-ref rat 2))
