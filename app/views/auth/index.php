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
                    <h3>Masuk ke akun Anda</h3>
                    <p>Nikmati kemudahan bertransaksi di Solusi Media</p>
                    <div class="page-links">
                        <a href="<?= BASEURL; ?>public" class="active">Masuk</a><a href="<?= BASEURL; ?>auth/register">Daftar</a>
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
                    <form method="POST" action="<?= BASEURL; ?>auth/login">
                        <?php
                        $token = new Token;

                        ?>
                        <input type="hidden" name="token" value="<?php echo $token->get(); ?>" />

                        <input class="form-control" type="text" name="username" placeholder="Username / E-mail" required>
                        <input class="form-control" type="password" name="password" placeholder="Password" required>
                        <div class="form-button">
                            <button id="submit" type="submit" class="ibtn">Masuk</button>
                            <a href="<?= BASEURL; ?>auth/resetpassword">Lupa password?</a>
                        </div>
                    </form>
                    <div class="other-links">
                        <a href="https://solusimedia.com/">Ke halaman utama</a>
                        <!--<span>Or login with</span><a href="#">Facebook</a><a href="#">Google</a><a href="#">Linkedin</a>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>