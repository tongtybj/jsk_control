(defun print-footprint-vertices (r)
  "Function to generate lleg_vertices and rleg_vertices
Usage: (print-footprint-vertices (instance jaxon-robot :init))
"
  (let ((lleg-vertices nil)
        (rleg-vertices nil))
    (send r :fix-leg-to-coords (make-coords) :lleg)
    (send r :worldpos)
    (setq lleg-vertices (cdr (send (send r :make-sole-polygon :lleg) :vertices)))
    (send r :fix-leg-to-coords (make-coords) :rleg)
    (send r :worldpos)
    (setq rleg-vertices (cdr (send (send r :make-sole-polygon :rleg) :vertices)))
    (format t "lleg_vertices: [")
    (dotimes (i (length lleg-vertices))
      (let ((v (elt lleg-vertices i)))
        (format t "[~A, ~A]" (* 0.001 (elt v 0)) (* 0.001 (elt v 1)))
        (if (not (= i (1- (length lleg-vertices))))
            (format t ", ")
          )))
    (format t "]~%")
    (format t "rleg_vertices: [")
    (dotimes (i (length rleg-vertices))
      (let ((v (elt rleg-vertices i)))
        (format t "[~A, ~A]" (* 0.001 (elt v 0)) (* 0.001 (elt v 1)))
        (if (not (= i (1- (length rleg-vertices))))
            (format t ", ")
          )))
    (format t "]~%")
    ))
