<main>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="mb-2">
                    <h1>Riwayat Pembelian</h1>
                    <div class="text-zero top-right-button-container">

                    </div>
                </div>

                <?php if (isset($_SESSION['hasil'])) : ?>
                    <div class="alert alert-<?= $_SESSION['hasil']['alert']; ?> alert-dismissible fade show  mb-3 col-12" role="alert">
                        <?= $_SESSION['hasil']['pesan'] ?>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <?php unset($_SESSION['hasil']); ?>
                <?php endif; ?>

                <ul class="nav nav-tabs separator-tabs ml-0 mb-5  " role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="semuapembelian-tab" data-toggle="tab" href="#semuapembelian" role="tab" aria-controls="semuapembelian" aria-selected="true">Semua</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " id="pembelianppob-tab" data-toggle="tab" href="#pembelianppob" role="tab" aria-controls="pembelianppob" aria-selected="false"> PPOB</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " id="pembeliansosmed-tab" data-toggle="tab" href="#pembeliansosmed" role="tab" aria-controls="pembeliansosmed" aria-selected="false">Sosial Media</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " id="pembelianpascabayar-tab" data-toggle="tab" href="#pembelianpascabayar" role="tab" aria-controls="pembelianpascabayar" aria-selected="false">Pascabayar</a>
                    </li>
                </ul>
                <div class="tab-content card">
                    <div class="tab-pane show active" id="semuapembelian" role="tabpanel" aria-labelledby="semuapembelian-tab">
                        <div class="row">
                            <div class="col-12 ">
                                <div class="card">
                                    <div class="card-body">
                                        <table class="data-table data-table-feature table-responsive w-100 d-block d-md-table">
                                            <thead>
                                                <tr>
                                                    <th>No</th>
                                                    <th>Id Order</th>
                                                    <th>Tanggal</th>
                                                    <th>Layanan</th>
                                                    <th>Tujuan</th>
                                                    <th>Status</th>
                                                    <th>Detail</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php $no = 1; ?>
                                                <?php

                                                foreach ($data['riwayatsemuapembelian'] as $semuapembelian) : ?>
                                                    <tr>
                                                        <td> <?php echo $no; ?></td>
                                                        <td>
                                                            <div class="badge badge-secondary">
                                                                <?= $semuapembelian['id_order']; ?>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="text-dark"><?= tanggal_indo($semuapembelian['date']); ?><br>
                                                                <?= $semuapembelian['time']; ?></p>
                                                        </td>
                                                        <td>
                                                            <p class="text-dark"><?= $semuapembelian['layanan']; ?></p>
                                                        </td>
                                                        <td>
                                                            <input type="text" readonly value="<?= $semuapembelian['target']; ?>">
                                                        </td>
                                                        <td>
                                                            <?php
                                                            // cek status 
                                                            $statussemua = $semuapembelian['status'];
                                                            if ($statussemua == 'Success') {

                                                                $badge = 'success';
                                                                $icon = 'simple-icon-check';
                                                            } else if ($statussemua == 'Error') {
                                                                $badge = 'danger';
                                                                $icon = 'simple-icon-close';
                                                            } else if ($statussemua == 'Pending') {
                                                                $badge = 'warning';
                                                                $icon = 'simple-icon-clock';
                                                            } else {
                                                                $badge = 'secondary';
                                                            }
                                                            ?>
                                                            <div class="badge badge-<?= $badge; ?>">
                                                                <i class="<?= $icon; ?>"></i>
                                                            </div>
                                                        </td>
                                                        <td>

                                                            <button data-toggle="modal" data-target="#apikeyModal" type="button" id="<?= $semuapembelian['id_order']; ?>" onclick="detailsemua('<?= $semuapembelian['id_pesan']; ?>')" class="detail-pesan btn btn-secondary ">Detail</button>
                                                        </td>
                                                    </tr>
                                                    <?php $no++ ?>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="pembelianppob" role="tabpanel" aria-labelledby="pembelianppob-tab">
                        <div class="row">
                            <div class="col-12 ">
                                <div class="card">
                                    <div class="card-body">
                                        <table class="data-table data-table-feature table-responsive w-100 d-block d-md-table">
                                            <thead>
                                                <tr>
                                                    <th>Id Order</th>
                                                    <th>Tanggal</th>
                                                    <th>Layanan</th>
                                                    <th>Tujuan</th>
                                                    <th>Status</th>
                                                    <th>Detail</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                foreach ($data['riwayatpembelianppob'] as $pembelianppob) : ?>
                                                    <tr>
                                                        <td>
                                                            <div class="badge badge-secondary">
                                                                <?= $pembelianppob['place_from']; ?>-
                                                                <?= $pembelianppob['oid']; ?>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="text-dark"><?= tanggal_indo($pembelianppob['date']); ?><br>
                                                                <?= $pembelianppob['time']; ?></p>
                                                        </td>
                                                        <td>
                                                            <p class="text-dark"><?= $pembelianppob['layanan']; ?></p>
                                                        </td>
                                                        <td>
                                                            <input type="text" readonly value="<?= $pembelianppob['target']; ?>">
                                                        </td>
                                                        <td>
                                                            <?php
                                                            // cek status 
                                                            $statusppob = $pembelianppob['status'];
                                                            if ($statusppob == 'Success') {

                                                                $badge = 'success';
                                                                $icon = 'simple-icon-check';
                                                            } else if ($statusppob == 'Error') {
                                                                $badge = 'danger';
                                                                $icon = 'simple-icon-close';
                                                            } else if ($statusppob == 'Pending') {
                                                                $badge = 'warning';
                                                                $icon = 'simple-icon-clock';
                                                            } else {
                                                                $badge = 'secondary';
                                                            }
                                                            ?>
                                                            <div class="badge badge-<?= $badge; ?>">
                                                                <i class="<?= $icon; ?>"></i>
                                                            </div>
                                                        </td>
                                                        <td>


                                                            <button data-toggle="modal" data-target="#apikeyModal" type="button" id="<?= $semuapembelian['id_order']; ?>" onclick="detailpesananppob('<?= $pembelianppob['oid']; ?>')" class="detail-pesan btn btn-secondary ">Detail</button>

                                                        </td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="pembeliansosmed" role="tabpanel" aria-labelledby="pembeliansosmed-tab">
                        <div class="row">
                            <div class="col-12 ">
                                <div class="card">
                                    <div class="card-body">
                                        <table class="data-table data-table-feature table-responsive w-100 d-block d-md-table">
                                            <thead>
                                                <tr>
                                                    <th>Id Order</th>
                                                    <th>Tanggal</th>
                                                    <th>Layanan</th>
                                                    <th>Tujuan</th>
                                                    <th>Status</th>
                                                    <th>Detail</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                foreach ($data['riwayatpembeliansosmed'] as $pembeliansosmed) : ?>
                                                    <tr>
                                                        <td>
                                                            <div class="badge badge-secondary">
                                                                <?= $pembeliansosmed['place_from']; ?>-<?= $pembeliansosmed['oid']; ?>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="text-dark"><?= tanggal_indo($pembeliansosmed['date']); ?><br>
                                                                <?= $pembeliansosmed['time']; ?></p>
                                                        </td>
                                                        <td>
                                                            <p class="text-dark"><?= $pembeliansosmed['layanan']; ?></p>
                                                        </td>
                                                        <td>
                                                            <input type="text" readonly value="<?= $pembeliansosmed['target']; ?>">
                                                        </td>
                                                        <td>
                                                            <?php
                                                            // cek status 
                                                            $statussosmed = $pembeliansosmed['status'];
                                                            if ($statussosmed == 'Success') {

                                                                $badge = 'success';
                                                                $icon = 'simple-icon-check';
                                                            } else if ($statussosmed == 'Error') {
                                                                $badge = 'danger';
                                                                $icon = 'simple-icon-close';
                                                            } else if ($statussosmed == 'Pending') {
                                                                $badge = 'warning';
                                                                $icon = 'simple-icon-clock';
                                                            } else {
                                                                $badge = 'secondary';
                                                            }
                                                            ?>
                                                            <div class="badge badge-<?= $badge; ?>">
                                                                <i class="<?= $icon; ?>"></i>
                                                            </div>
                                                        </td>
                                                        <td>


                                                            <button data-toggle="modal" data-target="#apikeyModal" type="button" id="<?= $semuapembelian['id_order']; ?>" onclick="detailpesanansosmed('<?= $pembeliansosmed['oid']; ?>')" class="detail-pesan btn btn-secondary ">Detail</button>
                                                        </td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="pembelianpascabayar" role="tabpanel" aria-labelledby="pembelianpascabayar-tab">
                        <div class="row">
                            <div class="col-12 ">
                                <div class="card">
                                    <div class="card-body">
                                        <table class="data-table data-table-feature table-responsive w-100 d-block d-md-table">
                                            <thead>
                                                <tr>
                                                    <th>Id Order</th>
                                                    <th>Tanggal</th>
                                                    <th>Layanan</th>
                                                    <th>Tujuan</th>
                                                    <th>Status</th>
                                                    <th>Detail</th>
                                                </tr>
                                            </thead>
                                            <tbody><?php
                                                    foreach ($data['riwayatpembelianpascabayar'] as $pp) : ?>
                                                    <tr>
                                                        <td>
                                                            <div class="badge badge-secondary">
                                                                <?= $pp['place_from']; ?>-
                                                                <?= $pp['oid']; ?>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="text-dark"><?= tanggal_indo($pp['date']); ?><br>
                                                                <?= $pp['time']; ?></p>
                                                        </td>
                                                        <td>
                                                            <p class="text-dark"><?= $pp['layanan']; ?></p>
                                                        </td>
                                                        <td>
                                                            <input type="text" readonly value="<?= $pp['target']; ?>">
                                                        </td>
                                                        <td>
                                                            <?php
                                                            // cek status 
                                                            $statuspp = $pp['status'];
                                                            if ($statuspp == 'Success') {

                                                                $badge = 'success';
                                                                $icon = 'simple-icon-check';
                                                            } else if ($statuspp == 'Error') {
                                                                $badge = 'danger';
                                                                $icon = 'simple-icon-close';
                                                            } else if ($statuspp == 'Pending') {
                                                                $badge = 'warning';
                                                                $icon = 'simple-icon-clock';
                                                            } else {
                                                                $badge = 'secondary';
                                                            }
                                                            ?>
                                                            <div class="badge badge-<?= $badge; ?>">
                                                                <i class="<?= $icon; ?>"></i>
                                                            </div>
                                                        </td>
                                                        <td>


                                                            <button data-toggle="modal" data-target="#apikeyModal" type="button" id="<?= $semuapembelian['id_order']; ?>" onclick="detailpesananpascabayar('<?= $pp['oid']; ?>')" class="detail-pesan btn btn-secondary ">Detail</button>

                                                        </td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</main>
<!-- Modal detail -->
<div class="modal fade" id="apikeyModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Detail Pesanan</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body detail-pesanan-modal row">


            </div>
        </div>
    </div>
    <script>
        function detailsemua(id) {
            $.ajax({
                url: url.concat('riwayat/detailsemuapesanan'),
                type: 'post',
                dataType: 'html',
                data: {
                    idpesanan: id,

                },
                beforeSend: function() {
                    $('.detail-pesanan-modal').html('Mohon tunggu..')
                },
                success: function(result) {
                    $('.detail-pesanan-modal').html(result)

                }
            })
        }

        function detailpesananppob(id) {
            $.ajax({
                url: url.concat('riwayat/detailpesananppob'),
                type: 'post',
                dataType: 'html',
                data: {
                    idpesanan: id,

                },
                beforeSend: function() {
                    $('.detail-pesanan-modal').html('Mohon tunggu..')
                },
                success: function(result) {
                    $('.detail-pesanan-modal').html(result)
                    console.log(result)
                }
            })
        }

        function detailpesananpascabayar(id) {
            $.ajax({
                url: url.concat('riwayat/detailpesananpascabayar'),
                type: 'post',
                dataType: 'html',
                data: {
                    idpesanan: id,

                },
                beforeSend: function() {
                    $('.detail-pesanan-modal').html('Mohon tunggu..')
                },
                success: function(result) {
                    $('.detail-pesanan-modal').html(result)
                    console.log(result)
                }
            })
        }

        function detailpesanansosmed(id) {
            $.ajax({
                url: url.concat('riwayat/detailpemesanan'),
                type: 'post',
                dataType: 'html',
                data: {
                    idpesanan: id,
                },
                beforeSend: function() {
                    $('.detail-pesanan-modal').html('Mohon tunggu..')
                },
                success: function(result) {
                    $('.detail-pesanan-modal').html(result)
                    console.log(result)
                }
            })
        }
    </script>