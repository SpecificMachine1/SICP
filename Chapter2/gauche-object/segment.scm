(import (gauche base) (scheme base))

(define-class <point> () ((x :init-keyword :x :getter x-point)
                          (y :init-keyword :y :getter y-point)))

(define (make-point x y)
  (make <point> :x x :y y))

(define-class <segment> () ((start :init-keyword :start :getter segment-start)
                            (end init-keyword :end :getter segment-end)))

(define (make-segment start end)
  (make <segment> :start start :end end:))
