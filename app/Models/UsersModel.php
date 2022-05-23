<?php

namespace App\Models;

use CodeIgniter\Model;

class UsersModel extends Model
{
  // Nama Tabel
  protected $table = 'users';
  // protected $primaryKey='id';
  protected $useTimestamps;
  protected $useSoftDeletes = true;
  protected $allowedFields = [
    'firstname', 'lastname', 'username', 'email',
    'password_hash', 'active'
  ];
}
