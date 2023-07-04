<style>
    .error {
        color: red;
    }
</style>
<main>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <h1>Internet Pascabayar</h1>
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
                            <img src="<?= BASEURL; ?>icon/internet-pasca.png" alt="balance-icon" width="100px" height="100px" style="margin-left:50px ;">
                        </div>
                        <div class="flex-column align-self-center">

                        </div>
                    </div>

                    <form action="" method="POST" id="forminternet">
                        <div class="form-group">
                            <label for="nomorHP">Nomor Pelanggan</label>
                            <input type="text" class="form-control" name="nopelanggan" value="" id="nopelanggan" required>
                            <span class="text-small notifceknomor"></span>
                        </div>
                        <div class="form-group">
                            <label for="nomorHP">Jenis</label>
                            <select class="custom-select" name="skucode" id="skucode" required>
                                <option value="" selected disabled>Pilih Metode</option>
                                <?php foreach ($data['internet'] as $d) : ?>
                                    <option value="<?= $d['provider_id']; ?>"><?= $d['layanan']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="pin">Pin</label>
                            <input type="text" name="pin" type="pin" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1" id="pin" required>

                        </div>
                        <div class="text-center mt-5 mb-3">
                            <button type="submit" class="btn btn-info shadow pl-4 pr-4 ">
                                Cek tagihan
                            </button>
                        </div>
                    </form>
                </div>
            </div>


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
</div>
<script>
    $(document).ready(function() {

        var res;
        $.validator.addMethod(
            "cekpin",
            function(value, element) {
                $.ajax({
                    url: url.concat('ajax/cekpin'),
                    data: {
                        'pin': value
                    },
                    type: 'POST',
                    dataType: 'html',
                    success: function(msg) {
                        res = msg == 'true' ? true : false;
                        // console.log(msg)
                    }
                });
                return res;
            }
        )
        // 
        $('#forminternet').validate({

            rules: {
                nopelanggan: {
                    required: true,
                },
                skucode: {
                    required: true,
                },
                pin: {
                    cekpin: true
                }

            },
            messages: {
                nopelanggan: {
                    required: 'Tidak boleh kosong'
                },
                skucode: {
                    required: 'Tidak boleh kosong'
                },
                pin: {
                    cekpin: 'Pin salah'
                }
            },

            submitHandler: function(form) {

                $('#modaltariksaldo').modal('show');
                $.ajax({
                    url: url.concat('pascabayar/cektagihaninternet'),
                    type: 'post',
                    data: $(form).serialize(),
                    beforeSend: function() {
                        $('.body-modaltariksaldo').html('sedang memuat....')
                    },
                    success: function(hasil) {
                        //  return console.log(hasil)
                        $('.body-modaltariksaldo').html(hasil)

                    }

                })
                return false;
            }
        })
    })
</script>