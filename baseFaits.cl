#|
  Ceci est une base de faits.
  C'est elle qui informe de toutes les possessions avant la recherche.
  Avant de lancer le système expert il faut renseigner ici ou dans une autre
  variable votre base de faits mais elle devra garder cette structure.
|#

(defparameter *bf*
  '(
    (entrees            0)    ; en parts
    (plats              0)    ; en parts
    (desserts           0)    ; en parts
    (chocolatTablette   450)  ; en grammes
    (cremeAnglaise      0)    ; en millilitres
    (cremeFraiche       250)  ; en grammes
    (ganacheAuChocolat  0)    ; en parts
    (lait               1000) ; en millilitres
    (oeufs              9)    ; en unités
    (oeufsBlancs        0)    ; en unités
    (oeufsJaunes        0)    ; en unités
    (raisinsSecs        60)   ; en grammes
    (rhum               150)  ; en millilitres
    (sucre              100)  ; en grammes
  )
)
