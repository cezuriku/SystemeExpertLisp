#|
  Ceci est une base de règles.
  C'est elle qui informe de ce que l'on peut faire et à partir de quoi.
|#

(defparameter *r1* '(((+ 1 oeufsBlancs) (+ 1 oeufsJaunes))
  (>= 1 oeufs)))

(defparameter *br*
  '(
    *r1*
  )
)

