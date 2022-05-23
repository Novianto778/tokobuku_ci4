<?php

namespace App\Controllers;

use \App\Models\BookModel;
use \App\Models\SupplierModel;
use \App\Models\PurchaseModel;
use \App\Models\PurchaseDetailModel;

class Pembelian extends BaseController
{
  private $book, $cart, $supp, $purchase, $purchaseDetail;
  public function __construct()
  {
    $this->book = new BookModel();
    $this->supp = new SupplierModel();
    $this->purchase = new PurchaseModel();
    $this->purchaseDetail = new PurchaseDetailModel();
    $this->cart = \Config\Services::cart();
  }

  public function index()
  {
    $this->cart->destroy();
    $dataBook = $this->book->getBook();
    $dataSupp = $this->supp->findAll();
    $data = [
      'title' => 'Pembelian ',
      'dataBuku' => $dataBook,
      'dataSupp' => $dataSupp,
    ];
    return view('pembelian/list', $data);
  }

  public function showCart()
  {
    //Fungsi untuk menampilkan Cart
    $output = '';
    $no = 1;
    foreach ($this->cart->contents() as $items) {
      $output .= '
      <tr>
      <td>' . $no++ . '</td>
      <td>' . $items['name'] . '</td>
      <td>' . $items['qty'] . '</td>
      <td>' . number_to_currency($items['price'], 'IDR', 'id_ID', 2) . '</td>
      <td>' . number_to_currency(($items['subtotal']), 'IDR', 'id_ID', 2) . '</td>
      <td>
      <button id="' . $items['rowid'] . '" qty="' . $items['qty'] . '" class="ubah_cart btn btn-warning btn-xs" title="Ubah Jumlah"><i class="fa fa-edit"></i></button>
      <button type="button" id="' . $items['rowid'] . '" class="hapus_cart btn btn-danger btn-xs"><i class="fa fa-trash" title="Hapus"></i></button>
      </td>
      </tr>
    ';
    }
    if (!$this->cart->contents()) {
      $output = '<tr><td colspan="7" align="center">Tidak ada transaksi!</td></tr>';
    }
    return $output;
  }

  public function loadCart()
  {
    echo $this->showCart();
  }

  public function addCart()
  {
    $this->cart->insert(array(
      'id'      => $this->request->getVar('id'),
      'qty'     => $this->request->getVar('qty'),
      'price'   => $this->request->getVar('price'),
      'name'    => $this->request->getVar('name'),
    ));
    echo $this->showCart();
  }

  public function getTotal()
  {
    $totalBayar = 0;
    foreach ($this->cart->contents() as $items) {
      $totalBayar += $items['subtotal'];
    }
    echo number_to_currency($totalBayar, 'IDR', 'id_ID', 2);
  }

  public function updateCart()
  {
    $this->cart->update(array(
      'rowid' => $this->request->getVar('rowid'),
      'qty' => $this->request->getVar('qty')
    ));
    echo $this->showCart();
  }

  public function deleteCart($rowid)
  {
    //fungsi untuk menghapus item cart
    $this->cart->remove($rowid);
    echo $this->showCart();
  }

  public function pembayaran()
  {
    // Mengecek Apakah Ada Transaksi yang dilakukan
    if (!$this->cart->contents()) {
      // Transaksi kosong
      $response = [
        'status' => false,
        'msg' => "Tidak ada transaksi!",
      ];
      echo json_encode($response);
    } else {
      // Ada transaksi
      $totalBayar = 0;
      foreach ($this->cart->contents() as $items) {
        $totalBayar += $items['subtotal'];
      }

      $nominal = $this->request->getVar('nominal');
      $id = "J" . time();

      // Pengecekan apakah nominal yang dimasukkan cukup atau kurang
      if ($nominal < $totalBayar) {
        $response = [
          'status' => false,
          'msg' => "Nominal pembayaran kurang!",
        ];
        echo json_encode($response);
      } else {
        // Jika nominal memenuhi, akan menyimpan data di tabel purchase dan purchase_detail
        $this->purchase->save([
          'purchase_id' => $id,
          'user_id' => user()->id,
          'supplier_id' => $this->request->getVar('id-supp')
        ]);

        foreach ($this->cart->contents() as $items) {
          $this->purchaseDetail->save([
            'purchase_id' => $id,
            'book_id' => $items['id'],
            'amount' => $items['qty'],
            'price' => $items['price'],
            'total_price' => $items['subtotal'],
          ]);

          // Mengurangi jumlah stock di tabel book
          // Kita get buku berdasarkan ID Buku
          $book = $this->book->where(['book_id' => $items['id']])->first();
          $this->book->save([
            'book_id' => $items['id'],
            'stock' => $book['stock'] + $items['qty'],
          ]);
        }

        $this->cart->destroy();
        $kembalian = $nominal - $totalBayar;

        $response = [
          'status' => true,
          'msg' => "Pembayaran berhasil!",
          'data' => [
            'kembalian' => number_to_currency($kembalian, 'IDR', 'id_ID', 2)
          ]
        ];
        echo json_encode($response);
      }
    }
  }
}