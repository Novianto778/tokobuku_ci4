<?= $this->extend('layout/template') ?>
<?= $this->section('content') ?>
<main>
  <div class="container-fluid px-4">
    <h1 class="mt-4">LAPORAN PENJUALAN</h1>
    <ol class="breadcrumb mb-4">
      <li class="breadcrumb-item active">Laporan Penjualan</li>
    </ol>
    <div class="card mb-4">
      <div class="card-header">
        <iclass="fas fa-table me-1"></i>
          <?= $title ?>
      </div>
      <div class="card-body">
        <!-- Isi Report -->
        <a target="_blank" href="/jual/exportpdf" class="btn btn-primary mb-3">Export PDF</a>
        <a target="_blank" href="/jual/exportexcel" class="btn btn-dark mb-3">Export Excel</a>
        <table id="datatablesSimple">
          <thead>
            <tr>
              <th>No</th>
              <th>Nota</th>
              <th>Tanggal Transaksi</th>
              <th>User</th>
              <th>Customer</th>
              <th>Total</th>
            </tr>
          </thead>
          <tbody>
            <?php $no = 1;
            foreach ($result as $value) : ?>
              <tr>
                <td><?= $no++ ?></td>
                <td><?= $value['sale_id'] ?></td>
                <td><?= date("d/m/Y H:i:s", strtotime($value['tgl_transaksi'])) ?></td>
                <td><?= $value['firstname'] ?> <?= $value['lastname'] ?></td>
                <td><?= $value['name_cust'] ?></td>
                <td><?= number_to_currency($value['total'], "IDR", 'id_ID', 2) ?></td>
                <td><a class="btn btn-danger" href="/jual/cetakinvoice/<?= $value['sale_id'] ?>">Cetak</a></td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>
        <!-- -->
      </div>
    </div>
  </div>
</main>
<?= $this->endSection() ?>