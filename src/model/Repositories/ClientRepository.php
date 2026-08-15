<?php

namespace src\model\Repositories;

use src\core\Database;
use src\model\Entity\Client;
use PDO;

class ClientRepository
{
    private PDO $pdo;

    public function __construct()
    {
        $this->pdo = DataBase::getInstance()->getConnection();
    }

    public function getAllClient(): array
    {
        $sql = "
            SELECT
                id,
                prenom,
                nom,
                telephone,
                email,
                limite_credit
            FROM clients
            ORDER BY id DESC
        ";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();

        $clients = [];

        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $clients[] = new Client(
                $row['id'],
                $row['prenom'],
                $row['nom'],
                $row['telephone'] ?? '',
                $row['email'] ?? '',
                $row['limite_credit'] ?? 0
            );
        }

        return $clients;
    }
}