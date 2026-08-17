```markdown
# 📓 Journal de Développement (DEVLOG)
**Nom & Prénom** : Diouf Idrissa
**Projet** : StoreManager Pro (ERP PHP/POO)  


## 1. Suivi Chronologique des Phases

###  [Vendredi - Phase 1] : Conception & BDD Fallback

* 20H :

 Ce qui a été fait :

   Réalisation du diagramme de cas d'utilisation afin de représenter les principales fonctionnalités du système et les interactions entre les utilisateurs et l'application.
   Réalisation du diagramme de classes afin de définir la structure du système, les principales classes, leurs attributs, leurs méthodes et leurs relations.

  Difficultés / Obstacles :

   Déterminer correctement les responsabilités de chaque acteur afin d'éviter de donner des droits inutiles à certains utilisateurs.
   Organiser les différentes fonctionnalités du système de manière cohérente dans le diagramme de cas d'utilisation.
   Identifier les principales classes et leurs relations avant de commencer l'implémentation en PHP/POO.
   Prévoir une structure suffisamment claire pour pouvoir faire évoluer le projet par la suite.




    [Vendredi - Phase 1] : Conception & BDD Fallback
      22h
- Ce qui a été fait :
  - Rédaction du script `schema.sql` (PostgreSQL) : 10 tables (`utilisateurs`, `produits`, `clients`, `fournisseurs`, `commandes`, `lignes_commande`, `dettes`, `paiements`, `approvisionnements`, `lignes_approvisionnement`) 
  - Rédaction du script `schema_sqlite.sql`, équivalent fonctionnel en SQLite .
- Difficultés / Obstacles :
  - Différences de syntaxe entre PostgreSQL et SQLite à maintenir en parallèle dans deux scripts cohérents.
  - j'ai pas vraiment compris sqlite , j'ai pris du temps à regarder ce que ça fait et comment, jusque là , cest pas parfaitement acquis , ya de nouvelles choses.




### 🌃 [Vendredi - Phase 1] : Database Singleton (Connexion BDD)
- Heure de réalisation : 00H
- Ce qui a été fait :
  - Créé le fichier `src/Core/Database.php`.
  - Utilisé `getInstance()` pour toujours avoir la même connexion au lieu d'en créer plusieurs.
- Difficultés / Obstacles :
  - Pas facile à comprendre le principe de Singleton au début.
  - Problème avec le namespace, j'ai dû l'enlever car ça marchait pas bien.
  - j'ai vraiment galéré





### 📌 [Phase 2] : Entités POO Pure
- **Heure de réalisation** : 09h00 - 11h00
- Ce qui a été fait :
  - Créé 10 fichiers dans `src/Model/Entity/` (`Produit.php`, `Client.php`, `Commande.php`, `Dette.php`, etc.)
  - Mis des `private` avec un type pour chaque propriété.
- Difficultés / Obstacles :
  - Pas facile de savoir combien de méthodes il fallait mettre, j'ai fait simple.
  - J'ai eu du mal à comprendre certains trucs mais avec ça , j'ai pu comprendre ne serait-ce qu'un peu





### 📌 [Phase 2] : Repositories
- **Heure de réalisation** : 19h
- Ce qui a été fait :
  - Créé `ProduitRepository.php`, `ClientRepository.php`, `FournisseurRepository.php` dans `src/Model/Repository/`.
 - Difficultés / Obstacles :
  - La POO c'est vraiment pas facile pour moi, j'ai du mal à comprendre pourquoi on doit passer par une classe "Repository" au lieu de juste faire la requête SQL directement.
    - j'ai du mal à comprendre certaine notions mais je me documente en meme temps.




# Devlog - Implémentation du Service de Vente (Version POO)

- **Heure de réalisation** : 23H
- Ce qui a été fait : 
  - Création de la classe `VenteService` dans src/services.
  -
- Difficultés / Obstacles : 
  - Difficulté à comprendre pourquoi on passe `$pdo` et `$venteRepository` dans le constructeur (`__construct`) au lieu de les créer directement dans la fonction.
  - Assimiler le concept d'injection de dépendances, qui semblait trop abstrait au départ.