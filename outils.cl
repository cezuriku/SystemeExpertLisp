(defun getPremisses (regle)
  "Récupère les premisses d'une règle"
  (cadr (eval regle))
)

(defun getConclusions (regle)
  "Récupère les conclusions d'une règle"
  (car (eval regle))
)

(defun getInstructions (regle)
  "Récupère les instructions d'une règle"
  (caddr (eval regle))
)

(defun getAttribut (premisse)
  "Récupère l'attribut d'une prémisse"
  ; Par exemple si on veut 1 oeuf elle retournera oeuf
  (car premisse)
)

(defun getValeur (premisse)
  "Récupère la valeur d'une prémisse"
  ; Par exemple si on veut 1 oeuf elle retournera 1
  (cadr premisse)
)

(defun getValeurBf (attribut bf)
  "Récupère la valeur de l'objet dans la base de faits"
  ; Par exemple si la base de faits possède 1 oeuf et qu'on demande oeuf alors
  ; elle retournera 1
  (cadr (assoc attribut bf))
)

(defun getReglesPour (attribut br)
"Cette fonction récupère l'ensemble des règles qui peuvent être associé à un objet"
; Par exemple elle retourne les règles associées à oeufsBlancs
  (let (listeRegles)
    ; Pour chaque règle
    (loop for regle in br do
      ; On regarde si une conclusion
      (loop for conclusion in (getConclusions regle) do
        ; à un attribut égal à celui recherché
        (if (eq (getAttribut conclusion) attribut)
          ; Dans ce cas on l'ajoute à la liste des Règles
          (push regle listeRegles)
        )
      )
    )
    ; On retourne la liste des règles
    listeRegles
  )
)

(defun getReglesPourBut (but br)
"Cette fonction retourne toutes les règles associés à un but"
  (let (listeRegles)
    ; Pour chaque prémisse du but
    (loop for premisse in but do
      ; Si cette prémisse est valide
      (if (> (getValeur premisse) 0)
        ; On regarde si une règle peut aider à valider cette prémisse
        (loop for regle in (getReglesPour (getAttribut premisse) br) do
          ; Dans ce cas si elle n'est pas déjà dans la liste de règles
          (if (not (member regle listeRegles))
            ; On l'ajoute
            (push regle listeRegles)
          )
        )
      )
    )
    
    ; On retourne la liste de règles
    listeRegles
  )
)

(defun premisseValideBf (premisse bf)
"Cette fonction permet de regarder si une prémisse est directement validé
par la base de fait"
  (if (getValeurBf (getAttribut premisse) bf)
    (>= (getValeurBf (getAttribut premisse) bf) (getValeur premisse))
    nil
  )
)

(defun premissesValideETBf (premisses bf)
"Cette fonction permet de regarder si un ensemble de prémisses est directement
validé par la base de fait"
  (let ((valide T))
    ; Pour chaque prémisse
    (loop for premisse in premisses do
      ; Si une seule n'est pas validé
      (if (not (premisseValideBf premisse bf))
        ; Alors l'ensemble n'est pas validé
        (setq valide nil)
      )
    )
    valide
  )
)

(defun appliquerRegleBf (regle bf)
"Cette fonction applique une règle sur la base de faits"
  ; Pour chaque prémisse de la règle
  (loop for premisse in (getPremisses regle) do
    ; On applique la prémisse sur la base de fait
    (appliquerPremisseBf premisse bf)
  )
  ; Pour chaque conclusion de la règle
  (loop for conclusion in (getConclusions regle) do
    ; On applique la conclusion sur la base de fait
    (setq bf (appliquerConclusionBf conclusion bf))
  )
  bf
)

(defun appliquerPremisseBf (premisse bf)
"Cette fonction applique une prémisse à la base de faits"
  (let ((fait (assoc (car premisse) bf)))
    ; On récupère le fait dans la base de faits et l'on soustrait la prémisse
    (setf (cadr fait) (- (cadr fait) (cadr premisse)))
  )
)

(defun appliquerConclusionBf (conclusion bf)
"Cette fonction applique une conclusion à la base de faits"
  (let ((fait (assoc (car conclusion) bf)))
    ; Si le fait existe dans la base de faits
    (if fait
      ; On ajoute la conclusion au fait
      (setf (cadr fait) (+ (cadr fait) (cadr conclusion)))
      ; Sinon on ajoute la conclusion directement
      (push (copy-tree conclusion) bf)
    )
  )
  bf
)

(defun appliquerRegleBut (regle but)
"Cette fonction applique une règle au but"
  ; Pour chaque prémisse de la règle
  (loop for premisse in (getPremisses regle) do
    ; On applique la prémisse sur la base de fait
    (appliquerPremisseBut premisse but)
  )
  ; Pour chaque conclusion de la règle
  (loop for conclusion in (getConclusions regle) do
    ; On applique la conclusion sur la base de fait
    (setq but (appliquerConclusionBut conclusion but))
  )
  but
)

(defun appliquerPremisseBut (premisse but)
"Cette fonction applique une prémisse au but"
  (let ((fait (assoc (car premisse) but)))
    ; Si le fait existe dans le but
    (if fait
      ; On ajoute la prémisse au fait
      (setf (cadr fait) (+ (cadr fait) (cadr premisse)))
      ; Sinon on ajoute la prémisse au but
      (push (copy-tree premisse) but)
    )
  )
  but
)

(defun appliquerConclusionBut (conclusion but)
"Cette fonction applique une conclusion au but"
  (let ((fait (assoc (car conclusion) but)))
    ; Si le fait existe dans le but
    (if fait
      ; On y sosutrait la valeur de la conclusion
      (setf (cadr fait) (- (cadr fait) (cadr conclusion)))
      ; Sinon on en fait rien puisqu'on en a pas besoin
    )
  )
  but
)
