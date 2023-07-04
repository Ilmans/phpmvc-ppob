<div class="form-body">
    <div class="row">
        <div class="form-holder">
            <div class="form-content">
                <div class="form-items">
                    <div class="website-logo-inside">
                        <a href="index.html">
                            <div class="logo">
                                <img class="logo-size" src="images/logo-light.svg" alt="">
                            </div>
                        </a>
                    </div>
                    <h3>Form pendaftaran <?= WEB_NAME ?></h3>
                    <!--<p>Nikmati kemudahan bertransaksi di Solusi Media</p>-->
                    <div class="page-links">
                        <a href="<?= BASEURL; ?>auth">Masuk</a><a href="<?= BASEURL; ?>auth/register" class="active">Daftar</a>
                    </div>
                    <?php
                    if (isset($_SESSION['hasil'])) {
                    ?>
                        <div class="alert alert-warning alert-dismissible fade show " role="alert">
                            <i class="simple-icon-exclamation"></i> <?= $_SESSION['hasil']['pesan']; ?>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    <?php
                        unset($_SESSION['hasil']);
                    }
                    ?>
                    <form method="POST" action="<?= BASEURL; ?>auth/submitreg">
                        <?php
                        $token = new Token;
                        ?>
                        <input type="hidden" name="token" value="<?php echo $token->get(); ?>" />
                        <div class="row">
                            <div class="col-md-6 form-text">
                                <input class="form-control" type="text" name="nama_depan" id="nama_depan" placeholder="Nama Depan" required>
                            </div>
                            <div class="col-md-6 form-text">
                                <input class="form-control" type="text" id="nama_belakang" name="nama_belakang" placeholder="Nama Belakang" required>
                            </div>
                        </div>
                        <input class="form-control" type="text" name="username" id="username" placeholder="Username" required>
                        <input class="form-control" type="email" name="email" id="email" placeholder="E-mail" required>
                        <input class="form-control" type="number" name="no_hp" id="no_hp" placeholder="No Whatsapp Gunakan 62" required>
                        <input class="form-control" type="password" name="password" id="password" placeholder="Password minimal 6 karakter" required>
                        <input type="password" class="form-control" name="konfirmasipassword" id="konfirmasipassword" placeholder="Konfirmasi Password" required>
                        <input type="number" class="form-control" name="pin" id="pin" placeholder="Pin Transaksi (6 digit)" required>
                        <!--<input type="text" class="form-control" name="refferal" id="refferal" placeholder="Kode Referral Jika Ada">-->
                        <div class="form-button">
                            <button id="submit" type="submit" class="ibtn">Daftar</button>
                        </div>
                    </form>
                    <!--<div class="other-links">
                            <span>Or register with</span><a href="#">Facebook</a><a href="#">Google</a><a href="#">Linkedin</a>
                        </div>-->
                </div>
            </div>
        </div>
    </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>