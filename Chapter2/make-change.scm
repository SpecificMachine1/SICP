;;; program for counting change which can use more than one currency
;;; based on program in section 1.2.2

(define us-coins (list 50 25  10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
;; at first I thought the order on these mattered, then I tested and saw that it didn't, and
;; realized the recursion is (+ ways-without-this-coin ways-with-this-coin)

(define (cc amount coin-values)
  "(cc num list-of-nums) integer: number of ways change can be made"
  (cond
    ((= amount 0) 1)
    ((or (< amount 0) (no-more? coin-values)) 0)
    (else (+ (cc amount (except-first-denomination coin-values))
             (cc (- amount (first-denomination coin-values)) coin-values)))))

(define no-more? null?)
(define except-first-denomination cdr)
(define first-denomination car)
