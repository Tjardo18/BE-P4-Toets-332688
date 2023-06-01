<?php

class ExamenModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getExamens()
    {
        $sql = "SELECT CONCAT(examinator.voornaam, ' ', examinator.tussenvoegsel, ' ', examinator.achternaam) AS Naam
                        ,examen.Datum
                        ,examen.Rijbewijscategorie
                        ,examen.Rijschool
                        ,examen.Stad
                        ,examen.Uitslag
        FROM examenperexaminator
        INNER JOIN examen ON examen.Id = examenperexaminator.ExamenId
        INNER JOIN examinator on examinator.Id = examenperexaminator.ExaminatorId
        ORDER BY Naam";

        $this->db->query($sql);

        return $this->db->resultSet();
    }
}
