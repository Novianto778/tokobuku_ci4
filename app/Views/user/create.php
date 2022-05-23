<?= $this->extend('layout/template') ?>

<?= $this->section('content') ?>
<main>
  <div class="container-fluid px-4">
    <h1 class="mt-4">DATA USER</h1>
    <ol class="breadcrumb mb-4">
      <li class="breadcrumb-item active">Pengelolaan Data User</li>
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
        <?= view('Myth\Auth\Views\_message_block') ?>

        <form action="<?= route_to('register') ?>" method="post">
          <?= csrf_field() ?>
          <div class="row mb-3">
            <div class="col-md-6">
              <div class="form-floating mb-3 mb-md-0">
                <input class="form-control" id="inputFirstName" type="text" name="firstname" placeholder="Enter your first name" />
                <label for="inputFirstName">First name</label>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-floating">
                <input class="form-control" id="inputLastName" type="text" name="lastname" placeholder="Enter your last name" />
                <label for="inputlastName">Last name</label>
              </div>
            </div>
          </div>

          <div class="form-floating mb-3">
            <input class="form-control <?php if (session('errors.email')) : ?>is-invalid<?php endif ?>" name="email" type="email" placeholder="<?= lang('Auth.email') ?>" value="<?= old('email') ?>" />
            <label for="inputEmail"><?= lang('Auth.email') ?></label>
          </div>

          <div class="form-floating mb-3">
            <input class="form-control <?php if (session('errors.username')) : ?>is-invalid<?php endif ?>" name="username" placeholder="<?= lang('Auth.username') ?>" value="<?= old('username') ?>" />
            <label for="inputEmail"><?= lang('Auth.username') ?></label>
          </div>


          <div class="row mb-3">
            <div class="col-md-6">
              <div class="form-floating mb-3 mb-md-e">
                <input type="password" name="password" class="form-control <?php if (session('errors.password')) : ?>is-invalid<?php endif ?>" placeholder="<?= lang('Auth.password') ?>" autocomplete="off" />
                <label for="inputPassword"><?= lang('Auth.password') ?></ /label>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-floating mb-3 mb-md-e">
                <input type="password" name="pass_confirm" class="form-control <?php if (session('errors.pass_confirm')) : ?>is-invalid<?php endif ?>" placeholder="<? lang('Auth.repeatPassword') ?>" autocomplete="off" />
                <label for="inputPasswordConfirm"><?= lang('Auth.repeatPassword') ?></label>
              </div>
            </div>
          </div>
          <div class="mt-4 mb-0">
            <div class="d-grid">
              <button type="submit" class="btn btn-primary btn-block" href="login.html"><?= lang('Auth.register') ?></button>
            </div>
          </div>
        </form>
      </div>
    </div>
</main>
<?= $this->endSection() ?>