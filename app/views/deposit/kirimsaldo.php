<main>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="row">
                    <div class="col-lg-6">
                    <?php if (isset($_SESSION['hasil'])) : ?>
                    <div class="alert alert-<?= $_SESSION['hasil']['alert']; ?> alert-dismissible fade show  mb-0" role="alert">
                        <?= $_SESSION['hasil']['pesan'] ?>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div><br>
                    <?php endif; ?>
                    <?php unset($_SESSION['hasil']); ?>
                        <div class="col-12 col-lg-12 col-xl-12 card mt-4">
                        <div class="card-body d-flex border__bottom-dash">
                        <div class="">
                            <img src="<?= BASEURL; ?>img/transaksi-02.png" alt="balance-icon" style="width: 75px;">
                        </div>
                        <div class="flex-column align-self-center">
                            <div class="pl-3 text-gray mt-2">
                                <h2>Saldo Kamu</h2>
                            </div>
                            <div class="pl-3">
                                <h2>Rp. <?= number_format($data['user']['saldo_top_up'], 0, ',', '.'); ?></h2>
                            </div>
                        </div>
                    </div><br>
                    <div class="text-gray text-center">
                        Transfer Saldo ke sesama member <?= WEB_NAME; ?><br>
                        Silahkan masukkan nomor handphone tujuan transfer
                    </div><br>
                    <form class="custom__form mt-lg-5 mt-2" role="form" action="<?= BASEURL; ?>deposit/transfersaldo" method="post">
                        <input type="hidden" name="_token" value="ng1px21HFBw4jt3qmbptVZwUNsZN1dLDdXSgOh6w">
                        <div class="form-group">
                            <label for="nomorHP">Nomor Handphone Tujuan (Gunakan 62)</label>
                            <div class="input-group">
                                <input type="number" class="form-control" name="no_tujuan" value="" placeholder="628**********" aria-label="" aria-describedby="basic-addon2" id="number" required>
                                <div class="input-group-append">
                                    <button id="cek_nomor" class="btn btn-outline-secondary" type="button">Cek Nomor</button>
                                </div>
                            </div>
                            <span class="text-small notifceknomor"></span>
                        </div>
                        <div class="form-group">
                            <label for="nominal">Nominal Transfer</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">Rp</div>
                                </div>
                                <input type="number" name="nominal" class="form-control" value="" placeholder="" aria-label="" aria-describedby="basic-addon1" id="nominalTrf" min="0" autocomplete="off" required autofocus>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pin">Pin</label>
                            <input type="number" name="pin" type="pin" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1" id="pin" required>
                        </div>
                        <div class="text-center mt-5 mb-3">
                            <button type="submit" class="btn btn-info shadow pl-4 pr-4">
                                Kirim Saldo
                            </button>
                        </div>
                    </form>    
                        </div>
                    </div>
                <div class="col-lg-6 col-sm-12 mt-4">
                    <div class="col-12 col-lg-12 col-xl-12 card mt-4">
                        <div class="box__title card-body">
                            <b>Syarat & Ketentuan</b>
                        </div>
                        <div class="box p-4">
                            <div class="box__keterangan">
                                <!--<b>Pendahuluan</b> <br>-->
                                <!--Fitur Transfer Saldo adalah fitur yang digunakan untuk mengirim/berbagi saldo dengan member/referral anda yang berfungsi untuk membantu member/referral anda yang tidak dapat melakukan deposit saldo melalui transfer bank, anda dapat menggunakan fitur ini untuk menambahkan saldo Member/Referral anda. <br><br>-->
                                <!--<b>Syarat & Ketentuan</b> <br>-->
                                1. Tidak dapat melakukan transfer saldo ke akun anda sendiri. <br>
                                2. Minimal jumlah transfer adalah Rp 10.000.<br>
                                3. Lakukan pengecekan nomor tujuan transfer terlebih dahulu untuk memeriksa tujuan transfer anda apakah sudah benar atau belum.<br>
                                4. Demi keamanan dalam fitur ini, anda diwajibkan memasukkan PIN keamanan akun agar transfer saldo dipastikan dilakukan oleh anda sendiri.<br>
                                5. Kami tidak bertanggung jawab jika terjadi kesalahan transfer saldo ke member/referral dikarenakan salah memasukkan nomor handphone atau jumlah transfer. <br><br>
                                <!--<b>Penutup</b> <br>-->
                                <!--Sebelum menggunakan fitur ini di sarankan untuk membaca dan memahami benar syarat dan ketentuan dari fitur ini agar tidak terjadi kesalah pahaman. Syarat & Ketentuan diatas dapat berubah sewaktu - waktu tanpa pemberitahuan sebelumnya. <br><br>-->
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-12 col-xl-12 card mt-4">
                        <div class="box__title card-body">
                            <b>Riwayat Transfer Kamu :</b>
                        </div>
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
</main>
<script>
    $(document).ready(function() {


        $('#cek_nomor').on('click', function() {
            var nomor = $('#number').val()

            $.ajax({
                url: url.concat('deposit/ceknomortf'),
                type: 'post',
                // dataType: 'html',
                data: {
                    nomor: nomor
                },
                beforeSend: function() {
                    $('.notifceknomor').addClass('text-info')
                    $('.notifceknomor').html('Mohon tunggu...')
                },
                success: function(hasil) {
                    if (hasil == '1') {
                        $('.notifceknomor').removeClass('text-info')
                        $('.notifceknomor').removeClass('text-danger')
                        $('.notifceknomor').addClass('text-success')
                        $('.notifceknomor').html('Nomor Terdaftar.')
                    } else {
                        $('.notifceknomor').addClass('text-danger')
                        $('.notifceknomor').html('Nomor Tidak terdaftar!.')
                    }
                },
                error: function() {
                    $('.notifceknomor').addClass('text-danger')
                    $('.notifceknomor').html('Error(88), mohon infokan error ini ke admin')
                }


            })
        })



    })
</script>