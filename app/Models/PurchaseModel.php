<?php

namespace App\Models;

use CodeIgniter\Model;

class PurchaseModel extends Model
{
  // Nama Tabel
  protected $table = 'purchase';
  protected $useTimestamps = true;
  protected $allowedFields = ['purchase_id', 'user_id', 'supplier_id'];

  public function getReport()
  {
    return $this->db->table('purchase_detail as sd')
      ->select('s.purchase_id, s.created_at tgl_transaksi, us.id user_id, us.firstname, us.lastname , us.username, sp.supplier_id, sp.name name_supp, sp.email, SUM(sd.total_price) total')
      ->join('purchase s', 'purchase_id')
      ->join('users us', 'us.id = s.user_id')
      ->join('supplier sp', 'supplier_id', 'left')
      ->groupBy('s.purchase_id')
      ->get()->getResultArray();
  }
}
