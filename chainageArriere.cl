(load "outils.cl")

(defun chainageArriere (bf br butInitial chemin)
"Cette fonction retourne l'ensemble des règles utilisées pour atteindre le but.
Si le but est impossible à atteindre elle renvoie nil.
Si le but est atteint sans aucune règle alors elle renvoie T(true).
Cette fonction est en chainage arrière c'est à dire qu'elle part du but pour
arriver aux faits. Et elle est en profondeur d'abord; elle continue de tester
plusieurs règles à la suite avant de revenir au départ."
  ; Si dès le départ notre but est validé on renvoie T
  (if (premissesValideETBf butInitial bf)
    T
    ; Sinon
    (let (retour retourTmp trouve (premisse (car butInitial)) (but (copy-tree butInitial)))
      ; Tant que nous n'avons pas trouvé de solutions et qu'il reste au moins
      ; une prémisse du but à tester
      (loop while (and (not trouve) premisse) do
        ; On regarde si la prémisse à besoin d'un nombre positif de l'objet
        (if (> (getValeur premisse) 0)
          ; Dans ce cas pour chaque règle de la base de règle qui peut satisfaire
          ; partiellement ou entierement la prémisse alors
          (loop for regle in (getReglesPour (getAttribut premisse) br) do
            ; On applique cette règle
            (setq but (appliquerRegleBut regle but))
            ; On l'ajoute dans le chemin
            (push regle chemin)
            ; Et on refait un chainageArriere
            (setq retourTmp (chainageArriere bf br but chemin))
            ; Si le retour du chainageArriere est T alors on enregistre le chemin
            ; jusqu'a ce chainage sinon si il retourne un chemin on le retourne
            ; aussi et sinon on ne fait rien
            (if retourTmp
              (progn
                (setq trouve T)
                (if (eq T retourTmp)
                  (setq retour chemin)
                  (setq retour retourTmp)
                )
              )
            )
          )
        )
        
        ; Ici on récupère la prémisse suivante du but pour la boucle
        (setq premisse (cadr (member premisse butInitial)))
      )
      retour
    )
  )
)

(defun chainageArriere2 (bf br butInitial)
"Cette fonction retourne l'ensemble des règles utilisées pour atteindre le but.
Si le but est impossible à atteindre elle renvoie nil.
Si le but est atteint sans aucune règle alors elle renvoie T(true).
Cette fonction est en chainage arrière c'est à dire qu'elle part du but pour
arriver aux faits. Et elle est en largeur d'abord; elle teste d'abord chaque
règle avant de tester avec 2 règles puis 3 règles, ... Cette méthode permet
d'obtenir le nombre minimum de règle pour atteindre le but."
  ; Si dès le départ notre but est validé on renvoie T
  (if (premissesValideETBf butInitial bf)
    T
    ; Sinon listeRegles récupère les règles permettant d'atteindre ou d'approcher
    ; le but et retour vaut nil
    (let (retour (listeRegles (getReglesPourBut butInitial br))
            but regles but)
      ; Tant que nous n'avons pas trouvé de solutions (not retour) et qu'il reste 
      ; au moins une une règle à tester
      (loop while (and listeRegles (not retour)) do
        ; On récupère le premier ensemble de règle ou première règle
        (setq regles (pop listeRegles))
        ; On copie le but
        (setq but (copy-tree butInitial))
        ; Si c'est un ensemble de règles
        (if (listp regles)
          ; On les appliquent toutes
          (loop for regle in regles do
            (setq but (appliquerRegleBut regle but))
          )
          ; Sinon on applique la seule règle
          (setq but (appliquerRegleBut regles but))
        )
        ; Si maintenant le but est validé
        (if (premissesValideETBf but bf)
          ; On retiens toutes les règles
          (setq retour regles)
          ; Sinon on regarde quelles pourront être le prochain ensemble de règles
          ; à tester qu'on ajoute à listeRegles
          (if (listp regles)
            (loop for regle in (getReglesPourBut but br) do
              (setq listeRegles (append listeRegles (list (append regles (list regle)))))
            )
            (loop for regle in (getReglesPourBut but br) do
              (setq listeRegles (append listeRegles (list (append (list regles) (list regle)))))
            )
          )
        )
      )
      
      ; On retourne les règles ou T ou nil
      retour
    )
  )
)
