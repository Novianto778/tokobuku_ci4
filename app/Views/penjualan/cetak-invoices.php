<!DOCTYPE html>
<html lang="en">

<head>
  <style>
    .title {
      text-align: center;
      font-family: Arial, Helvetica, sans-serif;
    }

    .left {
      text-align: left;
    }

    .right {
      text-align: right;
    }

    .border-table {
      font-family: Arial, Helvetica, sans-serif;
      border-collapse: collapse;
      width: 100%;
      text-align: center;
      font-size: 12px;
    }

    .border-table th {
      border: 1px solid #000;
      background-color: #e1e3e9;
      font-weight: bold;
    }

    .border-table td {
      border: 1px solid #000;
    }
  </style>
</head>

<body>
  <main>
    <div class="title">
      <h1>INVOICES PENJUALAN</h1>
    </div>
    <div>
      <table class="border-table">
        <thead>
          <tr>
            <th width="5%">No</th>
            <th width="15%">Nota</th>
            <th width="20%">Tanggal Transaksi</th>
            <th width="15%">Judul Buku</th>
            <th width="10%">Jumlah Buku</th>
            <th width="15%">Harga</th>
            <th width="20%">Total Harga</th>
          </tr>
        </thead>
        <tbody>
          <?php $no = 1;
          foreach ($result as $value) : ?>
            <tr>
              <td width="5%"><?= $no++ ?></td>
              <td width="15%"><?= $value['sale_id'] ?></td>
              <td width="20%">
                <?= date("d/m/Y H:i:s", strtotime($value['tgl_transaksi'])) ?>
              </td>
              <td width="15%" class="center"><?= $value['judul_buku'] ?></td>
              <td width="10%" class="center"><?= $value['jumlah_buku'] ?></td>
              <td width="15%" class="right"><?= number_to_currency($value['harga'], 'IDR', 'id_ID', 2) ?></td>
              <td width="20%" class="right">
                <?= number_to_currency(($value['jumlah_buku'] * $value["harga"]), 'IDR', 'id_ID', 2) ?>
              </td>
            </tr>
          <?php endforeach; ?>
        </tbody>

      </table>

    </div>
  </main>
</body>

</html>