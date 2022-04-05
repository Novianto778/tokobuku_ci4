<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Distributor extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'distributor_id' => [
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => true,
                'auto_increment' => true,
            ],
            'name' => [
                'type' => 'VARCHAR',
                'constraint' => '100',
            ],
            'address' => [
                'type' => 'VARCHAR',
                'constraint' => '255',
            ],
            'email' => [
                'type' => 'VARCHAR',
                'constraint' => '20',
            ],
            'phone' => [
                'type' => 'VARCHAR',
                'constraint' => '20',
            ],
            'created_at' => [
                'type' => 'DATETIME',
                'null' => TRUE,
            ],
            'updated_at' => [
                'type' => 'DATETIME',
                'null' => TRUE,
            ],
        ]);
        $this->forge->addKey('distributor_id', true);
        $this->forge->createTable('distributor');
    }

    public function down()
    {
        $this->forge->dropTable('distributor');
    }
}
