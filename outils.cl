(defun getPremisses (regle)
  (cadr regle) 
)

(defun getConclusions (regle)
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

(defun appliquerRegleBf (regle bf)
  (loop for premisse in (getPremisses regle) do
    (appliquerPremisseBf premisse bf)
  )
  (loop for conclusion in (getConclusions regle) do
    (appliquerConclusionBf conclusion bf)
  )
)

(defun appliquerPremisseBf (premisse bf)
  (let ((fait (assoc (car premisse) bf)))
    (setf (cadr fait) (- (cadr fait) (cadr premisse)))
  )
)

(defun appliquerConclusionBf (conclusion bf)
  (let ((fait (assoc (car conclusion) bf)))
    (setf (cadr fait) (+ (cadr fait) (cadr conclusion)))
  )
)
