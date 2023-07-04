<main>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <h1>Pengaturan keuntungan</h1>
                <div class="separator mb-5"></div>
            </div>
        </div>

        <?php if (isset($_SESSION['hasil'])) : ?>
            <div class="alert alert-<?= $_SESSION['hasil']['alert']; ?> alert-dismissible fade show  mb-0" role="alert">
                <?= $_SESSION['hasil']['pesan'] ?>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div><br>
        <?php endif; ?>
        <?php unset($_SESSION['hasil']); ?>
        <div class="row mb-4">

            <div class="col-12 mb-4">
                <div class="card">
                    <div class="card-body">
                        <table class=" table-responsive w-100 d-block d-md-table">
                            <thead>
                                <tr>
                                    <th>No</th>

                                    <th>Order Melalui</th>
                                    <th>Layanan</th>
                                    <th>Keuntungan</th>
                                    <th>Aksi</th>


                                </tr>
                            </thead>
                            <tbody>
                                <?php $no = 1;
                                $token = new Token;
                                ?>
                                <?php foreach ($data['datakeuntunganharga'] as $datakeuntungan) : ?>

                                    <tr>
                                        <form action="<?= BASEURL; ?>admin/settinghargauntung" class="form-inline" role="form" method="POST">
                                            <td><?php echo $no++ ?></td>
                                            <input type="hidden" name="token" value="<?= $token->get() ?>">
                                            <input type="hidden" name="id_hargauntung" value="<?= $datakeuntungan['id']; ?>">
                                            <td><input type="text" class="form-control" readonly style="width: 200px;" name="nama" value="<?php echo $datakeuntungan['kategori']; ?>"></td>
                                            <td><input type="text" class="form-control" readonly style="width: 200px;" name="kode" value="<?php echo $datakeuntungan['tipe']; ?>"></td>


                                            <td><input type="text" class="form-control" style="width: 200px;" name="hargauntung" value="<?php echo $datakeuntungan['harga']; ?>"></td>
                                            </td>
                                            <td align="text-center">
                                                <button data-toggle="tooltip" title="Ubah" type="submit" name="ubah" class="btn btn-sm btn-bordred btn-warning"><i class="simple-icon-note" title="Ubah"></i></button>

                                            </td>
                                        </form>
                                    </tr>

                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modalll detail berita -->
    <div class="modal fade" id="modal-detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title mt-0" id="myModalLabel"><i class="fa fa-bell text-primary"></i> Berita</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body ">
                    <form class="form-horizontal" role="form" method="POST" action="<?= BASEURL; ?>admin/submiteditnews">
                        <input type="hidden" name="csrf_token" value="<?php echo $config['csrf_token'] ?>">
                        <div id="modal-detail-body"></div>
                        <div class="modal-footer">

                            <button type="submit" class="btn btn-warning" name="ubah"><i class="fa fa-pencil-alt"></i> Ubah</button>

                            <button type="button" class="btn btn-primary" data-dismiss="modal">Tutup</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- 
     -->


    <!-- modal tambah berita -->

</main>

<script type="text/javascript">

</script>