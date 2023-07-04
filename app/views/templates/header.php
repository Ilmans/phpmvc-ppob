<?php
$dbh = new Database;
$db = $dbh->connect();
$cek_berita = $db->prepare("SELECT * FROM berita  ORDER BY id DESC");
$cek_berita->execute();
$cek_berita = $cek_berita->fetchAll();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <meta charset="utf-8">
    <title><?= WEB_NAME; ?> - SMM PANEL DAN SUPLIER PULSA MURAH</title>
    <link rel="icon" href="<?= BASEURL; ?>assets/icons/favicon-16x16.png" type="image/png" sizes="16x16">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="Ilman sunanuddin">
    <!-- -->
    <link rel="apple-touch-icon" sizes="57x57" href="<?= BASEURL; ?>assets/icon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="<?= BASEURL; ?>assets/icon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="<?= BASEURL; ?>assets/icon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="<?= BASEURL; ?>assets/icon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="<?= BASEURL; ?>assets/icon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="<?= BASEURL; ?>assets/icon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="<?= BASEURL; ?>assets/icon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="<?= BASEURL; ?>assets/icon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="<?= BASEURL; ?>assets/icon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="<?= BASEURL; ?>assets/icon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="<?= BASEURL; ?>assets/icon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="<?= BASEURL; ?>assets/icon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="<?= BASEURL; ?>assets/icon/favicon-16x16.png">
    <link rel="manifest" href="<?= BASEURL; ?>assets/icon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="<?= BASEURL; ?>assets/icon/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!-- SEO Meta description -->
    <meta name="description" content="<?= WEB_NAME; ?> adalah platForm Digital Solutions Penyedia layanan sosial media Booster,Pulsa,Voucher Game,Token Listrik,dan Produk-Produk Digital Murah lainya.">
    <meta name="keywords" content="<?= WEB_NAME; ?> adalah platForm Digital Solutions Penyedia layanan sosial media Booster,Pulsa,Voucher Game,Token Listrik,dan Produk-Produk Digital Murah lainya.">
    <link rel="stylesheet" href="<?= BASEURL; ?>css/main.css" />
    <script src="<?= BASEURL; ?>js/vendor/jquery-3-5-1.js" type="text/javascript"></script>
    <link rel="stylesheet" href="<?= BASEURL; ?>font/iconsmind-s/css/iconsminds.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>font/simple-line-icons/css/simple-line-icons.css" />
    <!-- OG Meta Tags to improve the way the post looks when you share the page on LinkedIn, Facebook, Google+ -->

    <meta property="og:title" content="<?= WEB_NAME; ?> - SMM PANEL DAN SUPLIER PULSA MURAH"> <!-- title shown in the actual shared post -->
    <meta property="og:description" content="<?= WEB_NAME; ?> adalah platForm Digital Solutions Penyedia layanan sosial media Booster,Pulsa,Voucher Game,Token Listrik,dan Produk-Produk Digital Murah lainya"> <!-- description shown in the actual shared post -->
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/bootstrap.min.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/bootstrap.rtl.only.min.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/component-custom-switch.min.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/perfect-scrollbar.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/fullcalendar.min.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/datatables.responsive.bootstrap4.min.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/select2.min.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/perfect-scrollbar.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/glide.core.min.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/bootstrap-stars.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/nouislider.min.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/bootstrap-datepicker3.min.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/dore.light.bluenavy.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/select2.min.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/select2-bootstrap.min.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/bootstrap-datepicker3.min.css" />
    <link rel="stylesheet" href="<?= BASEURL; ?>css/vendor/bootstrap-tagsinput.css" />
    <style>
        /* toolbar bottom */
        .toolbar-bottom {
            background: #fff;
            box-shadow: 0 -3px 13px rgba(15, 15, 15, 0.18);
        }

        .toolbar-bottom .tab-link {
            text-transform: unset;
            font-size: 11px;
        }

        .toolbar-bottom .tab-link i {
            font-size: 18px;
            line-height: 26px;
        }

        .toolbar-bottom .tab-link-active {
            color: #9831e0;
        }

        .toolbar-bottom .tab-link-active i {
            color: #9831e0;
        }

        .toolbar-bottom .toolbar-inner .tab-link-highlight {
            background: transparent;
        }

        .toolbar-bottom::after {
            background: transparent;
        }
    </style>

    <script>
        var url = '<?= BASEURL ?>'
    </script>
</head>

<body id="app-container" class="menu-default show-spinner">

    <nav class="navbar fixed-top ">
        <div class="d-flex align-items-center navbar-left  ">
            <a href="#" class="menu-button d-none d-md-block">
                <svg class="main" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 9 17">
                    <rect x="0.48" y="0.5" width="7" height="1" />
                    <rect x="0.48" y="7.5" width="7" height="1" />
                    <rect x="0.48" y="15.5" width="7" height="1" />
                </svg>
                <svg class="sub" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 18 17">
                    <rect x="1.56" y="0.5" width="16" height="1" />
                    <rect x="1.56" y="7.5" width="16" height="1" />
                    <rect x="1.56" y="15.5" width="16" height="1" />
                </svg>
            </a>

            <a href="#" class="menu-button-mobile d-xs-block d-sm-block d-md-none">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 26 17">
                    <rect x="0.5" y="0.5" width="25" height="1" />
                    <rect x="0.5" y="7.5" width="25" height="1" />
                    <rect x="0.5" y="15.5" width="25" height="1" />
                </svg>
            </a>
        </div>


        <a class="navbar-logo" href="#">
            <h3 class="text-primary"><?= WEB_NAME; ?></h3>
        </a>

        <div class="navbar-right">
            <div class="header-icons d-inline-block align-middle">
                <!-- <div class="d-none d-md-inline-block align-text-bottom mr-3">
                    <div class="custom-switch custom-switch-primary-inverse custom-switch-small pl-1" data-toggle="tooltip" data-placement="left" title="Dark Mode">
                        <input class="custom-switch-input" id="switchDark" type="checkbox" checked>
                        <label class="custom-switch-btn" for="switchDark"></label>
                    </div>
                </div> -->



                <div class="position-relative d-inline-block">
                    <button class="header-icon btn btn-empty buttonberita" type="button" id="notificationButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-bell"></i>
                        <?php if ($data['user']['read_news']  == 1) : ?>
                            <span class="count adaberita">!</span>
                        <?php endif; ?>


                    </button>
                    <script>
                        $('.buttonberita').on('click', function() {
                            $.ajax({
                                url: url.concat('berita/bacaberita'),
                                type: 'get',
                                dataType: 'text',
                                success: function(hasil) {
                                    if (hasil == 'success') {
                                        $('.adaberita').attr('style', 'display:none;');
                                    }
                                }
                            })
                        })
                    </script>
                    <div class="dropdown-menu dropdown-menu-right mt-3 position-absolute" id="notificationDropdown">
                        <div class="scroll">

                            <?php foreach ($cek_berita as $berita) : ?>
                                <!-- tipe berita -->
                                <?php
                                $tipeberita = $berita['tipe'];
                                if ($tipeberita == 'INFO') {
                                    $alert = 'info';
                                } else if ($tipeberita == 'PENTING') {
                                    $alert = 'danger';
                                } else {
                                    $alert = 'warning';
                                }
                                ?>

                                <!-- ---------- -->
                                <!-- Icon berita -->
                                <?php
                                $iconberita = $berita['icon'];
                                if ($iconberita == 'PENGGUNA') {
                                    $imgberita = 'simple-icon-people';
                                } else if ($iconberita == 'LAYANAN') {
                                    $imgberita = 'iconsminds-gears';
                                } else if ($iconberita == 'PROMO') {
                                    $imgberita = 'iconsminds-refinery';
                                } else {
                                    $imgberita = 'umum.jpg';
                                }
                                ?>
                                <!--  -->
                                <div class="d-flex flex-row mb-3 pb-3 border-bottom">

                                    <i class="<?= $imgberita; ?>  "></i>

                                    <div class="pl-3">
                                        <a href="<?= BASEURL; ?>berita/index/<?= $berita['id']; ?>">
                                            <p class="font-weight-medium mb-1 text-<?= $alert ?>"><?= $berita['title']; ?> <i class="simple-icon-eye text-right"></i></p>
                                            <p><?= $berita['konten']; ?></p>
                                            <p class="text-muted mb-0 text-small"><?= $berita['date']; ?> - <?= $berita['time']; ?></p>
                                        </a>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        </div>
                        <a href="<?= BASEURL; ?>berita">
                            <div class="bg-primary shadow rounded text-center" style="width: 100;">
                                <p><i class="simple-icon-eye">
                                        Lihat Semua
                                    </i></p>

                            </div>
                        </a>
                    </div>
                </div>

                <!-- <button class="header-icon btn btn-empty d-none d-sm-inline-block" type="button" id="fullScreenButton">
                    <i class="simple-icon-size-fullscreen"></i>
                    <i class="simple-icon-size-actual"></i>
                </button> -->

            </div>

            <div class="user d-inline-block">
                <button class="btn btn-empty p-0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="name text-dark"><?= $data['user']['nama_depan'] . ' ' . $data['user']['nama_belakang']; ?></span>
                    <span>
                        <img alt="Profile Picture" src="<?= BASEURL; ?>img/profiles/avatar.jpg" />
                    </span>
                </button>

                <div class="dropdown-menu dropdown-menu-right mt-3">
                    <a class="dropdown-item" href="<?= BASEURL; ?>akun"">Pengaturan Akun</a>
                    <a class=" dropdown-item" href="<?= BASEURL; ?>akun/mutasi">Mutasi saldo</a>
                    <a class=" dropdown-item" href="<?= BASEURL; ?>akun/aktifitas">Riwayat Aktifitas</a>
                    <a class="dropdown-item" href="<?= BASEURL; ?>auth/logout">keluar</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Bottom Navbar -->
    <nav class="navbar navbar-dark bg-primary navbar-expand fixed-bottom d-md-none d-lg-none d-xl-none p-0">
        <ul class="navbar-nav nav-justified w-100">
            <li class="nav-item">
                <a href="<?= BASEURL; ?>" class="nav-link text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                        <polyline points="9 22 9 12 15 12 15 22"></polyline>
                    </svg>
                    <span class="small d-block">Beranda</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="<?= BASEURL; ?>riwayat" class="nav-link text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"></circle>
                        <polyline points="12 6 12 12 16 14"></polyline>
                    </svg>
                    <span class="small d-block">Riwayat</span>
                </a>
                <!-- Dropup menu for history -->
                <!--<div class="dropdown-menu" aria-labelledby="dropdownMenuProfile">
                <a class="dropdown-item" href="<?= BASEURL; ?>deposit/riwayatdeposit">Riwayat Deposit</a>
                <a class="dropdown-item" href="<?= BASEURL; ?>riwayat">Riwayat Transaksi</a>
            </div>-->
            </li>
            <li class="nav-item">
                <a href="<?= BASEURL; ?>deposit/kirimsaldo" class="nav-link text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4M10 17l5-5-5-5M13.8 12H3" />
                    </svg>
                    <span class="small d-block">Transfer</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="<?= BASEURL; ?>berita" class="nav-link text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M22 17H2a3 3 0 0 0 3-3V9a7 7 0 0 1 14 0v5a3 3 0 0 0 3 3zm-8.27 4a2 2 0 0 1-3.46 0"></path>
                    </svg>
                    <span class="small d-block">Notifikasi</span>
                </a>
            </li>
            <li class="nav-item dropup">
                <a href="#" class="nav-link text-center" role="button" id="dropdownMenuProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M5.52 19c.64-2.2 1.84-3 3.22-3h6.52c1.38 0 2.58.8 3.22 3" />
                        <circle cx="12" cy="10" r="3" />
                        <circle cx="12" cy="12" r="10" />
                    </svg>
                    <span class="small d-block">Akun</span>
                </a>
                <!-- Dropup menu for history -->
                <div class="dropdown-menu dropdown-menu-right mt-3">
                    <a class="dropdown-item" href="<?= BASEURL; ?>akun"">Pengaturan Akun</a>
                    <a class=" dropdown-item" href="<?= BASEURL; ?>akun/mutasi">Mutasi saldo</a>
                    <a class=" dropdown-item" href="<?= BASEURL; ?>akun/aktifitas">Riwayat Aktifitas</a>
                    <a class="dropdown-item" href="<?= BASEURL; ?>auth/logout">keluar</a>
                </div>
            </li>
        </ul>
    </nav>

    <div class="menu">
        <div class="main-menu">
            <div class="scroll">
                <ul class="list-unstyled">

                    <?php if ($data['user']['level'] == "Developers") { ?>
                        <li>
                            <a href="#beranda">
                                <i class="fa fa-home"></i>
                                <span>Beranda</span>
                            </a>
                        </li>
                    <?php } else { ?>
                        <li>
                            <a href="<?= BASEURL; ?>">
                                <i class="fa fa-home"></i>
                                <span>Beranda</span>
                            </a>
                        </li>
                    <?php } ?>
                    <li>
                        <a href="#app">
                            <i class="fa fa-bars"></i> Fitur
                        </a>
                    </li>
                    <li>
                        <a href="#halaman">
                            <i class="fa fa-question-circle"></i> Info
                        </a>
                    </li>
                    <li>
                        <a href="<?= BASEURL; ?>doc">
                            <i class="fa fa-key"></i> Api Doc
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="sub-menu">
            <div class="scroll">
                <ul class="list-unstyled" data-link="beranda" id="beranda">
                    <li>
                        <a href="#" data-toggle="collapse" data-target="#collapseAuthorization" aria-expanded="true" aria-controls="collapseAuthorization" class="rotate-arrow-icon opacity-50">
                            <i class="simple-icon-arrow-down"></i> <span class="d-inline-block"> Dashboard</span>
                        </a>
                        <div id="collapseAuthorization" class="collapse show">
                            <ul class="list-unstyled inner-level-menu">
                                <li>
                                    <a href="<?= BASEURL; ?>home">
                                        <i class="iconsminds-shopping-cart"></i> <span class="d-inline-block"> Member</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="<?= BASEURL; ?>admin">
                                        <i class="simple-icon-wallet"></i> <span class="d-inline-block"> Admin</span>
                                    </a>
                                </li>

                            </ul>
                        </div>
                    </li>

                </ul>
                <ul class="list-unstyled" data-link="app" id="app">
                    <li>
                        <a href="#" data-toggle="collapse" data-target="#collapseAuthorization" aria-expanded="true" aria-controls="collapseAuthorization" class="rotate-arrow-icon opacity-50">
                            <i class="simple-icon-arrow-down"></i> <span class="d-inline-block"> Riwayat</span>
                        </a>
                        <div id="collapseAuthorization" class="collapse show">
                            <ul class="list-unstyled inner-level-menu">
                                <li>
                                    <a href="<?= BASEURL; ?>riwayat">
                                        <i class="iconsminds-shopping-cart"></i> <span class="d-inline-block"> Pembelian</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="<?= BASEURL; ?>deposit/riwayatdeposit">
                                        <i class="simple-icon-wallet"></i> <span class="d-inline-block"> Deposit</span>
                                    </a>
                                </li>

                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="#" data-toggle="collapse" data-target="#saldo" aria-expanded="true" aria-controls="saldo" class="rotate-arrow-icon opacity-50">
                            <i class="simple-icon-arrow-down"></i> <span class="d-inline-block">Saldo</span>
                        </a>
                        <div id="saldo" class="collapse show">
                            <ul class="list-unstyled inner-level-menu">

                                <!--<li>-->
                                <!--    <a href="<?= BASEURL; ?>deposit/voucher">-->
                                <!--        <i class="simple-icon-tag"></i> <span class="d-inline-block">Redem Voucher</span>-->
                                <!--    </a>-->
                                <!--</li>-->
                                <li>
                                    <a href="<?= BASEURL; ?>deposit/kirimsaldo">
                                        <i class="iconsminds-handshake"></i> <span class="d-inline-block">kirimsaldo</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
                <ul class="list-unstyled" data-link="halaman">
                    <li>
                        <a href="<?= BASEURL; ?>halaman/faq/">
                            <i class="simple-icon-question"></i> <span class="d-inline-block">Pertanyaan Umum</span>
                        </a>
                    </li>
                    <li>
                        <a href="<?= BASEURL; ?>halaman/tos/">
                            <i class="iconsminds-gears"></i> <span class="d-inline-block">Ketentuan Layanan</span>
                        </a>
                    </li>
                    <li>
                        <a href="<?= BASEURL; ?>halaman/cara/">
                            <i class="iconsminds-gears"></i> <span class="d-inline-block">Cara Penggunaan</span>
                        </a>
                    </li>
                    <li>
                        <a href="<?= BASEURL; ?>halaman/daftarharga/">
                            <i class="iconsminds-pricing"></i> <span class="d-inline-block">Daftar Harga</span>
                        </a>
                    </li>
                    <!--<li>-->
                    <!--<a href="Apps.Chat.html">-->
                    <!--<i class="simple-icon-bubbles"></i> <span class="d-inline-block">Chat</span>-->
                    <!--</a>-->
                    <!--</li>-->
                    <li>
                        <a href="<?= BASEURL; ?>halaman/kontakadmin/">
                            <i class="simple-icon-phone"></i> <span class="d-inline-block">Kontak Admin</span>
                        </a>
                    </li>
                </ul>




            </div>
        </div>

    </div>