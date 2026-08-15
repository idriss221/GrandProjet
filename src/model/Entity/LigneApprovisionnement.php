<?php
class LigneApprovisionnement {
    private int $id;
    private int $approvisionnement_id;
    private int $produit_id;
    private int $qte_commandee;
    private int $qte_recue;
    private float $cout_unitaire;
 
    public function getId(): ?int
    {
        return $this->id;
    }
}