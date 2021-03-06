#|
  Ceci est une base de règles.
  C'est elle qui informe de ce que l'on peut faire et à partir de quoi.
|#

; On liste l'ensemble des règles dans une variable
(defparameter *br*
  '(
    *r1* *r2* *r3* *r4* *r5* *r6* *r7* *r8* *r9* *r10*
  )
)

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
  "Pour la ganache au chocolat : Faites bouillir et réduire de 1/4 250g de creme fraiche retirez du feu et mettez dedans 450g de chocolat, en remuant et réchauffant si besoin est. Quand il est fondu et la préparation tiède, otez du feu, ajoutez 3 jaunes d'oeufs, mélangez bien, puis incorporer 5 blancs d'oeufs montés en neige à la cuillère. Ajoutez 3 cuillères de raisins secs et moulez 12h au froid dans des petits ramequins ou un grand saladier. Servez les avec la crème anglaise."
))

(defparameter *r4* '(
  ((desserts 1))
  ((ganacheAuChocolat 1))
  "Pour un dessert : Mettez votre ganache au chocolat à coté des desserts"
))

(defparameter *r5* '(
 ((baronDeLapin 4))
 ((lapins 2) (endives 4) (serpolet 6)(beurre 100) (cremeFraiche 150) (vinBlanc 250))
 "Pour le baron de lapin : Roulez les lapins dans la farine. Ajoutez les abats et 6 branches de serpolet. Dans une cocotte, placez une noix de beurre 100g, les morceaux de lapin, le vin blanc 250ml.Laissez cuire 20 a 30 mn avec un convercle. Ajoutez la creme 150g et faites reduire le tout. Sur chaque assiette, disposez le rable coupe en 2 petits tournedos accompagnes d'une cuisse de lapin et 1 garnissez d'endives."
))

(defparameter *r6* '(
 ((plats 1))
 ((baronDeLapin 1))
  "Pour un plat : Mettez votre baron de lapin a cote des plats."
))

(defparameter *r7* '(
 ((flanDeHuitres 4))
 ((huitres 24) (oeufs 4) (lait 500) (estragon 1))
  "Pour les flan d'huitres : Ouvrez les 24 huitres, retirez-les de leur coquille. Montez a ebullition et pochez 2mn. Egouttez puis passez ces huitres au mixeur. Battez les 4 oeufs et 500ml de lait, verser la creme d'huitres. Salez, Poivrez, ajoutez une branche d'estragon hachee, juste ce qu'il faut pour parfumer.Versez dans chaque coquille l'appareil a flan. Faites cuire au four pendant 15 mn. Servez chaud."
))

(defparameter *r8* '(
 ((entrees 1))
 ((flanDeHuitres 1))
  "Pour une entree : Mettez votre flan d'huitres a cote des entrees."
))

(defparameter *r9* '(
  ((menus 1))
  ((flanDeHuitres 6) (baronDeLapin 1) (ganacheAuChocolat 1))
  "Pour faire un menu complet : Commencez par le flan de huitres en entrée, ensuite un baron de lapin pour le plat de résistance et utilisez une part de ganache au chocolat en dessert"
))

(defparameter *r10* '(
  ((menus 1))
  ((plats 1) (entrees 1) (desserts 1))
  "Pour faire un menu complet : Commencez par l'entrée, ensuite un plat de résistance et enfin le dessert"
))
