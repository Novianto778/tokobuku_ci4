<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;
use CodeIgniter\I18n\Time;

class DistributorSeeder extends Seeder
{
  public function run()
  {
    $faker = \Faker\Factory::create('id_ID');
    for ($i = 0; $i < 100; $i++) {
      $data = [
        'name' => $faker->name,
        'address' => $faker->address,
        'email' => $faker->email,
        'phone' => $faker->phoneNumber,
        'created_at' => Time::createFromTimestamp($faker->unixTime()),
        'updated_at' => Time::createFromTimestamp($faker->unixTime()),
      ];
      $this->db->table('distributor')->insert($data);
    }
  }
}
