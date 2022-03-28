<?= $this->extend('layout/template') ?>
<?= $this->section('content') ?>
<main>
  <div class="container-fluid">
    <h1>Container</h1>
    <h6 class="text-center bg-warning py-2 mb-0">Container 1 - Gambar</h6>
    <div class="row g-0">
      <div class="col bg-primary">
        <img class="w-75 mx-auto d-block" src="<?= base_url() ?>/assets/img/logo.png" alt="">
        <p class="text-center">Foto UAJY</p>
      </div>
      <div class="col d-flex flex-column justify-content-between align-items-center bg-secondary">
        <img src="<?= base_url() ?>/assets/img/twibbon.jpg" alt="" width="240" class="d-block">
        <p class="text-center">Foto Diri</p>
      </div>
      <div class="col d-flex flex-column justify-content-between align-items-center bg-success">
        <img src="<?= base_url() ?>/assets/img/gedung.jpg" alt="" width="240" class="d-block">
        <p class="text-center">Foto Gedung</p>
      </div>
    </div>
  </div>
  <div class="container-fluid mt-4">
    <h6 class="text-center bg-success fw-bold mb-0 py-2">Container 2 - Data Diri</h6>
    <div class="row gx-0">
      <div class="col-4 bg-info">
        <h6 class="fs-5 text-center">Biodata</h6>
        <ul type="none">
          <li>Biodata diri 1</li>
          <li>Nama: Novianto</li>
          <li>NPM: 201710963</li>
          <li>ASAL: Lubuklinggau</li>
          <li>TTL Belinyu, 22-11-02</li>
        </ul>
      </div>
      <div class="col-8 px-2 bg-warning">
        <h6 class="fs-5 text-center">
          Pengalaman Saya:
        </h6>
        <p class="text-center">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Culpa omnis similique quibusdam porro aut dicta! Temporibus magnam et amet labore!</p>
      </div>
    </div>
  </div>
</main>
<?= $this->endSection() ?>