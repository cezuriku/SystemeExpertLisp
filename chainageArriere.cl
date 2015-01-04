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

(defun chainageArriere2 (bf br butInitial)
  (if (premissesValideETBf butInitial bf)
    T
    (let (retour (listeRegles (getReglesPourBut butInitial br))
            but regles but)
      (loop while (and listeRegles (not retour)) do
        (setq regles (pop listeRegles))
        (setq but (copy-tree butInitial))
        (if (listp regles)
          (loop for regle in regles do
            (setq but (appliquerRegleBut regle but))
          )
          (setq but (appliquerRegleBut regles but))
        )
        (if (premissesValideETBf but bf)
          (progn 
          (setq retour regles))
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
      retour
    )
  )
)
