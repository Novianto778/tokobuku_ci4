<?= $this->extend('layout/template') ?>

<?= $this->section('content') ?>
<main>
  <div class="container-fluid px-4">
    <h1 class="mt-4">DATA Distributor</h1>
    <ol class="breadcrumb mb-4">
      <li class="breadcrumb-item active">Pengelolaan Data Distributor</li>

    </ol>
    <?php if (session()->getFlashdata('msg')) : ?>
      <div class="alert alert-success"><?= session()->getFlashdata('msg') ?></div>
    <?php endif; ?>
    <div class="card mb-4">
      <div class="card-header">
        <i class="fas fa-table me-1"></i>
        <?= $title ?>
      </div>
      <div class="card-body">
        <a href="/distributor/create" class="btn btn-primary mb-3" type="button">Tambah Distributor</a>
        <table id="datatablesSimple">
          <thead>
            <tr>
              <th>No</th>
              <th>Nama</th>
              <th>Alamat</th>
              <th>Email</th>
              <th>Telp</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>
            <?php $no = 1;
            foreach ($result as $value) : ?>
              <tr>
                <td><?= $no++ ?></td>
                <td><?= $value->name ?></td>
                <td><?= $value->address ?></td>
                <td><?= $value->email ?></td>
                <td><?= $value->phone ?></td>
                <td>
                  <a href="/distributor/edit/<?= $value->distributor_id ?>" class="btn btn-warning" role="button">Ubah</a>
                  <form action="/distributor/<?= $value->distributor_id ?>" method="post" class="d-inline">
                    <?= csrf_field() ?>
                    <input type="hidden" name="_method" value="DELETE">
                    <button class="btn btn-danger" type="submit" role="button" onclick="return confirm('Apakah anda yakin?')">Hapus</button>
                  </form>
                </td>
              </tr>
            <?php endforeach; ?>

          </tbody>
        </table>
      </div>
    </div>
  </div>
</main>
<?= $this->endSection() ?>