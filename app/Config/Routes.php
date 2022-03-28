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
