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

; Méthode destructive sur bf
(defun mettreAJourButBf (but bf)
  (loop for premisse in but do
    (if (premisseAppartientBf premisse bf)
      (progn
        (mettreAJourPremisseBf premisse bf)
        (setq but (delete premisse but))
      )
    )
  )
  but
)

; Méthode destructive sans vérification qui modifie la base de faits
; en retirant le nécéssaire de la prémisse
(defun mettreAJourPremisseBf (premisse bf)
  (let ((fait (assoc (car premisse) bf)))
    (setf (cadr fait) (- (cadr fait) (cadr premisse)))
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
