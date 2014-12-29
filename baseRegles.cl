#|
  Ceci est une base de règles.
  C'est elle qui informe de ce que l'on peut faire et à partir de quoi.
|#

(defparameter *r1* '(
  ((oeufsBlancs 1) (oeufsJaunes 1))
  ((oeufs 1))
))

(defparameter *r2* '(
  ((cremeAnglaise 1365))
  ((lait 1000) (oeufsJaunes 6) (sucre 100) (rhum 150))
))

(defparameter *r3* '(
  ((ganacheAuChocolat 4))
  ((raisinsSecs 60) (chocolatTablette 450) (oeufsJaunes 3) (oeufsBlancs 5)
      (cremeFraiche 250) (cremeAnglaise 1365))
))

(defparameter *br*
  '(
    *r1* *r2* *r3*
  )
)
