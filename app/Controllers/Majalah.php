<?php

namespace App\Controllers;

use App\Models\MajalahCategoryModel;
use App\Models\MajalahModel;

class Majalah extends BaseController
{

  public function __construct()
  {
    $this->majalahModel = new MajalahModel();
    $this->categoryModel = new MajalahCategoryModel();
  }

  public function index()
  {
    $dataMajalah = $this->majalahModel->getMajalah();
    $data = [
      'title' => "Data Majalah",
      'result' => $dataMajalah
    ];
    return view('majalah/index', $data);
  }

  public function detail($slug)
  {
    $dataMajalah = $this->majalahModel->getMajalah($slug);

    $data = [
      'title' => 'Data Majalah',
      'result' => $dataMajalah
    ];

    return view('majalah/detail', $data);
  }

  public function create()
  {
    $data = [
      'title' => 'Tambah Majalah',
      'category' => $this->categoryModel->findAll(),
      'validation' => \Config\Services::validation()
    ];
    return view('majalah/create', $data);
  }

  public function save()
  {
    // Validasi Input
    if (!$this->validate([
      'judul' => [
        'rules' => 'required|is_unique[majalah.judul]',
        'errors' => [
          'required' => '{field} harus diisi',
          'is_unique' => '{field} sudah ada'
        ]
      ],
      'penerbit' => 'required',
      'tahun' => 'required|integer',
      'harga' => 'required|numeric',
      'diskon' => 'permit_empty|decimal',
      'stok' => 'required|integer',
      'sampul' => [
        'rules' => [
          'uploaded[sampul]',
          'is_image[sampul]',
          'mime_in[sampul,image/jpg,image/jpeg,image/gif,image/png]',
          'max_size[sampul,1024]',
        ],
        'errors' => [
          'max_size' => 'Gambar tidak boleh lebih dari 1MB!',
          'is_image' => 'Yang anda pilih bukan gambar!',
          'mime_in' => 'Yang anda pilih bukan gambar!',
        ]
      ]
    ])) {
      return redirect()->to('/majalah/create')->withInput();
    }

    $fileSampul = $this->request->getFile('sampul');
    if ($fileSampul->getError() == 4) {
      $namaFile = $this->defaultImage;
    } else {
      // Generate Nama file
      $namaFile = $fileSampul->getRandomName();
      // Pindahkan File ke Folder img di public
      $fileSampul->move('img', $namaFile);
    }

    $slug = url_title($this->request->getVar('judul'), '-', true);
    $this->majalahModel->save([
      'judul' => $this->request->getVar('judul'),
      'penerbit' => $this->request->getVar('penerbit'),
      'tahun' => $this->request->getVar('tahun'),
      'harga' => $this->request->getVar('harga'),
      'diskon' => $this->request->getVar('diskon'),
      'stok' => $this->request->getVar('stok'),
      'majalah_category_id' => $this->request->getVar('id_kategori'),
      'slug' => $slug,
      'cover' => $namaFile
    ]);
    session()->setFlashdata("msg", "Data berhasil ditambahkan!");
    return redirect()->to('/majalah');
  }

  public function edit($slug)
  {
    $dataMajalah = $this->majalahModel->getMajalah($slug);
    // Jika data bukunya kosong
    if (empty($dataMajalah)) {
      throw new \CodeIgniter\Exceptions\PageNotFoundException("Judul buku $slug tidak ditemukan!");
    }

    $data = [
      'title' => 'Ubah Majalah',
      'category' => $this->categoryModel->findAll(),
      'validation' => \Config\Services::validation(),
      'result' => $dataMajalah
    ];
    return view('majalah/edit', $data);
  }

  public function update($id)
  {

    // Cek judul
    $dataOld = $this->majalahModel->getMajalah($this->request->getVar('slug'));
    if ($dataOld['judul'] == $this->request->getVar('judul')) {
      $rule_judul = 'required';
    } else {
      $rule_judul = 'required|is_unique[majalah.judul]';
    }
    // Validasi Data
    if (!$this->validate([
      'judul' => [
        'rules' => $rule_judul,
        'errors' => [
          'required' => '{field} harus diisi',
          'is_unique' => '{field} sudah ada'
        ]
      ],
      'penerbit' => 'required',
      'tahun' => 'required|integer',
      'harga' => 'required|numeric',
      'diskon' => 'permit_empty|decimal',
      'stok' => 'required|integer',
      'sampul' => [
        'rules' => [
          'uploaded[sampul]',
          'is_image[sampul]',
          'mime_in[sampul,image/jpg,image/jpeg,image/gif,image/png]',
          'max_size[sampul,1024]',
        ],
        'errors' => [
          'max_size' => 'Gambar tidak boleh lebih dari 1MB!',
          'is_image' => 'Yang anda pilih bukan gambar!',
          'mime_in' => 'Yang anda pilih bukan gambar!',
        ]
      ]
    ])) {
      return redirect()->to('/majalah/edit/' . $this->request->getVar('slug'))->withInput();
    }

    $namaFileLama = $this->request->getVar('sampullama');
    $fileSampul = $this->request->getFIle('sampul');
    // cek gambar apakah masih gambar lama
    if ($fileSampul->getError() == 4) {
      $namaFile = $namaFileLama;
    } else {
      // generate nama file
      $namaFile = $fileSampul->getRandomName();
      // move file ke folder img di public
      $fileSampul->move('img', $namaFile);
      // jika sampulnya default
      if ($namaFileLama != $this->defaultImage && $namaFileLama != "") {
        // hapus gambar
        unlink('img/' . $namaFileLama);
      }
    }
    // Membuat string menjadi huruf kecil semua dan spasinya diganti
    $slug = url_title($this->request->getVar('judul'), '-', true);
    $this->majalahModel->save([
      'majalah_id' => $id,
      'judul' => $this->request->getVar('judul'),
      'penerbit' => $this->request->getVar('penerbit'),
      'tahun' => $this->request->getVar('tahun'),
      'harga' => $this->request->getVar('harga'),
      'diskon' => $this->request->getVar('diskon'),
      'stok' => $this->request->getVar('stok'),
      'majalah_category_id' => $this->request->getVar('id_kategori'),
      'slug' => $slug,
      'cover' => $namaFile
    ]);
    session()->setFlashdata("msg", "Data berhasil diubah!");
    return redirect()->to('/majalah');
  }

  public function delete($id)
  {
    $dataMajalah = $this->majalahModel->find($id);
    $this->majalahModel->delete($id);

    // jika sampulnya default
    if ($dataMajalah['cover'] != $this->defaultImage) {
      // hapus gambar
      unlink('img/' . $dataMajalah['cover']);
    }
    session()->setFlashdata("msg", "Data berhasil dihapus!");
    return redirect()->to('/majalah');
  }
}
