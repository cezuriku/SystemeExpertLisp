#|

|#
(load "outils.cl")

(defun chainageArriere (bf br butInitial chemin)
  (if (premissesValideETBf butInitial bf)
    T
    (let (retour retourTmp trouve (premisse (car butInitial)) (but (copy-tree butInitial)))
      (loop while (and (not trouve) premisse) do
        (if (> (getValeur premisse) 0)
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
        )
        (setq premisse (cadr (member premisse butInitial)))
      )
      retour
    )
  )
)
