<?php



namespace App\Controllers;

use App\Libraries\GroceryCrud;

class DistributorGrocery extends BaseController
{
  public function index()
  {
    $crud = new GroceryCrud();

    $crud->setTable('distributor');
    $output = $crud->render();
    $data = [
      'title' => 'Data Distributor',
      'result' => $output
    ];
    return view('distributor/index', $data);
  }
}
