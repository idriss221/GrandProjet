<?php
class VenteService {
    private $pdo;
    private $venteRepository;

    public function __construct($pdo, $venteRepository) {
        $this->pdo = $pdo;
        $this->venteRepository = $venteRepository;
    }

    public function enregistrerVente($client, $panier) {
        if (empty($panier)) {
            throw new Exception("Le panier est vide.");
        }

        $montantTotal = 0;
        $ligneVentes = [];

        foreach ($panier as $item) {
            $produit = $item['produit'];
            $quantite = $item['quantite'];
            $prixUnitaire = $item['prix'];

            if ($produit->getQuantiteDisponible() <= $quantite) {
                throw new Exception("Quantité insuffisante.");
            }

            $montantTotal = $montantTotal + ($prixUnitaire * $quantite);
            $ligneVentes = new LigneVente($quantite, $prixUnitaire, $produit);
        }

        $dateJour = date('Y-m-d');
        $vente = new Vente($dateJour, $montantTotal, $client);
        
        $resultat = $this->venteRepository->saveVente($vente, $ligneVentes);

        if ($resultat == false) {
            throw new Exception("Erreur lors de l'enregistrement.");
        }

        if (isset($_SESSION['panier'])) {
            unset($_SESSION['panier']);
        }

        return true;
    }
}
