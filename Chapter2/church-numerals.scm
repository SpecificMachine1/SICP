(define zero (lambda (f) (lambda (x) x))) ; \f.\x.x

(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x))))) ; \n.\f.\x.f (n f x)  

;; (define one)
;; (add-one zero)
;; ((lambda (n) (lambda (f) (lambda (x) (f ((n f) x))))) (lambda () (lambda (f) (lambda (x) x))))
;; 
