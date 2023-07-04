function ubahpin(pinsaatini) {
    var pin = $('#pinsaatini').val();
    var newpin = $('#pinbaru').val();
    var pinsaatini = pinsaatini
    if (pin != pinsaatini) {
        $('.alertubahpin').html(` <div class="alert alert-danger alert-dismissible fade show  mb-0" role="alert">
            Pin salah
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>`)
    } else if (newpin.length != 6) {
        $('.alertubahpin').html(` <div class="alert alert-danger alert-dismissible fade show  mb-0" role="alert">
            Pin Baru harus 6 digit!
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>`)
    } else {
        $.ajax({
            url: url.concat('akun/ubahpin'),
            type: 'post',
            dataType: 'html',
            data: {
                newpin: newpin
            },
            beforeSend: function () {
                $('.alertubahpin').html(` <div class="alert alert-info alert-dismissible fade show  mb-0" role="alert">
           Proses menganti pin.. mohon tunggu....
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>`)
            },
            success: function (hasil) {
                if (hasil == 'true') {
                    $('.alertubahpin').html(` <div class="alert alert-success alert-dismissible fade show  mb-0" role="alert">
         Pin Berhasil di ubah
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>`)
                } else {
                    $('.alertubahpin').html(` <div class="alert alert-success alert-dismissible fade show  mb-0" role="alert">
        System error. Gagal ubah pin!
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>`)
                }
            }
        })
    }
}
$(document).ready(function () {

    // ajax nama depan
    $('.ubahnamadepan').on('click', function () {
      
        var $namadepan = $('#namadepan');
        var namadepan = $namadepan.val()
     
        if (namadepan === "") {
            $namadepan.val('Ini harus diisi sob');
        } else {
            $.ajax({

                url: url.concat('akun/ubahnamadepan'),
                type: 'post',
                data: {
                    namadepan: namadepan,
                    token : token
                    
                },
                dataType: 'html',
                success: function (result) {
                    $('.alertnamadepan').html(result);
                    $namadepan.val(namadepan);
                }

            });
        }
    })

    // ajax nama belakang
    $('.ubahnamabelakang').on('click', function () {
        var $namabelakang = $('#namabelakang');
        var namabelakang = $namabelakang.val()
        if (namabelakang === "") {
            $namabelakang.val('Ini harus diisi sob');
        } else {
            $.ajax({

                url: url.concat('akun/ubahnamabelakang'),
                type: 'post',
                data: {
                    namabelakang: namabelakang
                },
                dataType: 'html',
                success: function (result) {
                    $('.alertnamabelakang').html(result);
                    $namabelakang.val(namabelakang);
                }

            });
        }
    })

    // ajax email
    $('.ubahemail').on('click', function () {
        var $email = $('#email');
        var email = $email.val()
        if (email === "") {
            $email.val('Ini harus diisi sob');
        } else {
            $.ajax({

                url: url.concat('akun/ubahemail'),
                type: 'post',
                data: {
                    email: email
                },
                dataType: 'html',
                success: function (result) {
                    $('.alertemail').html(result);
                    $email.val(email);
                }

            });
        }
    })
    // ajax nomor hp
    $('.ubahno_hp').on('click', function () {
        var $no_hp = $('#no_hp');
        var no_hp = $no_hp.val()
        if (no_hp === "") {
            $no_hp.val('Ini harus diisi sob');
        } else {
            $.ajax({

                url: url.concat('akun/ubahno_hp'),
                type: 'post',
                data: {
                    no_hp: no_hp
                },
                dataType: 'html',
                success: function (result) {
                    $('.alertno_hp').html(result);
                    $no_hp.val(no_hp);
                }

            });
        }
    })


    // pengaturan kata sandi
    // ketika form kata sandi saat ini diketik
    var $sandisaatini = $('#sandisaatini');
    $sandisaatini.keyup(function () {
        var $sandi = $sandisaatini.val();
        if ($sandi.length == 0) {
            $('.text-notif').html('');
        } else {
            // mengecek apakah sandi sesuai 
            setTimeout(() => {

                $.ajax({
                    url: url.concat('akun/ceksandisaatini'),
                    type: 'post',
                    data: {
                        sandisaatini: $sandi
                    },
                    // dataType: 'html',
                    success: function (result) {
                        $('.text-notif').html(result);

                        var hasil = $('.datahasil').data('hasil');

                        if (hasil == 'success') {
                            $('.formsandibaru').show();
                        } else {
                            //
                            $('.formkonfirmasisandi').hide();
                            $('.ubahsandi').hide();
                            $('.formsandibaru').fadeOut();
                        }
                    }
                });
            }, 400);

        }
    })

    // event ketika kata sandi baru di ketik
    $('#sandibaru').keyup(function () {
        var $sandibaru = $('#sandibaru').val();
        if ($sandibaru.length == 0) {
            $('.text-notifsandibaru').html('');
        } else if ($sandibaru.length < 8) {
            $('.text-notifsandibaru').html(`<small class="form-text text-danger datasandibaru" data-hasil="gagal"><i class="simple-icon-minus"></i>Minimal 8 karakter!</small>`);
            //
            $('.formkonfirmasisandi').hide();
            $('.ubahsandi').hide();

        } else {
            $('.text-notifsandibaru').html(`<small class="form-text text-success datasandibaru" data-hasil="gagal" data-sandi="` + $sandibaru + `"><i class="simple-icon-check"></i> Sandi bisa digunakan</small>`);
            // 
            $('.formkonfirmasisandi').fadeIn();
        }

        // event ketika konfirmasi sandi baru diketik
        $('#sandibarukonfirmasi').keyup(function () {
            var $konfirmasisandi = $('#sandibarukonfirmasi').val();
            if ($konfirmasisandi.length == 0) {
                $('.text-notifsandibarukonfirmasi').html(``);
            }
            if ($konfirmasisandi != $sandibaru) {
                $('.text-notifsandibarukonfirmasi').html(`<small class="form-text text-danger"><i class="simple-icon-exclamation"></i> Konfirmasi tidak sesuai</small>`);
                $('.ubahsandi').hide();
            } else {
                $('.text-notifsandibarukonfirmasi').html(`<small class="form-text text-success datasandi" data-sandibaru="` + $konfirmasisandi + `"><i class="simple-icon-check"></i> Kata sandi sesuai!</small>`);
                //
                $('.ubahsandi').fadeIn();

            }


        })
    })
    // proses pengiriman data, dan mengubah sandi
    $('.ubahsandi').on('click', function () {
        $sandinya = $('.datasandi').data('sandibaru');
        $.ajax({
            url: url.concat('akun/ubahkatasandi'),
            type: 'post',
            data: {
                sandibaru: $sandinya
            },
            dataType: 'html',
            success: function (result) {
                if(result == 'success'){
                    window.location.href = url.concat('auth/index/');
                } else {
                    $('.alertubahsandi').html(result);
                }
            }
        });
    })

    ////////////////////////

    $('.ubahapikey').on('click', function () {
        var apikeysekarang = $('#apikey').val()
        $.ajax({
            url: url.concat('akun/ubahapikey'),
            type: 'get',
            dataType: 'html',
            success: function (result) {
                $('.alertapikey').html(result);


                var apikeybaru = $('.datahasilalert').data('api');
                if ($('.datahasilalert').data('hasil') == 'success') {
                    $('.apikey').val(apikeybaru);

                } else {
                    $('#apikey').val(apikeysekarang);
                }
            }

        });
    })






})

function ubahip(key) {
    var ipnew = $('#ipkey').val();
    $.ajax({
        url: url.concat('akun/ubahipkey'),
        type: 'post',
        dataType: 'html',
        data: {
            key: key,
            ipnew: ipnew
        },
        beforeSend: function () {
            $('.alertipkey').addClass('text-info')
            $('.alertipkey').html('Mohon tunggu...')
        },
        success: function (hasil) {
            $('#ipkey').val(ipnew);
            $('.alertipkey').html(hasil)
        }

    })
}

function ubahstatus(key) {
    var newstatus = $('#statusapi').val();
    $.ajax({
        url: url.concat('akun/ubahstatuskey'),
        type: 'post',
        dataType: 'html',
        data: {
            key: key,
            newstatus: newstatus
        },
        beforeSend: function () {
            $('.alertstatuskey').addClass('text-info')
            $('.alertstatuskey').html('Mohon tunggu...')
        },
        success: function (hasil) {
            $('#ipkey').val(newstatus);
            $('.alertstatuskey').html(hasil)
        }

    })
}
