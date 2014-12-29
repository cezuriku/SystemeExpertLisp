(load "outils.cl")
(load "baseRegles.cl")

(let* (
    (bfTEST
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
    (bfTEST-1
      '(
        (oeufs              9)    ; en unités
        (oeufsBlancs        0)    ; en unités
        (oeufsJaunes        0)    ; en unités
      )
    )
    (bfTEST-2
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
  (if (premisseValideBf premisseVrai1 bfTEST)
    (print "Test 1 reussi")
    (print "Test 1 échoué : premisseVrai1 non validée")
  )
  (if (premisseValideBf premisseVrai2 bfTEST)
    (print "Test 2 reussi")
    (print "Test 2 échoué : premisseVrai2 non validée")
  )
  (if (not (premisseValideBf premisseFausse1 bfTEST))
    (print "Test 3 reussi")
    (print "Test 3 échoué : premisseFausse1 validée")
  )
  (if (premissesValideETBf butVrai1 bfTEST)
    (print "Test 4 reussi")
    (print "Test 4 échoué : butVrai1 non validé")
  )
  (if (not (premissesValideETBf butFaux1 bfTEST))
    (print "Test 5 reussi")
    (print "Test 5 échoué : butFaux1 validé")
  )
  (let ((bf (copy-tree bfTEST-1)))
    (appliquerreglebf *r1* bf)
    (appliquerreglebf *r1* bf)
    (if (not (equal bf bfTEST-1))
      (print "Test 6-1 reussi")
      (print "Test 6-1 échoué : bf non différent de bfTEST-1")
    )
    (if (equal bf bfTEST-2)
      (print "Test 6-2 reussi")
      (print "Test 6-2 échoué : bf différent de bfTEST-2")
    )
  )
)
