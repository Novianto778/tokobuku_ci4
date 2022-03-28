<?= $this->extend('layout/template') ?>
<?= $this->section('content') ?>
<main>
  <div class="container-fluid px-4">
    <h1 class="mt-4">DATA Majalah</h1>
    <ol class="breadcrumb mb-4">
      <li class="breadcrumb-item active">Pengelolaan Data Majalah</li>
    </ol>
    <!-- start flash data -->
    <?php if (session()->getFlashdata('msg')) : ?>
      <div class="alert alert-success"><?= session()->getFlashdata('msg') ?></div>
    <?php endif; ?>
    <div class="card mb-4">
      <div class="card-header">
        <i class="fas fa-table me-1"></i>
        <?= $title ?>
      </div>
      <div class="card-body">
        <a href="/majalah/create" class="btn btn-primary mb-3" type="button">Tambah Majalah</a>
        <table id="datatablesSimple">
          <thead>
            <tr>
              <th>No</th>
              <th>Cover</th>
              <th>Judul</th>
              <th>Kategori</th>
              <th>Harga</th>
              <th>Stok</th>
            </tr>
          </thead>
          <tbody>
            <?php $no = 1;
            foreach ($result as $value) : ?>
              <tr>
                <td><?= $no++ ?></td>
                <td><img src="/img/<?= $value['cover'] ?>" alt="" width="100"></td>
                <td><?= $value['judul'] ?></td>
                <td><?= $value['majalah_category_id'] ?></td>
                <td><?= $value['harga'] ?></td>
                <td><?= $value['stok'] ?></td>
                <td>
                  <a href="/majalah/<?= $value['slug'] ?>" class="btn btn-primary" role="button">Detail</a>
                  <a href="/majalah/edit/<?= $value['slug'] ?>" class="btn btn-warning" role="button">Ubah</a>
                  <form action="/majalah/<?= $value['majalah_id'] ?>" method="post" class="d-inline">
                    <?= csrf_field() ?>
                    <input type="hidden" name="_method" value="DELETE">
                    <button class="btn btn-danger" type="submit" role="button" onclick="confirm('Apakah anda yakin?')">Hapus</button>
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