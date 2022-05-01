<footer class="py-4 bg-light mt-auto">
  <div class="container-fluid px-4">
    <div class="d-flex align-items-center justify-content-between small">
      <div class="text-muted">Copyright &copy; Your Website 2021</div>
      <div>
        <a href="#">Privacy Policy</a>
        &middot;
        <a href="#">Terms &amp; Conditions</a>
      </div>
    </div>
  </div>
</footer>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<?= base_url() ?>/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="<?= base_url() ?>/assets/demo/chart-area-demo.js"></script>
<script src="<?= base_url() ?>/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="<?= base_url() ?>/js/datatables-simple-demo.js"></script>

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
<?php if (!empty($result->css_files)) : ?>
  <?php foreach ($result->js_files as $file) : ?>
    <script src="<?php echo $file; ?>"></script>
  <?php endforeach; ?>
<?php endif ?>
</body>

</html>