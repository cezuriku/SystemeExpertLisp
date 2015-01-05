(load "baseFaits.cl")
(load "baseRegles.cl")
(load "chainageAvant.cl")
(load "chainageArriere.cl")

(defun systemeExpert (chainage bf br but)
"Cette fonction écrit la recette pour obtenir le but.
Elle retourne l'ensemble des règles utilisées pour atteindre le but.
Si le but est impossible à atteindre elle renvoie nil.
Si le but est atteint sans aucune règle alors elle renvoie T(true)."
  (let (chemin)
    ; Si l'on demande un chainageAvant on fait un chainageAvant
    (if (eq chainage 'AVANT)
      (setq chemin (chainageAvant bf br but nil))
      ; Si l'on demande un chainageArriere on fait un chainageArriere
      (if (eq chainage 'ARRIERE)
        (setq chemin (chainageArriere bf br but nil))
        ; Si le chainage est différent de 'Avant ou 'Arriere on fait un petit
        ; message d'erreur 
        (error "Veuillez precisez un chainage entre 'Avant et 'Arriere")
      )
    )
    ; Si chemin vaut T alors on à déjà le nécéssaire
    (if (eq chemin T)
      (print "Tu as déjà tout ce qu'il te faut dans ton frigo")
      ; Si le chemin vaut nil alors on ne peut pas obtenir le but
      (if (eq chemin nil)
        (print "Impossible avec ce qu'il y a dans ton frigo")
        ; Sinon la recette est possible
        (progn
          (if (eq chainage 'AVANT)
            (setq chemin (reverse chemin))
          )
          ; Et on l'affiche
          (format T "Voici la recette pour faire : ~a~&" but)
          (loop for regle in chemin do
            (format T "~a~&" (getInstructions regle))
          )
        )
      )
    )
    ; On retourne le chemin
    chemin
  )
)
