<?php
class Dette {
    private int $id;
    private int $commande_id;
    private int $client_id;
    private float $montant_initial;
    private float $montant_paye;
    private string $statut;
 
    public function getId(): ?int
    {
        return $this->id;
    }
}