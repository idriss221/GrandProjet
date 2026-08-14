CREATE TABLE utilisateurs (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    nom             VARCHAR(100) NOT NULL,
    email           VARCHAR(150) NOT NULL UNIQUE,
    mot_de_passe    VARCHAR(255) NOT NULL,
    role            VARCHAR(20)  NOT NULL CHECK (role IN ('admin', 'vente', 'stock', 'inventaire'))
);


CREATE TABLE produits (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    nom             VARCHAR(150) NOT NULL UNIQUE,
    prix_unitaire   NUMERIC(12,2) NOT NULL ,
    quantite_stock  INT NOT NULL
);


CREATE TABLE clients (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    prenom          VARCHAR(100) NOT NULL,
    nom             VARCHAR(100) NOT NULL,
    telephone       VARCHAR(20)  NOT NULL UNIQUE,
    email           VARCHAR(150) NOT NULL UNIQUE
);


CREATE TABLE fournisseurs (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    nom             VARCHAR(150) NOT NULL,
    telephone       VARCHAR(20)  NOT NULL UNIQUE,
    adresse         VARCHAR(255) NOT NULL,
    email           VARCHAR(150) NOT NULL UNIQUE
);


CREATE TABLE commandes (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    client_id       INT NOT NULL REFERENCES clients(id),
    utilisateur_id  INT NOT NULL REFERENCES utilisateurs(id),
    montant_total   NUMERIC(12,2) NOT NULL,
    montant_verse   NUMERIC(12,2) NOT NULL,
    mode_reglement  VARCHAR(20) NOT NULL CHECK (mode_reglement IN ('Wave', 'Orange Money', 'Especes')),
    statut          VARCHAR(20) NOT NULL
);


CREATE TABLE lignes_commande (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    commande_id     INT NOT NULL REFERENCES commandes(id),
    produit_id      INT NOT NULL REFERENCES produits(id),
    quantite        INT NOT NULL,
    prix_unitaire   NUMERIC(12,2) NOT NULL,
    sous_total      NUMERIC(12,2)
);


CREATE TABLE dettes (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    commande_id     INT UNIQUE REFERENCES commandes(id),
    client_id       INT NOT NULL REFERENCES clients(id),
    montant_initial NUMERIC(12,2) NOT NULL CHECK (montant_initial >= 0),
    montant_paye    NUMERIC(12,2) NOT NULL,
    montant_restant NUMERIC(12,2),
    statut          VARCHAR(20) NOT NULL
);


CREATE TABLE paiements (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    dette_id        INT NOT NULL REFERENCES dettes(id),
    montant_verse   NUMERIC(12,2) NOT NULL,
    mode_paiement   VARCHAR(20) NOT NULL CHECK (mode_paiement IN ('Orange Money', 'Wave', 'Especes'))
);


CREATE TABLE approvisionnements (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    fournisseur_id  INT NOT NULL REFERENCES fournisseurs(id),
    utilisateur_id  INT REFERENCES utilisateurs(id),
    ref_bl          VARCHAR(50) NOT NULL UNIQUE,
    date_commande   DATE,
    date_reception  DATE,
    montant_total   NUMERIC(12,2) NOT NULL,
    montant_paye    NUMERIC(12,2) NOT NULL,
    statut          VARCHAR(20) NOT NULL CHECK (statut IN ('En cours', 'Recu'))
);


CREATE TABLE lignes_approvisionnement (
    id                    INTEGER PRIMARY KEY AUTOINCREMENT,
    approvisionnement_id  INT NOT NULL REFERENCES approvisionnements(id),
    produit_id            INT NOT NULL REFERENCES produits(id),
    quantite_commande     INT NOT NULL,
    quantite_recue        INT NOT NULL,
    cout_unitaire         NUMERIC(12,2) NOT NULL,
    sous_total            NUMERIC(12,2) NOT NULL
);