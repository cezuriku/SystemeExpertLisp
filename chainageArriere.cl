#|

|#

(defun chainageArriere (bf br but)
  (let (reussi chemins)
    (if (butAppartientBf but bf)
      (setq reussi T)
    )
    reussi
  )
)

(defun mettreAJourButBf (but bf)
  (loop for premisse in but do
    (if (premisseAppartientBf premisse bf)
      (mettreAJourPremisseBf premisse bf)
    )
  )
)

(defun mettreAJourPremisseBf (premisse bf)
  (let ((fait (assoc (car premisse) bf)))
    (setf (cadr fait) (- (cadr fait) (cadr premisse)))
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
