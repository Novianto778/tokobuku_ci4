<?php

namespace App\Controllers;

use \App\Models\DistributorModel;
use App\Entities\DistributorEntity;

class Distributor extends BaseController
{
  private $distributorModel;
  public function __construct()
  {
    $this->distributorModel = new DistributorModel();
  }

  public function index()
  {
    $dataDistributor = $this->distributorModel->findAll();
    $data = [
      'title' => 'Data Distributor',
      'result' => $dataDistributor
    ];
    return view('Distributor/list', $data);
  }

  public function create()
  {
    $data = [
      'title' => 'Tambah Distributor'
    ];

    return view('distributor/create', $data);
  }

  public function save()
  {
    $distributor = new DistributorEntity();
    $data = [
      "name" => $this->request->getVar('nama'),
      "address" => $this->request->getVar('alamat'),
      "email" => $this->request->getVar('email'),
      "phone" => $this->request->getVar('telp'),
    ];

    $distributor->fill($data);

    $this->distributorModel->save($distributor);
    session()->setFlashdata("msg", "Data berhasil ditambahkan");

    return redirect()->to('/distributor');
  }

  public function edit($id)
  {

    $dataDistributor = $this->distributorModel->where(['distributor_id' => $id])->first();
    // Jika data kosong
    if (empty($dataDistributor)) {
      throw new \CodeIgniter\Exceptions\PageNotFoundException("Distributor dengan ID: $id tidak ditemukan!");
    }
    $data = [
      'title' => 'Ubah Distributor',
      'result' => $dataDistributor
    ];
    return view('distributor/edit', $data);
  }

  public function update($id)
  {
    $distributor = new DistributorEntity();
    $data = [
      "distributor_id" => $id,
      "name" => $this->request->getVar('nama'),
      "address" => $this->request->getVar('alamat'),
      "email" => $this->request->getVar('email'),
      "phone" => $this->request->getVar('telp'),
    ];
    $distributor->fill($data);
    $this->distributorModel->save($distributor);
    session()->setFlashdata("msg", "Data berhasil diperbarui!");
    return redirect()->to('/distributor');
  }

  public function delete($id)
  {
    $this->distributorModel->delete($id);
    session()->setFlashdata("msg", "Data berhasil dihapus!");
    return redirect()->to('/distributor');
  }
}
