(load "outils.cl")

(defun chainageAvant (bfInitiale br but cheminInitial)
"Cette fonction retourne l'ensemble des règles utilisées pour atteindre le but.
Si le but est impossible à atteindre elle renvoie nil.
Si le but est atteint sans aucune règle alors elle renvoie T(true).
Cette fonction est en chainage avant c'est à dire qu'elle part de la base de faits
et cherche à atteindre le but en appliquant des règles sur la base de faits.
Et elle est en profondeur d'abord; elle continue de tester
plusieurs règles à la suite avant de revenir au départ."
  (if (premissesValideETBf but bfInitiale)
    T
    ; Sinon
    (let (retour retourTmp trouve (regle (car br)) bf chemin)
      ; Tant que nous n'avons pas trouvé de solutions et qu'il reste 
      ; au moins une une règle à tester
      (loop while (and (not trouve) regle) do
        ; Si l'on peut appliquer une règle
        ; c'est à dire que ses prémisses sont valides
        (setq bf (copy-tree bfInitiale))
        (setq chemin (copy-tree cheminInitial))
        (if (premissesValideETBf (getPremisses regle) bf)
          (progn
            ; On applique la règle
            (setq bf (appliquerRegleBf regle bf))
            ; On ajoute cette règle dans le chemin
            (push regle chemin)
            ; Et l'on fait un chainageAvant
            (setq retourTmp (chainageAvant bf br but chemin))
            ; Si le retour du chainageAvant est T alors on enregistre le chemin
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
        
        ; Ici on récupère la règle suivante de la base de règle pour la boucle
        (setq regle (cadr (member regle br)))
      )
      retour
    )
  )
)
