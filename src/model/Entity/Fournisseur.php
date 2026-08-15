
<?php
class Fournisseur {
    private int $id;
    private string $nom;
    private string $telephone;
    private string $adresse;
    private string $email;
 
    public function getId(): ?int
    {
        return $this->id;
    }
}