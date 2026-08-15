<?php

namespace src\model\Repository;

use src\core\DataBase;
use src\model\Entity\Produit;
use PDO;

class ProduitRepository
{
    private PDO $pdo;

    public function __construct()
    {
        $this->pdo = Database::getInstance()->getConnection();
    }

    public function getAllProduit(): array
    {
        $sql = "
            SELECT
                id,
                nom,
                prix_unitaire,
                quantite_stock
            FROM produits
            ORDER BY id DESC
        ";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();

        $produits = [];

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $produits[] = new Produit(
                $row['id'],
                $row['nom'],
                $row['prix_unitaire'] ?? 0,
                $row['quantite_stock'] ?? 0
            );
        }

        return $produits;
    }
}