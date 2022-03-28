<?php

namespace App\Controllers;

use \App\Models\BookModel;
use \App\Models\CategoryModel;

class Book extends BaseController
{
  private $bookModel, $catModel;
  public function __construct()
  {
    $this->bookModel = new BookModel();
    $this->catModel = new CategoryModel();
  }

  public function index()
  {
    $dataBook = $this->bookModel->getBook();
    $data = [
      'title' => 'Data Buku',
      'result' => $dataBook
    ];

    return view('book/index', $data);
  }

  public function detail($slug)
  {
    $dataBook = $this->bookModel->getBook($slug);
    $data = [
      'title' => 'Data Buku',
      'result' => $dataBook
    ];

    return view('book/detail', $data);
  }

  public function create()
  {
    session();
    $data = [
      'title' => 'Tambah Buku',
      'category' => $this->catModel->findAll(),
      'validation' => \Config\Services::validation()
    ];
    return view('book/create', $data);
  }

  public function save()
  {
    // Validasi Input
    if (!$this->validate([
      'judul' => [
        'rules' => 'required|is_unique[book.title]',
        'errors' => [
          'required' => '{field} harus diisi',
          'is_unique' => '{field} sudah ada'
        ]
      ],
      'penulis' => 'required',
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
      return redirect()->to('/book/create')->withInput();
    }

    // Mengambi1 File Sampul
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
    $this->bookModel->save([
      'title' => $this->request->getVar('judul'),
      'author' => $this->request->getVar('penulis'),
      'release_year' => $this->request->getVar('tahun'),
      'price' => $this->request->getVar('harga'),
      'discount' => $this->request->getVar('diskon'),
      'stock' => $this->request->getVar('stok'),
      'book_category_id' => $this->request->getVar('id_kategori'),
      'slug' => $slug,
      'cover' => $namaFile
    ]);
    session()->setFlashdata("msg", "Data berhasil ditambahkan!");
    return redirect()->to('/book');
  }

  public function edit($slug)
  {
    $dataBook = $this->bookModel->getBook($slug);
    // Jika data bukunya kosong
    if (empty($dataBook)) {
      throw new \CodeIgniter\Exceptions\PageNotFoundException("Judul buku $slug tidak ditemukan!");
    }

    $data = [
      'title' => 'Ubah Buku',
      'category' => $this->catModel->findAll(),
      'validation' => \Config\Services::validation(),
      'result' => $dataBook
    ];
    return view('book/edit', $data);
  }

  public function update($id)
  {

    // Cek judul
    $dataOld = $this->bookModel->getBook($this->request->getVar('slug'));
    if ($dataOld['title'] == $this->request->getVar('judul')) {
      $rule_judul = 'required';
    } else {
      $rule_judul = 'required|is_unique[book.title]';
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
      'penulis' => 'required',
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
      return redirect()->to('/book/edit/' . $this->request->getVar('slug'))->withInput();
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
    $this->bookModel->save([
      'book_id' => $id,
      'title' => $this->request->getVar('judul'),
      'author' => $this->request->getVar('penulis'),
      'release_year' => $this->request->getVar('tahun'),
      'price' => $this->request->getVar('harga'),
      'discount' => $this->request->getVar('diskon'),
      'stock' => $this->request->getVar('stok'),
      'book_category_id' => $this->request->getVar('id_kategori'),
      'slug' => $slug,
      'cover' => $namaFile
    ]);
    session()->setFlashdata("msg", "Data berhasil diubah!");
    return redirect()->to('/book');
  }

  public function delete($id)
  {
    $dataBook = $this->bookModel->find($id);
    $this->bookModel->delete($id);

    // jika sampulnya default
    if ($dataBook['cover'] != $this->defaultImage) {
      // hapus gambar
      unlink('img/' . $dataBook['cover']);
    }

    session()->setFlashdata("msg", "Data berhasil dihapus!");
    return redirect()->to('/book');
  }
}
