<?php
class Commande {
    private int $id;
    private int $client_id;
    private int $utilisateur_id;
    private float $montant_total;
    private float $montant_verse;
    private string $mode_reglement;
    private string $statut;
 
    public function getId(): ?int
    {
        return $this->id;
    }
}