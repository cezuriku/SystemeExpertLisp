#|

|#
(load "outils.cl")

(defun chainageArriere (bf br butInital chemin)
  (print butInital)
  (if (premissesValideETBf butInital bf)
    T
    (let (retour retourTmp trouve (premisse (car butInital)) (but (copy-tree butInital)))
      (loop while (and (not trouve) premisse) do
        (loop for regle in (getReglesPour (getAttribut premisse) br) do
          (setq but (appliquerRegleBut regle but))
          (push regle chemin)
          (setq retourTmp (chainageArriere bf br but chemin))
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
        (setq premisse (cadr (member premisse butInital)))
      )
      retour
    )
  )
)
