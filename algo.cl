Algorithme ChainageAvant(bfInitiale br but chemin)
  variable : retour retourTmp trouve regle bf
Debut
  Si but validé dans bfInitiale
    retourner vrai
  Sinon
    bf <- copie de bfInitiale
    regle <- premier élément de br
    Tant que non trouve et regle non vide faire
      Si regle validé dans bf
        Appliquer regle à bf
        Ajouter règle à chemin
        retourTmp <- ChainageAvant (bf br but chemin)
        Si retourTmp non nul
          trouve <- vrai
          Si retourTmp est égal à vrai
            retour <- chemin
          Sinon
            retour <- retourTmp
          Fin si
        Fin si
      Fin si
    Fin Tant que
  Fin Si
Fin Algorithme

Algorithme ChainageArriereLargeur(bf br butInitial chemin)
  variable : retour listeRegles but regles
Debut
  Si butInitial validé dans bf
    retourner vrai
  Sinon
    listeRegles <- reglesUtiles(butInitial br)
    Tant que retour vide et listeRegles non vide faire
      regles <- premier règle de listeRegles
      retirer le premier élément de listeRegles
      but <- copie de butInitial
      Appliquer regles à but
      Si but validé dans bf
        retour <- regles
      Sinon
        Pour chaque regle dans reglesUtiles(but br) faire
          Ajouter listeRegles (regles + regle)
        Fin Pour
      Fin Si      
    Fin Tant que
  Fin Si
Fin Algorithme

Algorithme ChainageArriereProfondeur(bf br butInitial chemin)
  variable : retour retourTmp trouve premisse but
Debut
  Si butInitial validé dans bf
    retourner vrai
  Sinon
    but <- copie de butInitial
    premisse <- premier élément de butInitial
    Tant que non trouve et premisse non vide faire
      Pour chaque regle dans reglesUtiles(premisse br) faire
        Appliquer regle à but
        Ajouter règle à chemin
        retourTmp <- ChainageArriere (bf br but chemin)
        Si retourTmp non nul
          trouve <- vrai
          Si retourTmp est égal à vrai
            retour <- chemin
          Sinon
            retour <- retourTmp
          Fin si
        Fin si
      Fin Pour
    Fin Tant que
  Fin Si
Fin Algorithme

