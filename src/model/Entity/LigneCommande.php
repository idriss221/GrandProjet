
<?php
class LigneCommande {
    private int $id;
    private int $commande_id;
    private int $produit_id;
    private int $qte_commande;
    private float $prix_reel;
 
    public function getId(): ?int
    {
        return $this->id;
    }
}