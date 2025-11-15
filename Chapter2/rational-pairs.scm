;;; data abstraction for rational arithmetic, using pairs

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
            (* (denom x) (numer y))))

;; (define make-rat cons)
(define (make-rat num den)
  (let* ((g (gcd num den))
         (s (* (sign num) (sign den)))
         (n (* s (abs num)))
         (d (abs den)))
    (cons (/ n g) (/ d g))))

(define (sign n)
  (cond
    ((zero? n) 0)
    ((> n 0) 1)
    (else -1)))

(define numer car)

(define denom cdr)
