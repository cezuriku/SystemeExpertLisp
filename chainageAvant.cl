#|

|#
(load "outils.cl")

(defun chainageAvant (bfInitiale br but chemin)
  (let (retour retourTmp (bf (copy-tree bfInitiale)))
    (if (premissesValideETBf but bf)
      (setq retour chemin)
      (loop for regle in br do
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
      )
    )
    retour
  )
)
