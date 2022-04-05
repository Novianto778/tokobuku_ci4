<?= $this->extend('layout/template') ?>
<?= $this->section('content') ?>
<main>
  <div class="container-fluid px-4">
    <h1 class="mt-4">DATA Distributor</h1>
    <ol class="breadcrumb mb-4">
      | <li class="breadcrumb-item active">Pengelolaan Data Distributor</li>
    </ol>
    <div class="card mb-4">
      <div class="card-header">
        <i class="fas fa-table me-1"></i>
        <?= $title ?>
      </div>
      <div class="card-body">
        <!-- Form Ubah Data -->
        <!-- -->
        <form action="/distributor/edit/<?= $result->distributor_id ?>" method="POST">
          <?= csrf_field() ?>
          <div class="mb-3 row">
            <label for="nama" class="col-sm-2 col-for m-label">Nama</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="nama" value="<?= $result->name ?>">
            </div>
          </div>
          <div class="mb-3 row">
            <label for="alamat" class="col-sm-2 col-form-label">Alamat</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="alamat" value="<?= $result->address ?>">
            </div>
          </div>
          <div class="mb-3 row">
            <label for="email" class="col-sm-2 col-form-label">Email</label>
            <div class="col-sm-5">
              <input type="text" class="form-control" name="email" value="<?= $result->email ?>">
            </div>
            <label for="telp" class="col-sm-2 col-form-label">Telepon</label>
            <div class="col-sm-3">
              <input type="text" class="form-control" name="telp" value="<?= $result->phone ?>">
            </div>
          </div>
          <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <button class="btn btn-primary me-md-2" type="submit">Simpan</button>
            <button class="btn btn-danger" type="reset" onclick="return window.location = '/distributor'">Batal</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</main>
<?= $this->endSection() ?>