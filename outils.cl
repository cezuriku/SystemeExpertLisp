(defun getPremisses (regle)
  "Récupère les premisses d'une règle"
  (cadr (eval regle))
)

(defun getConclusions (regle)
  "Récupère les conclusions d'une règle"
  (car (eval regle))
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

(defun getReglesPour (attribut br)
  (let (listeRegles)
    (loop for regle in br do
      (loop for conclusion in (getConclusions regle) do
        (if (eq (getAttribut conclusion) attribut)
          (push regle listeRegles)
        )
      )
    )
    listeRegles
  )
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
