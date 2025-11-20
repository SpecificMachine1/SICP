(import (scheme base))

(define-record-type <rational>
  (rational n d)
  rational?
  (n numer)
  (d denom))

(define (make-rat num den)
  (let* ((g (gcd num den))
         (s (* (sign num) (sign den)))
         (n (* s (abs num)))
         (d (abs den)))
    (rational (/ n g) (/ d g))))

;; tested and works when loaded with sign, etc
