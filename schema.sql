
CREATE TABLE utilisateurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL,
    role VARCHAR(20)  NOT NULL CHECK (role IN ('admin', 'vente', 'stock', 'inventaire')),

);


CREATE TABLE produits (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(150) NOT NULL UNIQUE,
    prix_unitaire NUMERIC(12,2) NOT NULL CHECK (prix_unitaire >= 0),
    quantite_stock INT NOT NULL 
);


CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    prenom VARCHAR(100) NOT NULL,
    nom VARCHAR(100) NOT NULL,
    telephone VARCHAR(20)  NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
);


CREATE TABLE fournisseurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(150) NOT NULL,
    telephone VARCHAR(20)  NOT NULL UNIQUE,
    adresse VARCHAR(255) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
);


CREATE TABLE commandes (
    id SERIAL PRIMARY KEY,
    client_id INT  REFERENCES clients(id) NOT NULL ,
    utilisateur_ id REFERENCES utilisateurs(id) NOT NULL,
    montant_total NUMERIC(12,2) NOT NULL ,
    montant_verse NUMERIC(12,2) NOT NULL ,
    mode_reglement VARCHAR(20) NOT NULL CHECK (mode_reglement IN ('Wave', 'Orange Money', 'Especes')),
    statut VARCHAR(20) NOT NULL 
);


CREATE TABLE lignes_commande (
    id SERIAL PRIMARY KEY,
    commande_id INT REFERENCES commandes(id) NOT NULL,
    produit_id INT REFERENCES produits(id) NOT NULL ,
    quantite INT NOT NULL ,
    prix_unitaire NUMERIC(12,2) NOT NULL ,
    sous_total NUMERIC(12,2) 
);


CREATE TABLE dettes (
    id SERIAL PRIMARY KEY,
    commande_id INT UNIQUE REFERENCES commandes(id) ,
    client_id NOT NULL REFERENCES clients(id) ,
    montant_initial NUMERIC(12,2) NOT NULL CHECK (montant_initial >= 0),
    montant_paye NUMERIC(12,2) NOT NULL ,
    montant_restant NUMERIC(12,2) ,
    statut VARCHAR(20) NOT NULL 
);


CREATE TABLE paiements (
    id SERIAL PRIMARY KEY,
    dette_id INT REFERENCES dettes(id) NOT NULL,
    montant_verse   NUMERIC(12,2) NOT NULL ,
    mode_paiement   VARCHAR(20) NOT NULL CHECK (mode_paiement IN ('Orange Money', 'Wave', 'Especes'))
);


CREATE TABLE approvisionnements (
    id SERIAL PRIMARY KEY,
    fournisseur_id INT REFERENCES fournisseurs(id) NOT NULL,
    utilisateur_id INT REFERENCES utilisateurs(id) ,
    ref_bl VARCHAR(50) NOT NULL UNIQUE,
    date_commande DATE,
    date_reception  DATE,
    montant_total NUMERIC(12,2) NOT NULL ,
    montant_paye NUMERIC(12,2) NOT NULL ,
    statut VARCHAR(20) NOT NULL CHECK (statut IN ('En cours', 'Recu')),
);


CREATE TABLE lignes_approvisionnement (
    id SERIAL PRIMARY KEY,
    approvisionnement_id INT REFERENCES approvisionnements(id) NOT NULL,
    produit_id INT  REFERENCES produits(id) NOT NULL ,
    quantite_commande NOT NULL ,
    quantite_recue NOT NULL ,
    cout_unitaire NUMERIC(12,2) NOT NULL ,
    sous_total NUMERIC(12,2) NOT NULL
);