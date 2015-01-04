#|

|#
(load "outils.cl")

(defun chainageAvant (bfInitiale br but chemin)
  (if (premissesValideETBf but bfInitiale)
    T
    (let (retour retourTmp trouve (regle (car br)) (bf (copy-tree bfInitiale)))
      (loop while (and (not trouve) regle) do
        (if (premissesValideETBf (getPremisses regle) bf)
          (progn
            (setq bf (appliquerRegleBf regle bf))
            (push regle chemin)
            (setq retourTmp (chainageAvant bf br but chemin))
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
        (setq regle (cadr (member regle br)))
      )
      retour
    )
  )
)
