<?php

$db = new Database;
$dbh = $db->connect();
$data_ovo = $data['accountovo'];

// $AndroidDeviceID = rand(111, 999) . 'ff' . rand(111, 999) . '-b7fc-3b' . rand(11, 99) . '-b' . rand(11, 99) . 'd-' . rand(1111, 9999) . 'd2fea8e5';


if (isset($_POST['nomorlog'])) {
    $ovo = new Ovo();
    $deviceid = $ovo->generateUUIDV4();
    $post_nomor = trim(filter($_POST['nomor']));
    $accept = $dbh->prepare("UPDATE ovo SET device = '$deviceid', nomor = '$post_nomor' WHERE id = 'S1'");
    $accept->execute();
    if ($accept->rowCount() > 0) {
        $_SESSION['hasil'] = array('alert' => 'success', 'pesan' => 'Sip, Device ID Berhasil Didapatkan.');
    } else {
        $_SESSION['hasil'] = array('alert' => 'danger', 'pesan' => 'Ups, Gagal! Sistem Kami Sedang Mengalami Gangguan');
    }
}
if (isset($_POST['devicidlog'])) {
    $ovo = new Ovo();
    $accept = json_decode($ovo->login2FA($data_ovo['nomor']), true);

    $refotp = $accept['otp_ref_id'];
    $upd = $dbh->prepare("UPDATE ovo SET otp_token = '$refotp' WHERE id = 'S1'");
    $upd->execute();
    if (isset($accept['otp_ref_id'])) {
        $_SESSION['hasil'] = array('alert' => 'success', 'pesan' => 'Sip, SMS Verifikasi Berhasil Dikirim.');
    } else {
        $_SESSION['hasil'] = array('alert' => 'danger', 'pesan' => $accept['message']);
    }
}
if (isset($_POST['smslog'])) {
    $ovo = new Ovo();
    $ref_otp = $data_ovo['otp_token'];
    $post_sms = trim(filter($_POST['sms']));
    $accept = $dbh->prepare("UPDATE ovo SET kode = '$post_sms' WHERE id = 'S1'");
    $accept->execute();
    $accept = json_decode($ovo->login2FAverify($ref_otp, $post_sms, $data_ovo['nomor']), true);

    if (isset($accept['otp_token'])) {
        $tokenn = $accept['otp_token'];
        $accept2 = $dbh->prepare("UPDATE ovo SET otp_token = '$tokenn' WHERE id = 'S1'");
        $accept2->execute();
        $_SESSION['hasil'] = array('alert' => 'success', 'pesan' => 'Sip, Login Akun OVO Berhasil, Masukan PIN Kamu.');
    } else {
        $_SESSION['hasil'] = array('alert' => 'danger', 'pesan' => 'Ups, Gagal! ' . $accept['message']);
    }
}
if (isset($_POST['pinlog'])) {
    $ovo = new Ovo();
    $post_pin = trim(filter($_POST['pin']));
    $accept = json_decode($ovo->loginSecurityCode($post_pin, $data_ovo['nomor'], $data_ovo['otp_token']), true);

    if ($accept['status'] == 'success') {
        $auth_token = $accept['auth_token'];
        $upd =  $dbh->prepare("UPDATE ovo SET pin = '$post_pin', auth_token = '$auth_token' WHERE id = 'S1'");
        $upd->execute();

        $_SESSION['hasil'] = array('alert' => 'success', 'pesan' => 'Sip, Autentikasi Berhasil.');
    } else {
        $_SESSION['hasil'] = array('alert' => 'danger', 'pesan' => 'Ups, Gagal! ' . $accept['message']);
    }
}
if (isset($_POST['reset'])) {
    $accept = $dbh->prepare("UPDATE ovo SET nomor = '', device = '', kode = '0', pin = '0', token = '' WHERE id = 'S1'");
    $accept->execute();
    if ($accept->rowCount() > 0) {
        $_SESSION['hasil'] = array('alert' => 'success', 'pesan' => 'Sip, Data Berhasil Direset.');
    } else {
        $_SESSION['hasil'] = array('alert' => 'danger', 'pesan' => 'Ups, Gagal! Sistem Kami Sedang Mengalami Gangguan');
    }
}
if (isset($_POST['cek'])) {
    $ovo = new Ovo($data_ovo['auth_token']);
    $acc = json_decode($ovo->transactionHistory(), true);

    if ($acc['status'] == 200) {
        $_SESSION['hasil'] = array('alert' => 'success', 'pesan' => 'Sip, Tidak Ada Error Yang Terdeteksi.');
    } else {
        $_SESSION['hasil'] = array('alert' => 'danger', 'pesan' => $acc['data']);
    }
}
?>
<main>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <h1>Kelola OVO</h1>
                <nav class="breadcrumb-container d-none d-sm-block d-lg-inline-block" aria-label="breadcrumb">

                </nav>
                <div class="separator mb-5"></div>
            </div>
        </div>

        <div class="alert alert-warning   mb-2" role="alert">
            <i class="simple-icon-info"> Ketika sudah login maka deposit OVO sudah otomatis<br>
            </i>
        </div>
        <div class="row">
            <div class="offset-lg-1 col-lg-10 card">
                <div class="kt-portlet card-body">
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">
                                <i class="fa fa-credit-card text-primary"></i>
                                Pengaturan Mutasi OVO
                            </h3>
                        </div>
                    </div>
                    <div class="kt-portlet__body">
                        <?php
                        if (isset($_SESSION['hasil'])) {
                        ?>
                            <div class="alert alert-<?php echo $_SESSION['hasil']['alert'] ?> alert-dismissible" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <?php echo $_SESSION['hasil']['pesan'] ?>
                            </div>
                        <?php
                            unset($_SESSION['hasil']);
                        }
                        ?>
                        <form class="form-horizontal" method="POST">
                            <input type="hidden" name="csrf_token" value="<?php echo $config['csrf_token'] ?>">
                            <div class="row">
                                <div class="form-group col-8">
                                    <label>Nomor OVO</label>
                                    <input type="number" class="form-control" name="nomor" value="<?= $data['accountovo']['nomor'] ?>">
                                </div>
                                <div class="form-group col-4">
                                    <label>&nbsp;</label>
                                    <button type="submit" name="nomorlog" class="btn btn-outline-primary form-control">Get Device ID</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-8">
                                    <label>Android Device ID</label>
                                    <input type="text" class="form-control" name="devicid" value="<?= $data['accountovo']['device'] ?>">
                                </div>
                                <div class="form-group col-4">
                                    <label>&nbsp;</label>
                                    <button type="submit" name="devicidlog" class="btn btn-outline-primary form-control">Kirim Kode</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-8">
                                    <label>Verifikasi SMS</label>
                                    <input type="number" class="form-control" name="sms" value="<?= $data['accountovo']['kode'] ?>">
                                </div>
                                <div class="form-group col-4">
                                    <label>&nbsp;</label>
                                    <button type="submit" name="smslog" class="btn btn-outline-primary form-control">Verifikasi</button>
                                </div>

                                <div class="form-group col-8">
                                    <label>Kode Keamanan (PIN)</label>
                                    <input type="number" class="form-control" name="pin" value="<?= $data['accountovo']['pin'] ?>">
                                </div>
                                <div class="form-group col-4">
                                    <label>&nbsp;</label>
                                    <button type="submit" name="pinlog" class="btn btn-outline-primary form-control">Login</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-6">
                                    <button type="submit" name="reset" class="btn btn-danger form-control">Reset</button>
                                </div>
                                <div class="form-group col-6">
                                    <button type="submit" name="cek" class="btn btn-primary form-control">Cek</button>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-12 mb-4">
                <?php if (isset($_SESSION['hasil'])) : ?>
                    <div class="alert alert-<?= $_SESSION['hasil']['alert']; ?> alert-dismissible fade show  mb-0" role="alert">
                        <?= $_SESSION['hasil']['pesan'] ?>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div><br>
                <?php endif; ?>
                <?php unset($_SESSION['hasil']); ?>
                <!-- <div class="alert alert-warning">
                    <h5>
                        * Klik Kode ID Order untuk melihat detail Orderan!<br>

                    </h5>
                </div> -->
                <div class="card">
                    <div class="card-body">
                        <table class="data-table data-table-feature table-responsive col-12">
                            <thead>
                                <tr>
                                    <th>Tanggal & waktu</th>
                                    <th>Pengguna</th>
                                    <!-- <th>Kode</th> -->
                                    <th>Invoice</th>
                                    <th>Akun</th>
                                    <th>Saldo</th>
                                    <th>Deskripsi</th>
                                    <th>Pengirim</th>
                                    <!-- <th>Status</th> -->

                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($data['mutasiovo'] as $data_layanan) : ?>
                                    <tr>

                                        <td><?php echo $data_layanan['date']; ?></td>
                                        <td><?php echo $data_layanan['user']; ?></td>
                                        <!-- <td><?php echo $data_layanan['code']; ?></td> -->
                                        <td><?php echo $data_layanan['invoice']; ?></td>
                                        <td><span class="badge badge-primary"><?php echo $data_layanan['account']; ?></td>
                                        <td><span class="badge badge-success">Rp <?php echo number_format($data_layanan['amount'], 0, ',', '.'); ?></td>
                                        <td><?php echo $data_layanan['descript']; ?></td>
                                        <td><span class="badge badge-warning"><?php echo $data_layanan['sender']; ?></td>
                                        <!-- <td><label class="btn btn-sm btn-<?php echo $label; ?>"><?php if ($data_layanan['status'] == "unread") { ?>Aktif</i></span><?php } else { ?>Sudah Digunakan</span><?php } ?></label></td> -->
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


</main>