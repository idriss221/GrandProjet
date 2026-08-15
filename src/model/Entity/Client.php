
<?php
class Client {
    private int $id;
    private string $prenom;
    private string $nom;
    private string $telephone;
    private string $email;
    private float $limite_credit;
 
    public function getId(): ?int
    {
        return $this->id;
    }
}