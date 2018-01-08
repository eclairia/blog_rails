https://young-retreat-62311.herokuapp.com/ |
https://git.heroku.com/young-retreat-62311.git


Fonctionnalités présentes:
------
- Espace blog accessible par tous les utilisateurs
- Authentification utilisateur avec devise
- Ecriture d'un commentaire sur un article si l'utilisateur est authentifié
- Champ de recherche pour les articles

- Espace d'administration
    - Authentification d'un administrateur avec devise
    - CRUD articles
    - CRUD catégories
    - Messages flash pour les messages de succès et d'échec
    
To do:
------
- Ajouter les validations
- Ajouter les tests fonctionnels pour les controller et les models
- Faire un formulaire de contact avec envoi de mail
- Possibilité de trier les articles par catégories avec un menu (possibilité de le faire en ajax)
- Faire un scroll infini des articles (AJAX)
- Possibilité pour un utilisateur de suivre un auteur et de recevoir ses prochains articles publiés par mail
- Faire du rewriting d'url (ajout un slug)
- Rajouter la possibilité aux utilisateurs de s'inscrire via Facebook
- Rajouter un système de like pour les articles
- Possibilité de partager les articles sur les comptes Twitter et Facebook de l'utilisateur
- Rajouter un système de like pour les commentaires + laisser le choix à l'utilisateur sur le tri des des commentaires (soit les plus récents d'abord soit les plus likés d'abord)

Bonnes pratiques:
------
- Remplacer les before_action par des services