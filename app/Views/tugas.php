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
    <h6 class="text-center bg-success fw-bold mb-0 py-2">Container 2 - Pesan dan Kesan</h6>
    <div class="row gx-0">
      <div class="col-4 bg-info px-4">
        <h6 class="fs-5 text-center">Pengalaman belajar SIWEB</h6>
        <p class="small">Selama belajar SIWEB rasanya aman-aman saja tidak ada kendala yang berarti. Namun untuk materi mulai sulit ketika masuk ke modul Entity</p>
      </div>
      <div class="col-8 px-2 bg-warning">
        <h6 class="fs-5 text-center">
          Pesan dan Kesan Kepada Asdos
        </h6>
        <p class="text-center">Pengalaman saya selama SIWEB lancar tanpa ada kendala jadi jarang bertanya kepada asdos. Asisten juga responsif ketika ditanya. GOOD!</p>
      </div>
    </div>
  </div>
</main>
<?= $this->endSection() ?>