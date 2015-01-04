#|
  Ceci est une base de règles.
  C'est elle qui informe de ce que l'on peut faire et à partir de quoi.
|#

(defparameter *r1* '(
  ((oeufsBlancs 1) (oeufsJaunes 1))
  ((oeufs 1))
  "Pour un oeuf blanc et un oeuf jaune : Cassez un oeuf en separant le blanc du jaune"
))

(defparameter *r2* '(
  ((cremeAnglaise 1365))
  ((lait 1000) (oeufsJaunes 6) (sucre 100) (rhum 150))
  "Pour la crème anglaise : Faites bouillir 1l de lait et 150ml de rhum. Prendre 6 jaunes d'oeufs et les mettre dans une terrine avec 100g de sucre. Mélangez le tout."
))

(defparameter *r3* '(
  ((ganacheAuChocolat 4))
  ((raisinsSecs 60) (chocolatTablette 450) (oeufsJaunes 3) (oeufsBlancs 5)
      (cremeFraiche 250) (cremeAnglaise 1365))
  "Pour la ganache au chocolat : Faites bouillir et réduire de 1/4 250g de crème fraîche retirez du feu et mettez dedans 450g de chocolat, en remuant et réchauffant si besoin est. Quand il est fondu et la préparation tiède, otez du feu, ajoutez 3 jaunes d'oeufs, mélangez bien, puis incorporer 5 blancs d'oeufs montés en neige à la cuillère. Ajoutez 3 cuillères de raisins secs et moulez 12h au froid dans des petits ramequins ou un grand saladier. Servez les avec la crème anglaise."
))

(defparameter *r4* '(
  ((desserts 1))
  ((ganacheAuChocolat 1))
  "Pour un dessert : Mettez votre ganache au chocolat à coté des desserts"
))

(defparameter *br*
  '(
    *r1* *r2* *r3* *r4*
  )
)
