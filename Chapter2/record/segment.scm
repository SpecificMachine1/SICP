(import (scheme base))

(define-record-type <point>
  (make-point x y)
  point?
  (x x-point)
  (y y-point))

(define-record-type <segment>
  (make-segment start end)
  segment?
  (start segment-start)
  (end segment-end))
