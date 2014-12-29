(defun getPremisse (regle)
  (cadr regle) 
)

(defun getConclusion (regle)
  (car regle) 
)

(defun getAttribut (premisse)
  (car premisse)
)

(defun getValeur (premisse)
  (cadr premisse)
)

(defun getValeurBf (attribut bf)
  (cadr (assoc attribut bf))
)

(defun premisseValideBf (premisse bf)
  (>= (getValeurBf (getAttribut premisse) bf) (getValeur premisse))
)

(defun premissesValideETBf (premisses bf)
  (let ((valide T))
    (loop for premisse in premisses do
      (if (not (premisseValideBf premisse bf))
        (setq valide nil)
      )
    )
    valide
  )
)
