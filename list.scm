;;;  all the exercises that are just "define a procedure that does a list operation"
;;; some of these are redos of procedures the already exist in mit-scheme

(define (last-pair-2 items)
  (if (null? (cdr items))
    items
    (last-pair-2 (cdr items))))

(define (reverse-2 items)
  (let rev-loop ((items items) (acc '()))
    (if (null? items)
      acc
      (rev-loop (cdr items) (cons (car items) acc)))))

(define (same-parity index . rest)
  (let ((parity? (if (odd? index) odd? even?)))
    (let partition ((rest rest) (acc (list index)))
      (cond
        ((null? rest) (reverse acc))
        ((parity? (car rest)) (partition (cdr rest) (cons (car rest) acc)))
        (else (partition (cdr rest) acc))))))

(define (square-list-1 items)
  (if (null? items)
    '()
    (cons (square (car items)) (square-list-1 (cdr items)))))

(define (square-list-2 items)
  (map square items))

(define (for-each-1 proc items)
  (car (map proc items)))

(for-each-1 (lambda (x) (newline) (display x)) (list 57 321 88))

(define (for-each-2 proc items)
  (cond
    ((null? items))
    (else (proc (car items))
          (for-each proc (cdr items)))))

(define (count-leaves tree)
  (cond
    ((null? tree) 0)
    ((pair? (car tree)) (+ (count-leaves (car tree)) (count-leaves (cdr tree))))
    (else (+ 1 (count-leaves (cdr tree))))))

;; previous version only handled proper lists
(define (count-leaves-2 tree)
  (cond
    ((null? tree) 0)
    ((pair? tree) (+ (count-leaves-2 (car tree)) (count-leaves-2 (cdr tree))))
    (else 1)))

#|
(list 1 (list 2 (list 3 4)))

;;; in repl
(1 (2 (3 4)))

;;; as box and pointer

->| | |->| |\|
   |      |
   V      V
   1     | | |->[ ][\]
          |      |
          V      V
          2     [ ][ ]->[ ][\]
                 |       |
                 V       V
                 3       4

;;; as a tree diagram

           /\
          1 /\
           2 /\
            3  4
|#

(define (deep-reverse items)
  (reverse (map (lambda (item) (if (pair? item) (deep-reverse item) item)) items)))

(define (fringe tree)
  (cond
    ((null? tree) '())
    ((pair? tree) (append (fringe (car tree)) (fringe (cdr tree))))
    (else (list tree))))
