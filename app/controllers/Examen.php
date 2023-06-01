<?php

class Examen extends BaseController
{
    private $examenModel;

    public function __construct()
    {
        $this->examenModel = $this->model('ExamenModel');
    }

    public function index()
    {
        $result = $this->examenModel->getExamens();

        $rows = "";
        foreach ($result as $examen) {
            $rows .= "<tr>
                        <td>$examen->Naam</td>
                        <td>$examen->Datum</td>
                        <td>$examen->Rijbewijscategorie</td>
                        <td>$examen->Rijschool</td>
                        <td>$examen->Stad</td>
                        <td>$examen->Uitslag</td>
                      </tr>";
        }

        $data = [
            'title' => 'Overzicht Afenomen Examens Examinatoren',
            'rows' => $rows
        ];

        $this->view('examen/examen', $data);
    }
}
