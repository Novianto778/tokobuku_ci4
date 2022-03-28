<?php

namespace App\Controllers;

class Tugascontainer extends BaseController
{
    public function index()
    {
        $data = [
            'title' => 'Tugas'
        ];
        return view('tugas', $data);
    }
}
