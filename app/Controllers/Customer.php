<?php



namespace App\Controllers;

use App\Libraries\GroceryCrud;

class Customer extends BaseController
{
  public function index()
  {
    $crud = new GroceryCrud();
    $crud->setLanguage('Indonesian');

    // mengubah kolom yang ingin ditampilkan dan tidak ditampilkan
    $crud->columns(['name', 'no_customer', 'gender', 'address', 'email', 'phone']);
    $crud->unsetColumns(['created_at', 'updated_at']);

    // mengubah nama kolom
    $crud->displayAs(array(
      'name' => 'Nama',
      'gender' => 'L/P',
      'address' => 'Alamat',
      'phone' => 'Telp',
    ));

    // filter data
    // $crud->where('deleted_at', null);

    $crud->setTable('customer');
    $output = $crud->render();
    $data = [
      'title' => 'Data Customer',
      'result' => $output
    ];
    return view('customer/index', $data);
  }
}
