<?= $this->include('layout/header') ?>
<?= $this->include('layout/topbar') ?>
<div id="layoutSidenav">
  <?= $this->include('layout/sidebar') ?>
  <div id="layoutSidenav_content">
    <?= $this->renderSection('content') ?>
    <?= $this->include('layout/footer') ?>
    <script>
      function previewImage() {
        const sampul = document.querySelector('#sampul');
        const imgPreview = document.querySelector('.img-preview');
        const fileSampul = new FileReader();
        fileSampul.readAsDataURL(sampul.files[0]);
        fileSampul.onload = function(e) {
          imgPreview.src = e.target.result;
        }
      }
    </script>