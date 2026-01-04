(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let* ((lbx (lower-bound x))
         (ubx (upper-bound x))
         (lby (lower-bound y))
         (uby (upper-bound y)))
    (make-interval (min (* lbx lby) (* lbx uby) (* ubx uby) (* ubx lby))
                   (max (* lbx lby) (* lbx uby) (* ubx uby) (* ubx lby)))))

(define (div-interval x y)
  (if (<= (lower-bound y) 0 (upper-bound y)) 
    (error "denominator spans 0" y)
    (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (mul-2 x y)
  (let ((lbx (lower-bound x))
        (ubx (upper-bound x))
        (lby (lower-bound y))
        (uby (upper-bound y)))
    (cond
      ((positive? lbx) (cond
                         ((positive? lby) (make-interval (* lbx lby) (* ubx uby)))
                         ((negative? uby) (make-interval (* ubx lby) (* lbx uby)))
                         (else (make-interval (* ubx lby) (* ubx uby)))))
      ((negative? ubx) (cond
                         ((positive? lby) (make-interval (* lbx uby) (* ubx lby)))
                         ((negative? uby) (make-interval (* ubx uby) (* lbx lby)))
                         (else (make-interval (* lbx uby) (* lbx lby)))))
      (else (cond
              ((positive? lby) (make-interval (* lbx uby) (* ubx uby)))
              ((negative? uby) (make-interval (* ubx lby) (* lbx lby)))
              (else (make-interval (min (* ubx lby) (* lbx uby))
                                   (max (* lbx lby) (* ubx uby)))))))))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (upper-bound i) (lower-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent center percent)
  (make-center-width center (/ (* center percent) 100)))
(define (width-percent i)
  (* (/ (width i) (center i)) 100))
