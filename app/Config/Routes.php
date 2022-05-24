<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php')) {
    require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Home::index');
$routes->group('book', function ($r) {
    $r->get('/', 'Book::index');
    $r->get('create', 'Book::create');
    $r->post('create', 'Book::save');
    $r->get('edit/(:any)', 'Book::edit/$1');
    $r->post('edit/(:any)', 'Book::update/$1');
    $r->delete('(:num)', 'Book::delete/$1');
    $r->get('(:any)', 'Book::detail/$1');
});
$routes->group('majalah', function ($r) {
    $r->get('/', 'Majalah::index');
    $r->get('create', 'Majalah::create');
    $r->post('create', 'Majalah::save');
    $r->get('edit/(:any)', 'Majalah::edit/$1');
    $r->post('edit/(:any)', 'Majalah::update/$1');
    $r->delete('(:num)', 'Majalah::delete/$1');
    $r->get('(:any)', 'Majalah::detail/$1');
});
$routes->group('supplier', function ($r) {
    $r->get('/', 'Supplier::index');
    $r->get('create', 'Supplier::create');
    $r->post('create', 'Supplier::save');
    $r->get('edit/(:num)', 'Supplier::edit/$1');
    $r->post('edit/(:num)', 'Supplier::update/$1');
    $r->delete('(:num)', 'Supplier::delete/$1');
});
$routes->group('distributor', function ($r) {
    $r->get('/', 'Distributor::index');
    $r->get('create', 'Distributor::create');
    $r->post('create', 'Distributor::save');
    $r->get('edit/(:num)', 'Distributor::edit/$1');
    $r->post('edit/(:num)', 'Distributor::update/$1');
    $r->delete('(:num)', 'Distributor::delete/$1');
});

$routes->group('users', function ($r) {
    $r->get('/', 'Users::index', ['filter' => 'role:Admin, Owner1, Owner2']);
    $r->get('create', 'Users::create', ['filter' => 'role:Admin, Owner1, Owner2']);
    $r->delete('(:num)', 'Users::delete/$1', ['filter' => 'role:Admin, Owner1, Owner2']);
});

$routes->group('jual', function ($r) {
    $r->get('/', 'Penjualan::index');
    $r->get('load', 'Penjualan::loadCart');
    $r->get('gettotal', 'Penjualan::getTotal');
    $r->post('/', 'Penjualan::addCart');
    $r->post('update', 'Penjualan::updateCart');
    $r->post('bayar', 'Penjualan::pembayaran');
    $r->delete('(:any)', 'Penjualan::deleteCart/$1');
    $r->get('laporan', 'Penjualan::report');
    $r->get('exportpdf', 'Penjualan::exportPDF');
    $r->get('exportexcel', 'Penjualan::exportExcel');
    $r->get('cetakinvoice/(:any)', 'Penjualan::cetakInvoice/$1');
});

$routes->group('beli', function ($r) {
    $r->get('/', 'Pembelian::index');
    $r->get('load', 'Pembelian::loadCart');
    $r->get('gettotal', 'Pembelian::getTotal');
    $r->post('/', 'Pembelian::addCart');
    $r->post('update', 'Pembelian::updateCart');
    $r->post('bayar', 'Pembelian::pembayaran');
    $r->delete('(:any)', 'Pembelian::deleteCart/$1');
    $r->get('laporan', 'Pembelian::report');
    $r->get('exportpdf', 'Pembelian::exportPDF');
    $r->get('exportexcel', 'Pembelian::exportExcel');
});

// $routes->get('/customer/index', 'Customer::index');
$routes->addRedirect('/customer', '/customer/index')->get('/customer/index', 'Customer::index')->setAutoRoute(true);
$routes->addRedirect('/distributorgrocery', '/distributorgrocery/index')->get('/distributorgrocery/index', 'DistributorGrocery::index')->setAutoRoute(true);

// $routes->get('/majalah', 'Majalah::index');
// $routes->get('/majalah/create', 'Majalah::create');
// $routes->post('/majalah/create', 'Majalah::save');
// $routes->get('/majalah/(:any)', 'Majalah::detail/$1');


$routes->get('/coba', function () {
    echo "Hello World";
});
$routes->get('/coba/(:any)/(:num)', 'Home::about/$1/$2');
$routes->addPlaceholder('uuid', '[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}');
$routes->get('coba2/(:uuid)', function ($uuid) {
    echo "UUID: $uuid";
});
$routes->group('adm', function ($r) {
    $r->get('users', 'Admin/Users::index');
    $r->get('master', 'Admin/Master::index');
});
$routes->get("/tugas", "Tugascontainer::index");

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
