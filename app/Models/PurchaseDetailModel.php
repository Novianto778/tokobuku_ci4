<?php

namespace App\Models;

use CodeIgniter\Model;

class PurchaseDetailModel extends Model
{
  protected $table = 'purchase_detail';
  protected $allowedFields = [
    'purchase_id', 'book_id', 'amount',
    'price', 'total_price'
  ];
}
