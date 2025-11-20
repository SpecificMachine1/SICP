(import (gauche base) (scheme base))

(define-class <ratio> () ((n :init-keyword :n :accessor numer)
                             (d :init-keyword :d :accessor denom)))

(define (make-rat num den)
  (let* ((g (gcd num den))
         (s (* (sign num) (sign den)))
         (n (* s (abs num)))
         (d (abs den)))
    (make <ratio> :n (/ n g) :d (/ d g))))

;;works like pair-based version when using add, sub, mul, div, equal?, sign
