<?php

namespace src\model\Repository;

use src\core\DataBase;
use src\model\Entity\Fournisseur;
use PDO;

class FournisseurRepository
{
    private PDO $pdo;

    public function __construct()
    {
        $this->pdo = Database::getInstance()->getConnection();
    }

    public function getAllFournisseur(): array
    {
        $sql = "
            SELECT
                id,
                nom,
                email,
                telephone,
                adresse
            FROM fournisseurs
            ORDER BY id DESC
        ";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();

        $fournisseurs = [];

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $fournisseurs[] = new Fournisseur(
                $row['id'],
                $row['nom'],
                $row['email'] ?? '',
                $row['telephone'] ?? '',
                $row['adresse'] ?? ''
            );
        }

        return $fournisseurs;
    }
}