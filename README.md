https://fierce-sierra-61774.herokuapp.com/
https://git.heroku.com/fierce-sierra-61774.git

Informations utiles:
-----
Formulaire de connexion utilisateur:
- Il faut s'inscrire et valider la confirmation parmail pour pouvoir se connecter.

Formulaire de connexion administrateur:
- Email: adrien@jourdier.fr
- Mot de passe: 123456 

Fonctionnalités présentes:
------
- Espace blog accessible par tous les utilisateurs
- Authentification utilisateur avec devise + confirmation par email
- Ecriture d'un commentaire sur un article si l'utilisateur est authentifié
- Champ de recherche pour les articles
- Réécriture d'url avec un slug pour le front office (utilisation d'un concern appelé Sluggable)
- Traduction du front et du back (unbe grande majorité est traduite)
- Possibilité de choisir la langue (anglais ou français) depuis une liste déroulante, cela change aussi les articles (article en quand langue en et article fr quand langue fr)
- Formulaire de contact avec envoi de mail sur l'adresse adrien.jourdier@eemi.com
- Pagination des articles
- Bandeau cnil avec le gem cookie_eu

- Espace d'administration
    - Authentification d'un administrateur avec devise
    - CRUD articles (par défaut, les articles ne sont pas publiés)
    - Possibilité de publier un article sur le front (action irréversible pour le moment)
    - Upload de fichiers avec le gem carrierwave et mini_magick pour le redimensionnement des images
    - CRUD catégories
    - CRUD contacts
    - Messages flash pour les messages de succès et d'échec
    - Validations pour tous les CRUD
    
On a essayé de mettre la connexion avec Facebook pour l'utilisateur avec le gem Omniauth mais cela ne fonctionne pas
ON a aussi essayé d'utiliser le gem http_user_agent pour la catégorisation des articles par langues mais n'est pas fonctionnel. Nous sommes donc passé par une liste déroulante et des cookies.