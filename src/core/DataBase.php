<?php

namespace App\Core;

use PDO;
use PDOException;

class Database
{
    private static ?Database $instance = null;

    private PDO $pdo;

    private function __construct()
    {
        try {
            $this->pdo = new PDO(
                "pgsql:host=localhost;port=5432;dbname=gestion_app_dt",
                "postgres",
                "diouf4418"
            );

            $this->pdo->setAttribute(
                PDO::ATTR_ERRMODE,
                PDO::ERRMODE_EXCEPTION
            );

        } catch (PDOException $e) {

            $sqlitePath = dirname(__DIR__, 2) . "/gestion_app_dt";

            $this->pdo = new PDO(
                "sqlite:" . $sqlitePath
            );

            $this->pdo->setAttribute(
                PDO::ATTR_ERRMODE,
                PDO::ERRMODE_EXCEPTION
            );

        }
    }

    public static function getInstance(): Database
    {
        if (self::$instance === null) {
            self::$instance = new Database();
        }

        return self::$instance;
    }

    public function getConnection(): PDO
    {
        return $this->pdo;
    }
}