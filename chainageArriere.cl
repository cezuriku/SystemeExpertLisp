#|

|#

(defun chainageArriere (bf br but)
  (let (reussi chemins)
    (setq but (mettreAJourButBf but bf))
    
    (if (eq but nil)
      (setq reussi T)
      (progn
        (loop for regle in br do
          (if (butAppartientConclusionRegle but (eval regle))
            (push regle chemins)
          )
        )
      )
    )
    reussi
  )
)

(defun butAppartientConclusionRegle (but regle)
  (let (reussi)
    (loop for premisse in but do
      (loop for conclusion in (car regle) do
        (if (eq (car premisse) (car conclusion))
          (setq reussi T)
        )
      )
    )
    reussi
  )
)

(defun butAppartientBf (but bf)
  (let ((reussi T))
    (loop for premisse in but do
      (if (not (premisseAppartientBf premisse bf))
        (setq reussi nil)
      )
    )
    reussi
  )
)

(defun premisseAppartientBf (premisse bf)
  (let ((fait (assoc (car premisse) bf)) reussi)
    (if (>= (cadr fait) (cadr premisse))
      (setq reussi T)
    )
    reussi
  )
)
