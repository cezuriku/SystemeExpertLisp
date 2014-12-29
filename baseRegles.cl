#|
  Ceci est une base de règles.
  C'est elle qui informe de ce que l'on peut faire et à partir de quoi.
|#

(defparameter *r1* '(((+ 1 oeufsBlancs) (+ 1 oeufsJaunes))
  (>= 1 oeufs)))

(defparameter *r2* '(((+ 1365 cremeAnglaise))
  (>= 1000 lait) (>= 6 oeufsJaunes) (>= 100 sucre) (>= 150 rhum)))

(defparameter *br*
  '(
    *r1* *r2*
  )
)

