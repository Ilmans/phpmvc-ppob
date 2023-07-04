<main>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <h1>HP Pascabayar</h1>
                <nav class="breadcrumb-container d-none d-sm-block d-lg-inline-block" aria-label="breadcrumb">

                </nav>
                <div class="separator mb-5"></div>
            </div>
        </div>
        <div class="container content">
            <div class="row">
                <?php if (isset($_SESSION['hasil'])) : ?>
                    <div class="alert alert-<?= $_SESSION['hasil']['alert']; ?> alert-dismissible fade show  mb-0" role="alert">
                        <?= $_SESSION['hasil']['pesan'] ?>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div><br>
                <?php endif; ?>
                <?php unset($_SESSION['hasil']); ?>
                <div class="card p-4 col-12">
                    <div class="card-body d-flex border__bottom-dash">
                        <div class="text-center">
                            <img src="<?= BASEURL; ?>icon/hp.jpg" alt="balance-icon" width="100px" height="100px" style="margin-left:50px ;">
                        </div>
                        <div class="flex-column align-self-center">

                        </div>
                    </div>


                    <div class="form-group">
                        <label for="nomorHP">Nomor Pelanggan</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="nopelanggan" value="" placeholder="" aria-label="" aria-describedby="basic-addon1" id="nopelanggan" required>
                        </div>
                        <span class="text-small notifceknomor"></span>
                    </div>
                    <div class="form-group">
                        <label for="nomorHP">Jenis</label>

                        <div class="input-group">
                            <select class="custom-select" name="skucode" id="skucode" required>
                                <option value="" selected disabled>Pilih Metode</option>
                                <?php foreach ($data['hp'] as $d) : ?>
                                    <option value="<?= $d['provider_id']; ?>"><?= $d['layanan']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="pin">Pin</label>
                        <input type="text" name="pin" type="pin" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1" id="pin" required>
                        <small class="text-small text-danger errorpin"></small>
                    </div>
                    <div class="text-center mt-5 mb-3">
                        <button onclick="cektagihan()" class="btn btn-info shadow pl-4 pr-4 ">
                            Cek tagihan
                        </button>
                    </div>

                </div>
            </div>

            <!-- <div class="row mt-4">

                <div class="col-xl-12 col-lg-12 ">
                    <div class="card ">
                        <div class="card-body">
                            <h5 class="card-title">Riwayat Transfer Kamu :</h5>
                            <table class="data-table data-table-standard responsive nowrap" data-order="[[ 1, &quot;desc&quot; ]]">
                                <thead>
                                    <tr>
                                        <th>Waktu</th>
                                        <th>Tujuan</th>
                                        <th>Nominal</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($data['riwayattransfer'] as $datatf) : ?>
                                        <tr>
                                            <td>
                                                <p><?= $datatf['date']; ?> <br><?= $datatf['time']; ?></p>
                                            </td>
                                            <td>
                                                <p><?= $datatf['no_tujuan']; ?></p>
                                            </td>
                                            <td>
                                                <p>RP : <?= number_format($datatf['jumlah'], 0, ',', '.'); ?></p>
                                            </td>



                                        <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div> -->
        </div>
    </div>


</main>
<div class="modal fade" id="modaltariksaldo" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center" id="labelmodalPpob">INFORMASI</h5>
                <button type="button" class="close tutupmodalPpob" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body body-modaltariksaldo">


            </div>
        </div>
    </div>
    <script>
        function cektagihan() {
            var pinuser = '<?= $data['user']['pin'] ?>';
            var saldouser = '<?= $data['user']['saldo_top_up'] ?>'
            nopelanggan = $('#nopelanggan').val()
            skucode = $('#skucode').val()
            nominal = $('#nominal').val()
            pin = $('#pin').val()
            if (nopelanggan.length == 0 || pin.length == 0) {
                alert('Input wajib diisi semua!')
            } else if (pin != pinuser) {
                $('.errorpin').html('Pin kamu salah!');
                console.log('ds')
            } else {


                $('#modaltariksaldo').modal()

                $.ajax({
                    url: url.concat('pascabayar/cektagihanhp'),
                    type: 'post',
                    dataType: 'html',
                    data: {
                        nopelanggan: nopelanggan,
                        pin: pin,
                        sku: skucode

                    },
                    beforeSend: function() {
                        $('.body-modaltariksaldo').html('sedang memuat....')
                    },
                    success: function(hasil) {
                        $('.body-modaltariksaldo').html(hasil)

                    }

                })



            }
        }
    </script>