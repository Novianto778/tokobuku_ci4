<?php

namespace App\Models;

use CodeIgniter\Model;

class PurchaseModel extends Model
{
  // Nama Tabel
  protected $table = 'purchase';
  protected $useTimestamps = true;
  protected $allowedFields = ['purchase_id', 'user_id', 'supplier_id'];
}
