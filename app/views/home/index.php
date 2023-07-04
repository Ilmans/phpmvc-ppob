<style>
    .error {
        color: red;
        margin-top: 2px;
    }
</style>
<?php

$token = new Token ?>
<main>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="row">
                    <div class="col-lg-6">
                        <!-- Slider -->
                        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="<?= BASEURL; ?>slide/pulsa.jpeg" alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="<?= BASEURL; ?>slide/digital.jpg" alt="Second slide">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                        <!-- Akhir Slider -->
                        <?php if (isset($_SESSION['hasil'])) : ?>
                            <div class="alert alert-<?= $_SESSION['hasil']['alert']; ?> alert-dismissible fade show  mb-3 col-12" role="alert">
                                <?= $_SESSION['hasil']['pesan'] ?>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <?php unset($_SESSION['hasil']); ?>
                        <?php endif; ?>
                        <!-- Saldo -->
                        <div class="col-12 col-lg-12 col-xl-12 card mt-4" style="background: #354da1;border-radius: 10px 10px 0px 0px;">
                            <div class="card-body d-flex justify-content-between align-items-center" style="margin-top:10px">
                                <div class="col-12 col-lg-12 col-xl-12 " style="box-shadow:0 0.5rem 1rem rgb(0 0 0 / 15%) !important;background:white;padding:5px 15px 5px 15px;border-radius:7px">
                                    <a class="sidebar__balance-icon sidebar__balance hide-sidebar">
                                        <strong><a><i class="simple-icon-wallet"></i> <?php echo WEB_NAME; ?> Pay</a></strong><br>
                                        <strong>Rp. <?= number_format($data['user']['saldo_top_up'], 0, ',', '.'); ?></strong>
                                    </a>
                                </div>

                            </div>
                        </div>

                        <nav class="navbar navbar-dark bg-primary navbar-expand" style="border-radius: 0px 0px 10px 10px; height: 80px;">
                            <ul class="navbar-nav nav-justified w-100">

                                <li class="nav-item">
                                    <a data-toggle="modal" data-target="#deposit" title="Deposit" class="nav-link text-center tomboldeposit">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <circle cx="12" cy="12" r="10"></circle>
                                            <line x1="12" y1="8" x2="12" y2="16"></line>
                                            <line x1="8" y1="12" x2="16" y2="12"></line>
                                        </svg>
                                        <span class="small d-block">Isi Saldo</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<?= BASEURL; ?>deposit/kirimsaldo" class="nav-link text-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4M10 17l5-5-5-5M13.8 12H3" />
                                        </svg>
                                        <span class="small d-block">Transfer Saldo</span>
                                    </a>
                                </li>
                                <!--<li class="nav-item">
                                                    <a href="<?= BASEURL; ?>home/tariksaldo" class="nav-link text-center">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 15v4c0 1.1.9 2 2 2h14a2 2 0 0 0 2-2v-4M17 9l-5 5-5-5M12 12.8V2.5"/></svg>
                                                    <span class="small d-block">Tarik Saldo Ke Rekening</span>
                                                    </a>
                                                </li>-->
                            </ul>
                        </nav>
                        <!-- Akhir Saldo -->
                        <!-- iconpesanan -->
                        <div class="col-12 col-lg-12 col-xl-12 card mt-4">
                            <div class="row mt-4">
                                <div class="col-4  mb-4">
                                    <a data-toggle="modal" data-target="#modalSosmed" class="card pesan-sosmed">
                                        <div class="text-center p-2">
                                            <img src="<?= BASEURL; ?>icon/icon/social-media.png" alt="" style="width: auto;height:4rem;margin:auto;">
                                            <p class="card-text mb-0 mt-1">Sosial Media</p>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-4  mb-4">
                                    <a data-toggle="modal" data-target="#modalPulsa" class="card pesan-pulsa" data-jenis="Pulsa" id="pesan-pulsa">
                                        <div class=" text-center p-2">
                                            <img src="<?= BASEURL; ?>icon/icon/pulsa.png" alt="" style="width: auto;height:4rem;margin:auto;">
                                            <p class="card-text mb-0 mt-1">Pulsa Reguler</p>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-4  mb-4">
                                    <a data-toggle="modal" data-target="#modalPulsa" data-jenis="Data" class="card pesan-paket">
                                        <div class="text-center p-2">
                                            <img src="<?= BASEURL; ?>icon/icon/paket-data.png" alt="" style="width: auto;height:4rem;margin:auto;">
                                            <p class="card-text mb-0 mt-1">Paket Internet</p>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-4  mb-4">
                                    <a data-toggle="modal" data-target="#modalPpob" data-jenis="Games" class="card pesan-game">
                                        <div class="text-center p-2">
                                            <img src="<?= BASEURL; ?>icon/icon/game.png" alt="" style="width: auto;height:4rem;margin:auto;">
                                            <p class="card-text mb-0 mt-1">Topup Game</p>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-4  mb-4">
                                    <a data-toggle="modal" data-target="#modalPpob" data-jenis="E-Money" class="card pesan-emoney">
                                        <div class="text-center p-2">
                                            <img src="<?= BASEURL; ?>icon/icon/e-money.png" alt="" style="width: auto;height:4rem;margin:auto;">
                                            <p class="card-text mb-0 mt-1">Emoney</p>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-4  mb-4">
                                    <a data-toggle="modal" data-target="#modalPpob" data-jenis="Voucher" class="card pesan-voucherdigital">
                                        <div class="text-center p-3">
                                            <img src="<?= BASEURL; ?>icon/icon/voucher.svg" alt="" style="width: auto;height:3rem;margin:auto;">
                                            <p class="card-text mb-0 mt-1">Voucher </p>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-4  mb-4">
                                    <a data-toggle="modal" data-target="#modalPpob" data-jenis="PLN" class="card pesan-pln">
                                        <div class="text-center p-2">
                                            <img src="<?= BASEURL; ?>icon/icon/pln.png" alt="" style="width: auto;height:4rem;margin:auto;">
                                            <p class="card-text mb-0 mt-1">Token PLN</p>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-4  mb-4">
                                    <a data-toggle="modal" data-target="#modalPpob" data-jenis="Paket SMS Telpon" class="card pesan-paket-smstlpn">
                                        <div class="text-center p-2">
                                            <img src="<?= BASEURL; ?>icon/icon/sms.png" alt="" style="width: auto;height:4rem;margin:auto;">
                                            <p class="card-text mb-0 mt-1">Paket SMS & Phone</p>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-4  mb-4">
                                    <a href="<?= BASEURL; ?>pascabayar/internet/" data-kategori="internet PASCABAYAR" class="card">
                                        <div class="text-center p-2">
                                            <img src="<?= BASEURL; ?>icon/inetpasca.jpg" alt="" style="width: auto;height:4rem;margin:auto;">
                                            <p class="card-text mb-0 mt-1">Internet Pascabayar</p>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-4  mb-4">
                                    <a href="<?= BASEURL; ?>pascabayar/cekpln/" data-kategori="BPJS PASCABAYAR" class="card">
                                        <div class="text-center p-2">
                                            <img src="<?= BASEURL; ?>icon/plnpascabayar.png" alt="" style="width: auto;height:4rem;margin:auto;">
                                            <p class="card-text mb-0 mt-1">PLN Pascabayar</p>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-4  mb-4">
                                    <a href="<?= BASEURL; ?>pascabayar/bpjs/" data-kategori="BPJS PASCABAYAR" class="card">
                                        <div class="text-center p-2">
                                            <img src="<?= BASEURL; ?>icon/bpjs.png" alt="" style="width: auto;height:3rem;margin:auto;">
                                            <p class="card-text mb-0 mt-1">BPJS Pascabayar</p>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-4  mb-4">
                                    <a href="<?= BASEURL; ?>pascabayar/hp/" data-kategori="internet PASCABAYAR" class="card">
                                        <div class="text-center p-2">
                                            <img src="<?= BASEURL; ?>icon/hp.jpg" alt="" style="width: auto;height:4rem;margin:auto;">
                                            <p class="card-text mb-0 mt-1">HP Pascabayar</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- akhir icon pesanan -->
                        <!-- kategori lain -->
                        <div class="col-12 col-lg-12 col-xl-12 card mt-4">
                            <div class="card-header p-3">
                                <h6 class="slim-card-title">KATEGORI LAINNYA</h6>
                            </div>
                            <div class="row">

                                <div class="col-4  mb-4">
                                    <a class="card" href="#" class="card">
                                        <div class="text-center p-2">
                                            <img src="<?= BASEURL; ?>icon/toko.jpg" alt="" style="width: auto;height:4rem;margin:auto;">
                                            <p class="card-text mb-0 mt-1">Toko Online</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- end kategori lain -->
                    </div>


                    <div class="col-lg-6 col-sm-12 mt-4">
                        <!-- Akhir Transaksi terakhir -->
                        <div class="card  card-table mg-t-20 mg-sm-t-30">
                            <div class="card-header p-3  bg-primary">
                                <h6 class="slim-card-title"> <i class="iconsminds-clock-back"></i> 10 Transaksi Terakhir</h6>
                            </div>
                            <!-- card-header -->
                            <div class="table-responsive">
                                <table class="table mg-b-0 tx-13">
                                    <thead>
                                        <tr>
                                            <th class="pd-y-5">No</th>
                                            <th class="pd-y-5">Via</th>
                                            <th class="pd-y-5">Tanggal</th>
                                            <th class="pd-y-5">Layanan</th>
                                            <th class="pd-y-5">Harga</th>
                                            <th class="pd-y-5">Status</th>

                                        </tr>
                                    </thead>
                                    <tbody>

                                        <?php $no = 1; ?>
                                        <?php foreach ($data['pembelian'] as $pesanan) : ?>
                                            <tr>
                                                <th scope="row"><?= $no ?></th>
                                                <td>
                                                    <div class="badge badge-info"><?= $pesanan['place_from']; ?></div>
                                                </td>
                                                <td><?= tanggal_indo($pesanan['date']) ?></td>
                                                <td><?= $pesanan['layanan']; ?></td>
                                                <td><?= $pesanan['harga']; ?></td>

                                                <?php
                                                $status = $pesanan['status'];
                                                if ($status == 'Success') {
                                                    $alert = 'primary';
                                                } else if ($status == 'Error') {
                                                    $alert = 'danger';
                                                } else {
                                                    $alert = 'warning';
                                                }
                                                ?>
                                                <td>
                                                    <div class="badge badge-<?= $alert; ?>"><?= $status ?></div>
                                                </td>
                                            </tr>
                                            <?php $no++ ?>
                                        <?php endforeach; ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- Akhir Transaksi terakhir -->
                    </div>
                </div>
                <!-- modal pulsa -->
                <div class="modal fade" id="modalPulsa" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title  text-center" id="labelmodalpulsa"></h5>
                                <button type="button" class="close " id="tutupmodalpulsa" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body body-pesanpulsa">
                                <form method="POST" id="formpulsa" action="<?= BASEURL; ?>order/ppob">
                                    <?php
                                    $token = new Token;
                                    ?>
                                    <input type="hidden" name="token" value="<?php echo $token->get(); ?>" />
                                    <div class="form-group">
                                        <label class="mr-10" for="nohp">No Tujuan</label>
                                        <input type="number" name="nohp" class="form-control" name="nohp" id="nohp" placeholder="08xx">
                                        <span class="text-success namaoperator"></span>


                                        <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email
                                    with anyone else.</small> -->
                                    </div>
                                    <select class="custom-select kategoripulsadata" name="tipepulsa" required style="display:none">
                                    </select>
                                    <div class=" form-group text-center layanan">
                                    </div>
                                    <div class="form-group">
                                        <label for="tujuanppob">Pin Keamanan</label>
                                        <input type="number" class="form-control" name="pinpulsa" id="pinpulsa" placeholder="123456" required>
                                    </div>
                            </div>
                            <div class="modal-footer" id="footermodalpulsa">
                                <button type="button" class="btn btn-outline-info mr-5" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-info mr-5" id="buttonsubmit">Pesan</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- modal ppob -->
            <div class="modal fade" id="modalPpob" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title text-center" id="labelmodalPpob">Form order</h5>
                            <button type="button" class="close tutupmodalPpob" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body body-pesanPpob" id="bodypesanppob">
                            <form method="POST" id="formppob" action="<?= BASEURL; ?>order/ppob">

                                <input type="hidden" name="token" value="<?php echo $token->get(); ?>" />
                                <div class="form-group">
                                    <label for="tujuanppob">No Tujuan</label>
                                    <input type="number" name="notujuan" class="form-control" id="tujuanppob" aria-describedby="emailHelp" placeholder="08xx" required>
                                </div>
                                <div class="form-group position-relative kategorippob" style="display: none;">
                                    <label>Kategori</label>
                                    <select class="custom-select optionkategorippob" name="kategorippob" required>
                                        <!-- diisi oleh ajax -->
                                    </select>
                                </div>
                                <div class="form-group position-relative layananppob" style="display: none;">
                                    <label>Kategori</label>
                                    <select class="custom-select optionlayananppob" name="layanan" required>
                                        <!-- diisi oleh ajax -->
                                    </select>
                                </div>
                                <p class="alert alert-secondary deskripsippob" style="display:none"></p>
                                <div class="form-group">
                                    <label for="tujuanppob">Pin Keamanan</label>
                                    <input type="number" class="form-control" name="pin" id="pin" placeholder="123456" required>
                                </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-info mr-5" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-info mr-5" id="buttonpesanppob">Pesan</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal sosial media -->
        <div class="modal fade" id="modalSosmed" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-center" id="labelmodalpulsa">Pesan sosial media</h5>
                        <button type="button" class="close " id="tutupmodalpulsa" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body body-pesansosmed">
                        <form class="form-horizontal" method="POST" id="formsosmed" action="<?= BASEURL; ?>order/sosmed">
                            <div class="form-group row">

                                <input type="hidden" name="token" value="<?php echo $token->get(); ?>" />
                                <label class="col-xl-3 col-lg-3 col-form-label">Kategori</label>
                                <div class="col-lg-12 col-xl-12">
                                    <select class="form-control" id="kategori" name="kategori" required>
                                        <option value="0" selected disabled>Pilih Salah satu</option>
                                        <?php foreach ($data['catsosmed'] as $cat) : ?>
                                            <option value="<?= $cat['kategori']; ?>"><?= $cat['brand']; ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-xl-3 col-lg-3 col-form-label">Layanan</label>
                                <div class="col-lg-12 col-xl-12">
                                    <select class="form-control" name="layanan" id="layanan" required>
                                        <option value="0" selected disabled>Pilih Kategori Dahulu</option>
                                    </select>
                                </div>
                            </div>
                            <div id="catatan"></div>
                            <div class="form-group row">
                                <label class="col-xl-3 col-lg-3 col-form-label">Tujuan</label>
                                <div class="col-lg-12 col-xl-12">
                                    <input type="text" name="target" class="form-control" placeholder="Masukan Link Target" required>
                                </div>
                            </div>
                            <div id="show1">
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Jumlah</label>
                                    <div class="col-lg-12 col-xl-12">
                                        <input type="number" name="jumlah" class="form-control" placeholder="Jumlah" onkeyup="get_total(this.value).value;" required>
                                    </div>
                                </div>
                                <input type="hidden" id="rate" value="0">
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Total Harga</label>
                                    <div class="col-lg-12 col-xl-12">
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text text-primary">Rp</span></div>
                                            <input type="number" name="totalharga" class="form-control" id="total" placeholder="0" readonly>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="show2" style="display: none;">
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Komen</label>
                                    <div class="col-lg-12 col-xl-12">
                                        <textarea class="form-control" name="comments" id="comments" placeholder="Pisahkan Tiap Baris Komentar Dengan Enter"></textarea>
                                    </div>
                                </div>
                                <input type="hidden" id="rate2" value="0">
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Total Harga</label>
                                    <div class="col-lg-12 col-xl-12">
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text text-primary">Rp</span></div>
                                            <input type="number" class="form-control" id="totalxx" placeholder="0" readonly>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-xl-3 col-lg-3 col-form-label">PIN</label>
                                <div class="col-lg-12 col-xl-12">
                                    <div class="input-group">
                                        <div class="input-group-prepend"><span class="input-group-text"><i class="simple-icon-key"></i></span></div>
                                        <input type="password" name="pin" class="form-control" placeholder="Masukkan PIN Kamu" required>
                                    </div>

                                </div>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-info mr-5" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-info mr-5" id="buttonsubmitsosmed">Pesan</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>
</main>



<!-- Modal Deposit -->
<div class="modal bd-example-modal-sm" id="deposit" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content content-deposit">
            <form class=" p-3" id="formdeposit" action="<?= BASEURL; ?>home/inputdeposit" method="POST">
                <div class="modal-body text-center">
                    <img src="<?= BASEURL; ?>img/transaksi-01.png" alt="deposit" class="center">
                    <div class="form-group mt-0">
                        <input type="hidden" name="token" value="<?= $token->get() ?>">
                        <h1 for="nomorHP">Nominal Deposit</h1>
                        <label>Deposit Dengan Bank BCA, OVO, GoPay. Minimal Deposit Rp. 10.000</label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1">Rp</span>
                            </div>
                            <input type="number" name="nominal" class="form-control only__border-bottom" placeholder="" aria-label="" aria-describedby="basic-addon1" id="nominal" autocomplete="off" required autofocus>
                        </div>

                        <div class="input-group">
                            <small class="text-small text-red alert alert-danger  notifdepo" style="display: none;"><a href="<?= BASEURL ?>deposit/riwayatdeposit">kamu masih memiliki deposit pending, Klik disini untuk melihat tagihan Kamu.</a></small>
                            <select class="custom-select" name="metode" id="metodedepo" required>
                                <option value="">Pilih Metode</option>
                                <?php foreach ($data['metodedeposit'] as $metoddepo) : ?>
                                    <option value="<?= $metoddepo['provider']; ?>"><?= $metoddepo['provider']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <!-- <div class="input-group   formpengirim" style="display: none;">
                            <div class="input-group-prepend">
                                <span class="input-group-text border-info border-left-0 border-top-0 pl-0 bg-transparent" id="basic-addon1">No Pengirim</span>
                            </div>
                            <input type="text" name="pengirim" class="form-control only__border-bottom" placeholder="" aria-label="" aria-describedby="basic-addon1" id="pengirim" autocomplete="off" required>
                        </div> -->

                    </div>
                </div>
                <div class="modal-footer tombolfooter">
                    <button type="reset" class="btn btn-danger"> Ulangi</button>
                    <button type="submit" id="submitdepo" class="btn btn-primary" name="tambah"> Lanjutkan</button>
                    <!-- <button type="button" class="btn btn-outline-danger" data-dismiss="modal">
                        Tutup
                    </button>
                    <button type="submit " id="submitdepo" class="btn btn-info pl-4 pr-4 pt-2 pb-2 ml-4">
                        Lanjutkan
                    </button> -->

            </form>
        </div>
    </div>
</div>
</div>
</div>


<script src="<?= BASEURL; ?>js/custom/home.js" type="text/javascript"></script>