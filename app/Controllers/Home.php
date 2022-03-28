<?php

namespace App\Controllers;

class Home extends BaseController
{
    public function index()
    {
        $data = [
            'title' => 'Dashboard'
        ];
        return view('admin/overview', $data);
    }

    public function about($nama = null, $umur = 0)
    {
        echo "Hi, nama saya adalah $nama. Usia saya $umur tahun.";
    }
}
