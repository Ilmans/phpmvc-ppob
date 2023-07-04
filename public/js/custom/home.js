
    $(document).ready(function() {

        function ambillayananpulsa(operator, jenis) {
            $.ajax({
                url: url.concat('ajax/getTipePulsaData'),
                type: 'post',
                dataType: 'html',
                data: {
                    jenis: jenis,
                    operator: operator,
                },
                beforeSend: function() {
                    $('.layanan').html('mohon tunggu....');
                },
                success: function(result) {

                    $('.layanan').html('');
                    $('.kategoripulsadata').html(result)
                    $('.kategoripulsadata').fadeIn()

                }
            })

            $('.kategoripulsadata').change(function() {
                var kategorii = $('.kategoripulsadata').val();
                $.ajax({
                    url: url.concat('ajax/layananPulsaData'),
                    type: 'post',
                    dataType: 'html',
                    data: {
                        jenis: jenis,
                        kategori: kategorii,
                        operator: operator
                    },
                    beforeSend: function() {
                        $('.layanan').html('mohon tunggu...');
                    },
                    success: function(result) {

                        $('.loaderajax').html('');

                        $('.layanan').html(result)

                    }
                })
            })
        }

        function tipekartu(kode) {
            if (kode == 0814 || kode == 0815 || kode == 0816 || kode == 0855 || kode == 0856 || kode == 0857 || kode == 0858) {
                $('.layanan').html('')
                return 'indosat'

            } else if (kode == 0811 || kode == 0812 || kode == 0813 || kode == 0821 || kode == 0822 || kode == 0852 || kode == 0853 || kode == 0823 || kode == 0851) {
                return 'Telkomsel'
            } else if (kode == 0817 || kode == 0818 || kode == 0819 || kode == 0859 || kode == 0877 || kode == 0878) {
                return 'Xl'
            } else if (kode == 0838 || kode == 0831 || kode == 0832 || kode == 0833) {
                return "Axis"
            } else if (kode == 0895 || kode == 0896 || kode == 0897 || kode == 0898 || kode == 0899) {
                return "Three"
            } else if (kode == 0881 || kode == 0882 || kode == 0883 || kode == 0884 || kode == 0885 || kode == 0886 || kode == 0887 || kode == 0888 || kode == 0889) {
                return "smart"
            } else {

                return 'error'
            }


        }

        var typingTimer; //timer identifier
        var doneTypingInterval = 2000; //time in ms (5 seconds)
        function validasipulsadata(jenis, t) {
            clearTimeout(typingTimer);
            var digit = t.val().length
            if (digit == 0) {
                $('.kategoripulsadata').fadeOut()
                $('.layanan').html('');

            } else if (digit < 4) {

                $('.kategoripulsadata').fadeOut()
                $('.layanan').html('')
            } else
            if (t.val()) {
                $('.layanan').html(`
        <img src="loader/ajax-loader.gif">`)
                typingTimer = setTimeout(function() {
                    doneTyping(jenis)
                }, doneTypingInterval);
            }
        }
        $('.pesan-pulsa').on('click', function() {
            var jenis = $(this).attr('data-jenis')
            $('#nohp').keyup(function() {
                validasipulsadata(jenis, $(this))
            });
            $('#labelmodalpulsa').html('Pesan Pulsa All Operator')
        })

        $('.pesan-paket').on('click', function() {
            var jenis = $(this).attr('data-jenis')
            $('#nohp').keyup(function() {
                validasipulsadata(jenis, $(this))
            });
            $('#labelmodalpulsa').html('Pesan Data All Operator')
        })

        function doneTyping(jenis) {
            var opr = $('#nohp').val();
            var kode = opr.substring(0, 4)
            var kartu = tipekartu(kode)
            if (kartu != 'error') {
                ambillayananpulsa(kartu, jenis)
            } else {
                $('.layanan').html('Operator tidak dikenali')
            }
        }
        $('#tutupmodalpulsa').click(function() {
            $('#nohp').val('');
            $('.layanan').html('');
            $('.kategoripulsadata').fadeOut()
        })
        var $tujuanppob = $('#tujuanppob')
        var $kategorippob = $('.kategorippob')
        var $optionkategori = $('.optionkategorippob')
        var $optionlayanan = $('.optionlayananppob')
        var $layananppob = $('.layananppob')
        var $deskripsippob = $('.deskripsippob')


        function ppobproccess(tujuan, jenis) {

            clearTimeout(typingTimer);
            if (tujuan.val().length >= 2) {
                if (tujuan.val()) {
                    $('.layanan').html(`
          <img src="loader/ajax-loader.gif">`)
                    typingTimer = setTimeout(function() {
                        doneTyping2(tujuan, jenis)
                    }, doneTypingInterval);
                }
            }
        }

        function doneTyping2(tujuan, jenis) {
            var tdigit = tujuan.length
            $kategorippob.fadeIn()
            $.ajax({
                url: url.concat('ajax/kategoriPpob'),
                type: 'post',
                data: {
                    kategori: jenis
                },
                dataType: 'html',

                success: function(result) {
                    $optionkategori.html(result)
                }
            })
            $kategorippob.change(function() {
                var kategorinya = $optionkategori.val();
                var kat = kategorinya.split('#');
                $layananppob.fadeIn()
                $.ajax({
                    url: url.concat('ajax/layananPpob'),
                    type: 'post',
                    data: {

                        kategori: kat[0],
                        tipe: kat[1],
                        jenis: jenis
                    },
                    dataType: 'html',
                    success: function(result) {
                        $('.optionlayananppob').html(result)

                    }
                })
            })

            $layananppob.change(function() {
                $deskripsippob.fadeIn()
                var idlayanan = $('.optionlayananppob').val();
                $.ajax({
                    url: url.concat('ajax/deskripsippob'),
                    type: 'post',
                    data: {
                        id: idlayanan
                    },
                    dataType: 'json',
                    success: function(result) {
                        // console.log(idlayanan)
                        result.forEach(data => {

                            $deskripsippob.html(`
                Layanan : ` + data.layanan + ` <br>
                Keterangan : ` + data.deskripsi + `<br>
                Harga : ` + data.harga + ``)
                        });
                    }
                })
            })


        }
        // emoney
        $('.pesan-emoney').on('click', function() {
            $('#labelmodalPpob').html('Pesan E-Money')
            var jenis = $(this).attr('data-jenis')
            $tujuanppob.keyup(function() {
                ppobproccess($(this), jenis)
            })
        })
        // voucher digital
        $('.pesan-voucherdigital').on('click', function() {
            $('#labelmodalPpob').html('Pesan Voucher Digital')
            var jenis = $(this).attr('data-jenis')
            $tujuanppob.keyup(function() {
                ppobproccess($(this), jenis)
            })
        })
        // pesan game
        $('.pesan-game').on('click', function() {
            $('#labelmodalPpob').html('Pesan Game/Voucher Game')
            var jenis = $(this).attr('data-jenis')
            $tujuanppob.keyup(function() {
                ppobproccess($(this), jenis)
            })
        })
        // pesan Pusa internasional
        $('.pesan-pulsa-internasional').on('click', function() {
            $('#labelmodalPpob').html('Pesan Pulsa Internasional')
            $tujuanppob.keyup(function() {
                var tujuan = $(this).val();
                var tdigit = tujuan.length
                if (tdigit > 2) {
                    $kategorippob.fadeIn()

                    setTimeout(() => {
                        $.ajax({
                            url: url.concat('home/pesanppob'),
                            type: 'post',
                            data: {
                                aksi: 'kategori',
                                kategori: 'Pulsa Internasional'
                            },
                            dataType: 'html',
                            success: function(result) {
                                $optionkategori.html(result)

                            }
                        })
                    }, 700);
                }
            })
            $kategorippob.change(function() {
                var kategorinya = $optionkategori.val();
                $layananppob.fadeIn()

                $.ajax({
                    url: url.concat('home/pesanppob'),
                    type: 'post',
                    data: {
                        aksi: 'layanan',
                        kategori: kategorinya,
                        tipe: 'Pulsa Internasional'
                    },
                    dataType: 'html',
                    success: function(result) {
                        console.log(kategorinya)
                        $('.optionlayananppob').html(result)


                    }
                })
            })

            $layananppob.change(function() {
                $deskripsippob.fadeIn()
                var idlayanan = $('.optionlayananppob').val();
                $.ajax({
                    url: url.concat('home/deskripsippob'),
                    type: 'post',
                    data: {
                        id: idlayanan
                    },
                    dataType: 'json',
                    success: function(result) {
                        // console.log(idlayanan)
                        result.forEach(data => {

                            $deskripsippob.html(`
                Layanan : ` + data.layanan + ` <br>
                Keterangan : ` + data.deskripsi + `<br>
                Harga : ` + data.harga + ``)
                        });
                    }
                })
            })

        })
        // pesan Paket sms
        $('.pesan-paket-smstlpn').on('click', function() {
            $('#labelmodalPpob').html('Pesan Paket SMS & Telepon')
            var jenis = $(this).attr('data-jenis')
            $tujuanppob.keyup(function() {
                ppobproccess($(this), jenis)
            })
        })
        // pesan PLN
        $('.pesan-pln').on('click', function() {
            $('#labelmodalPpob').html('Pesan Token PLN')
            var jenis = $(this).attr('data-jenis')
            $tujuanppob.keyup(function() {
                ppobproccess($(this), jenis)
            })

        })

        // close
        $('.tutupmodalPpob').on('click', function() {

            $tujuanppob.val('');
            $optionkategori.html('<option value="0">Pilih kategori</option>')
            $kategorippob.fadeOut();
            $optionlayanan.html('<option value="0">Pilih kategori</option>')
            $layananppob.fadeOut();
            $deskripsippob.html('');
            $deskripsippob.fadeOut()
        })










        // deposit
        $('.tomboldeposit').on('click', function() {
            $.ajax({
                url: url.concat('home/cekdeposit'),
                type: 'get',
                //  dataType: 'html',
                success: function(hasil) {
                    if (hasil == 'ada') {
                        $('#metodedepo').hide();
                        $('.tombolfooter').hide()
                        $('.notifdepo').show()
                    }
                }
            })
        })
        $('#formdeposit').submit(function(e){
e.preventDefault();
$('.content-deposit').html(`<div class="text-center"><img src="${url}img/loading.gif"></div>`);

$.ajax({
    url: url.concat('home/inputdeposit'),
    type: 'post',
    data: $(this).serialize(),
    success: function(response) {
        console.log(response)
      window.location.href = response;
    }
});
        }
        )
      

        // AJAK SOSMED
        $("#kategori").change(function() {
            var kategori = $("#kategori").val();
            $.ajax({
                url: url.concat('home/layanansosmed'),
                data: 'kategori=' + kategori,
                type: 'POST',
                dataType: 'html',
                success: function(msg) {
                    $("#layanan").html(msg);
                }
            });
        });


        $("#layanan").change(function() {
            var layanan = $("#layanan").val();
            $.ajax({
                url: url.concat('home/notesosmed'),
                data: 'layanan=' + layanan,
                type: 'POST',
                dataType: 'html',
                success: function(msg) {
                    $("#catatan").html(msg);
                }
            });
            $.ajax({
                url: url.concat('home/hargasosmed'),
                data: 'layanan=' + layanan,
                type: 'POST',
                dataType: 'html',
                success: function(msg) {
                    $("#rate").val(msg);
                    // console.log(msg)
                }
            });
        });


      
        // custom validasi
        var response;
        $.validator.addMethod(
            "ceknomor",
            function(value, element) {
                var kode = value.substring(0, 4)
                var kartu = tipekartu(kode)
                response = kartu == 'error' ? false : true;
                return response;
            }
        );
        var res;
        $.validator.addMethod(
            "cekpin", function(value,element){
                $.ajax({
                    url: url.concat('ajax/cekpin'),
                    data: {
                        'pin' : value
                    },
                    type: 'POST',
                    success: function(msg) {
                        res = msg == 'true' ? true : false;
                        // console.log(msg)
                    }
                });
                return res;
            }
        )
        // 


        $('#formpulsa').validate({
            rules: {
                pinpulsa: {
                    required: true,
                    cekpin : true,
                },
                nohp: {
                    ceknomor: true,
                    required : true
                },
                tipepulsa: {
                    required: true,
                },
                layanan: {
                    required: true,
                }
            },
            messages: {
                pinpulsa: {
                    required: 'Tidak boleh kosong',
                   cekpin : 'Pin salah'
                },
                nohp: {
                    ceknomor: 'Operator tidak diketahui',
                    required: 'Tidak boleh kosong'
                },
                tipepulsa: {
                    required: 'Tidak boleh kosong'
                },
                layanan: {
                    required: 'Tidak boleh kosong'
                }
            },
            //})
            submitHandler: function(form) {
$('.body-pesanpulsa').html(`<div class="text-center"><img src="${url}img/loading.gif"></div>`)
                $.ajax({
                    url: form.action,
                    type: form.method,
                    data: $(form).serialize(),
                    success: function(response) {
                      window.location.href = response;
                    }
                });
                return false;
            }

        })

        $('#formppob').validate({
            rules: {
                pin: {
                    required: true,
                    cekpin : true,
                },
                notujuan: {
                   
                    required : true
                },
                kategorippob: {
                    required: true,
                },
                layanan: {
                    required: true,
                }
            },
            messages: {
                pinpulsa: {
                    required: 'Tidak boleh kosong',
                   cekpin : 'Pin salah'
                },
                nohp: {
                  
                    required: 'Tidak boleh kosong'
                },
                kategorippob: {
                    required: 'Tidak boleh kosong'
                },
                layanan: {
                    required: 'Tidak boleh kosong'
                }
            },
            //})
            submitHandler: function(form) {
$('#bodypesanppob').html(`<div class="text-center"><img src="${url}img/loading.gif"></div>`)
                $.ajax({
                    url: form.action,
                    type: form.method,
                    data: $(form).serialize(),
                    success: function(response) {
                        window.location.href = '';
                    }
                });
                return false;
            }

        })

        // $('#buttonsubmitsosmed').click(function(e){
        //     e.preventDefault();
           $('#formsosmed').validate({
               rules : {
                   kategori : {
                       required : true
                   }, 
                   layanan : {
                       required : true
                   },
                   target : {
                       required : true
                   },
                   jumlah : {
                       required : true
                   }, 
                   pin : {
                       required : true,
                       cekpin : true
                   }
               },
               messages  : {
                   kategori : {
                       required : 'Tidak boleh kosong'
                   }, 
                   layanan : {
                       required : 'Tidak boleh kosong'
                   },
                   target : {
                       required : 'Tidak boleh kosong'
                   },
                   jumlah : {
                       required : 'Tidak boleh kosong'
                   }, 
                   pin : {
                       required : 'Tidak boleh kosong',
                       cekpin : 'Pin salah'
                   }
               },
               submitHandler: function(form) {
                $('.body-pesansosmed').html(`<div class="text-center"><img src="${url}img/loading.gif"></div>`)
                                $.ajax({
                                    url: form.action,
                                    type: form.method,
                                    data: $(form).serialize(),
                                    success: function(response) {
                                        window.location.href = '';
                                    }
                                });
                                return false;
                            }
                

           })
        })
   // })

    function get_total(quantity) {
        var rate = $("#rate").val();
        var result = eval(quantity) * rate;
        $('#total').val(result);
    }
