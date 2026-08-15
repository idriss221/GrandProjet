
<?php
class Utilisateur {
    private int $id;
    private string $nom;
    private string $email;
    private string $mot_de_passe;
    private string $role;
 
    public function getId(): ?int
    {
        return $this->id;
    }
}