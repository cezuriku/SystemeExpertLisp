#|

|#
(load "outils.cl")

(defun chainageAvant (bfInitiale br but chemin)
  (let (retour retourTmp trouve (regle (car br)) (bf (copy-tree bfInitiale)))
    (if (premissesValideETBf but bf)
      (setq retour chemin)
      (loop while (and (not trouve) regle) do
        (if (premissesValideETBf (getPremisses (eval regle)) bf)
          (progn
            (appliquerRegleBf (eval regle) bf)
            (push regle chemin)
            (setq retourTmp (chainageAvant bf br but chemin))
            (if retourTmp
              (setq retour retourTmp)
            )
          )
        )
        (setq regle (cadr (member regle br)))
      )
    )
    retour
  )
)
