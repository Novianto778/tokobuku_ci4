<?= $this->extend('layout/template') ?>
<?= $this->section('content') ?>
<main>
  <div class="container">
    <h1>Container</h1>
    <p class="text-center bg-warning">Container 1 - Gambar</p>
    <div class="row bg-warning">
      <div class="col bg-primary">
        <img class="w-75 mx-auto d-block" src="<?= base_url() ?>/assets/img/logo.png" alt="">
        <p class="text-center">Logo UAJY</p>
      </div>
      <div class="col">
        <img src="" alt="">
      </div>
      <div class="col">test</div>
    </div>
  </div>

</main>

<?= $this->endSection() ?>