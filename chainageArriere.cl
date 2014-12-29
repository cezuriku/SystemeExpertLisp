#|

|#

(defun chainageArriere (bf br but)
  (let (reussi)
    (if (butAppartientBf but bf)
      (setq reussi T)
    )
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
