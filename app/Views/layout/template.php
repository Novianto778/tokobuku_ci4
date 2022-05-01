<?= $this->include('layout/header') ?>
<?= $this->include('layout/topbar') ?>
<div id="layoutSidenav">
  <?= $this->include('layout/sidebar') ?>
  <div id="layoutSidenav_content">
    <?= $this->renderSection('content') ?>
    <?= $this->include('layout/footer') ?>
    