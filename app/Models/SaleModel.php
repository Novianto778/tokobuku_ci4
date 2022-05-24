<?php

namespace App\Models;

use CodeIgniter\Model;

class SaleModel extends Model
{
  // Nama Tabel
  protected $table = 'sale';
  protected $useTimestamps = true;
  protected $allowedFields = ['sale_id', 'user_id', 'customer_id'];

  public function getReport()
  {
    return $this->db->table('sale_detail as sd')
      ->select('s.sale_id, s.created_at tgl_transaksi, us.id user_id,us.firstname, us.lastname , us.username,c.customer_id,c.name name_cust,c.no_customer,SUM(sd.total_price) total')
      ->join('sale s', 'sale_id')
      ->join('users us', 'us.id = s.user_id')
      ->join('customer c', 'customer_id', 'left')
      ->groupBy('s.sale_id')
      ->get()->getResultArray();
  }

  public function getInvoice($id)
  {
    return $this->db->table('sale_detail as sd')
      ->select('sd.sale_id, s.created_at tgl_transaksi, b.title judul_buku, sd.amount jumlah_buku, b.price harga')
      ->join('sale s', 'sale_id')
      ->join('book b', 'b.book_id = sd.book_id')
      ->where('sd.sale_id', $id)
      ->get()->getResultArray();

    // return $this->db->query('SELECT sd.sale_id, s.created_at tgl_transaksi, b.title judul_buku, sd.amount jumlah_buku, b.price harga FROM sale_detail sd JOIN sale s USING(sale_id) LEFT JOIN book b USING(book_id) WHERE sale_id = ?', $id)->getResultArray();
  }
}
