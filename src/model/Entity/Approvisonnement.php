
<?php
class Approvisionnement {
    private int $id;
    private int $fournisseur_id;
    private string $ref_bl;
    private float $montant_total;
    private float $montant_paye;
    private string $statut;
 
    public function getId(): ?int
    {
        return $this->id;
    }
}