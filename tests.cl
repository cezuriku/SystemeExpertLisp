(load "outils.cl")
(load "baseRegles.cl")
(load "chainageAvant.cl")

(let* (
    (TEST
      '(
        (chocolatTablette   450)  ; en grammes
        (cremeFraiche       250)  ; en grammes
        (cremeAnglaise      0)    ; en millilitres
        (lait               1000) ; en millilitres
        (oeufs              9)    ; en unités
        (oeufsBlancs        0)    ; en unités
        (oeufsJaunes        0)    ; en unités
        (raisinsSecs        60)   ; en grammes
        (rhum               150)  ; en millilitres
        (sucre              100)  ; en grammes
        (pain               0)    ; en grammes
      )
    )
    (TEST-1
      '(
        (oeufs              9)    ; en unités
        (oeufsBlancs        0)    ; en unités
        (oeufsJaunes        0)    ; en unités
      )
    )
    (TEST-2
      '(
        (oeufs              7)    ; en unités
        (oeufsBlancs        2)    ; en unités
        (oeufsJaunes        2)    ; en unités
      )
    )
    (premisseVrai1    '(chocolatTablette 100))
    (premisseVrai2    '(sucre            100))
    (premisseFausse1  '(rhum             200))
    (butVrai1 (list premisseVrai1 premisseVrai2))
    (butFaux1 (list premisseVrai1 premisseFausse1))
  )
  (if (premisseValideBf premisseVrai1 TEST)
    (print "Test 1 reussi")
    (print "Test 1 échoué : premisseVrai1 non validée")
  )
  (if (premisseValideBf premisseVrai2 TEST)
    (print "Test 2 reussi")
    (print "Test 2 échoué : premisseVrai2 non validée")
  )
  (if (not (premisseValideBf premisseFausse1 TEST))
    (print "Test 3 reussi")
    (print "Test 3 échoué : premisseFausse1 validée")
  )
  (if (premissesValideETBf butVrai1 TEST)
    (print "Test 4 reussi")
    (print "Test 4 échoué : butVrai1 non validé")
  )
  (if (not (premissesValideETBf butFaux1 TEST))
    (print "Test 5 reussi")
    (print "Test 5 échoué : butFaux1 validé")
  )
  (let ((bf (copy-tree TEST-1)))
    (appliquerRegleBf '*r1* bf)
    (appliquerRegleBf '*r1* bf)
    (if (not (equal bf TEST-1))
      (print "Test 6-1 reussi")
      (print "Test 6-1 échoué : bf non différent de TEST-1")
    )
    (if (equal bf TEST-2)
      (print "Test 6-2 reussi")
      (print "Test 6-2 échoué : bf différent de TEST-2")
    )
  )
  (let ((bf (copy-tree TEST-2)) resultat)
    (setq resultat (chainageAvant bf *br* '((oeufsBlancs 10)) nil))
    (if (not resultat)
      (print "Test 7-1 reussi")
      (print "Test 7-1 échoué : bf non différent de TEST-1")
    )
    (setq resultat (chainageAvant bf *br* '((oeufsBlancs 3) (oeufsJaunes 4)) nil))
    (if resultat
      (print "Test 7-2 reussi")
      (print "Test 7-2 échoué : bf différent de TEST-2")
    )
    (format T "~&Resultat du chainageAvant : ~A" resultat)
  )
  (let ((but (copy-tree TEST-2)))
    (appliquerRegleBut '*r1* but)
    (appliquerRegleBut '*r1* but)
    (if (not (equal but TEST-2))
      (print "Test 8-1 reussi")
      (print "Test 8-1 échoué : bf non différent de TEST-1")
    )
    (if (equal but TEST-1)
      (print "Test 8-2 reussi")
      (print "Test 8-2 échoué : bf différent de TEST-2")
    )
  )
)
