(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (car z)
  (let count-loop ((q (quotient z 2))
                   (r (remainder z 2))
                   (acc 0))
    (if (not (zero? r)) acc (count-loop (quotient q 2) (remainder q 2) (+ acc 1)))))

(define (cdr z)
  (let count-loop ((q (quotient z 3))
                   (r (remainder z 3))
                   (acc 0))
    (if (not (zero? r)) acc (count-loop (quotient q 3) (remainder q 3) (+ acc 1)))))
