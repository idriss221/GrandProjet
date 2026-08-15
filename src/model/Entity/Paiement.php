<?php
class Paiement {
    private int $id;
    private int $dette_id;
    private float $montant_verse;
    private string $mode_paiement;
 
    public function getId(): ?int
    {
        return $this->id;
    }
}