<?php

namespace App\Models;

use CodeIgniter\Model;

class MajalahModel extends Model
{
  protected $table = 'majalah';
  protected $primaryKey = 'majalah_id';
  protected $useTimestamps = true;
  protected $allowedFields = ['judul', 'slug', 'tahun', 'penerbit', 'harga', 'diskon', 'stok', 'cover', 'majalah_category_id'];

  public function getMajalah($slug = false)
  {
    $query = $this->table('majalah')->join('majalah_category', 'majalah_category_id');
    if ($slug == false) {
      return $query->get()->getResultArray();
    }
    return $query->where(['slug' => $slug])->first();
  }
}
