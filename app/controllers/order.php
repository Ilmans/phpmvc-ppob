<?php

class Order extends Controller
{

    protected $db, $dbh;

    public function __construct()
    {
        $this->dbh = new Database;
        $this->db = $this->dbh->connect();
        $this->token = new Token;
    }
    public function sosmed()
    {
        if ($this->token->validasi($_POST['token']) == false) {
            die('csrf vailed');
        }
        $kategori = filter($_POST['kategori']);
        $layanan = filter($_POST['layanan']);
        $target = filter($_POST['target']);
        $jumlah = filter($_POST['jumlah']);
        $min = $_POST['min'];
        $max = $_POST['max'];
        $pin = filter($_POST['pin']);
        $harga = filter($_POST['totalharga']);
        $post_comments = $_POST['comments'];
        $datauser =  $data['user'] = $this->model('Home_model')->datauser($_SESSION['user']['username']);
        $username = $datauser['username'];

        $data_layanan = $this->model('Order_model')->ceklayanansosmed($layanan);


        $hitung = count(explode(PHP_EOL, $post_comments));
        $replace = str_replace("\r\n", '\r\n', $post_comments);
        $kategori = $data_layanan['kategori'];
        $layanan = $data_layanan['layanan'];
        $cek_harga = $data_layanan['harga'] / 1000;
        $hitung = count(explode(PHP_EOL, $post_comments));
        $replace = str_replace("\r\n", '\r\n', $post_comments);
        if (!empty($post_comments)) {
            $jumlah = $hitung;
        } else {
            $jumlah = $jumlah;
        }

        if (!empty($post_comments)) {
            $harga = $cek_harga * $hitung;
        } else {
            $harga = $cek_harga * $jumlah;
        }


        $provider = $data_layanan['provider'];
        $data_provider = $this->model('Order_model')->cekprovider($provider, 'sosmed');
        $order_id = acak_nomor(3) . acak_nomor(4);

        // Get Start Count
        if ($data_layanan['kategori'] == "Instagram Likes" and "Instagram Likes Indonesia" and "Instagram Likes [Targeted Negara]" and "Instagram Likes/Followers Per Minute") {
            $start_count = likes_count($target);
        } else if ($data_layanan['kategori'] == "Instagram Followers No Refill/Not Guaranteed" and "Instagram Followers Indonesia" and "Instagram Followers [Negara]" and "Instagram Followers [Refill] [Guaranteed] [NonDrop]") {
            $start_count = followers_count($target);
        } else if ($data_layanan['kategori'] == "Instagram Views") {
            $start_count = views_count($target);
        } else {
            $start_count = 0;
        }

        // validasi 
        if ($data_layanan == false) {
            $_SESSION['hasil'] = [
                'alert' => 'danger',
                'pesan' => 'Layanan tidak tersedia!'
            ];
        } else if ($pin != $datauser['pin']) {
            $_SESSION['hasil'] = [
                'alert' => 'danger',
                'pesan' => 'Pin salah, cek kembali pin kamu!'
            ];
        } else if ($datauser['saldo_top_up'] < $harga) {
            $_SESSION['hasil'] = [
                'alert' => 'danger',
                'pesan' => 'Saldo kamu tidak cukup untuk melakukan pesanan ini!'
            ];
        } else if ($jumlah < $data_layanan['min']) {
            $_SESSION['hasil'] = [
                'alert' => 'danger',
                'pesan' => 'Minimal Pesanan tidak sesuai!'
            ];
        } else if ($jumlah > $data_layanan['max']) {
            $_SESSION['hasil'] = [
                'alert' => 'danger',
                'pesan' => 'Maksimal pesanan tidak sesuai!'
            ];
        } else {
            if ($provider == "MANUAL") {
                $api_postdata = "";
            } else if ($provider == "IRVANKEDE") {
                if ($post_comments == false) {
                    $postdata = "api_id=" . $data_provider['api_id'] . "&api_key=" . $data_provider['api_key'] . "&service=" . $data_layanan['provider_id'] . "&target=$target&quantity=$jumlah";
                } else if ($post_comments == true) {
                    $postdata = "api_id=" . $data_provider['api_id'] . "&api_key=" . $data_provider['api_key'] . "&service=" . $data_layanan['provider_id'] . "&target=$target&custom_comments=$post_comments";
                }
                $url = "https://irvankede-smm.co.id/api/order";
            } else if ($provider == "MEDANPEDIA") {
                if ($post_comments == false) {
                    $postdata = "api_id=" . $data_provider['api_id'] . "&api_key=" . $data_provider['api_key'] . "&service=" . $data_layanan['provider_id'] . "&target=$target&quantity=$jumlah";
                } else if ($post_comments == true) {
                    $postdata = "api_id=" . $data_provider['api_id'] . "&api_key=" . $data_provider['api_key'] . "&service=" . $data_layanan['provider_id'] . "&target=$target&custom_comments=$post_comments";
                }
                $url = "https://medanpedia.co.id/api/order";
            } else {
                $_SESSION['hasil'] = [
                    'alert' => 'danger',
                    'pesan' => 'System error'
                ];
            }
            // api
            $result = $this->model('Order_model')->apisosmed($url, $postdata);


            if ($provider == "IRVANKEDE" and $result['status'] == false) {
                $_SESSION['hasil'] = [
                    'alert' => 'danger',
                    'pesan' => 'Ups, Server Maintenance'
                ];
            } else if ($provider == "MEDANPEDIA" and $result['status'] == false) {
                if ($result['data'] == 'Saldo tidak mencukupi') {
                    $_SESSION['hasil'] = [
                        'alert' => 'danger',
                        'pesan' => 'Ups, Server gangguan, silahkan coba beberapa saat lagi'
                    ];
                } else {
                    $_SESSION['hasil'] = [
                        'alert' => 'danger',
                        'pesan' => 'Ups, Server Maintenance'
                    ];
                }
                //header('Location:' . BASEURL . 'home');
                die;
            } else {
                if ($provider == "IRVANKEDE") {
                    $provider_oid = $result['data']['id'];
                } else if ($provider == "MEDANPEDIA") {
                    $provider_oid = $result['data']['id'];
                }


                //
                $top_layanan = $this->model('Order_model')->toplayanan($layanan);
                $top_user = $this->model('Order_model')->topuser();
                if ($this->model('Order_model')->insertordersosmed($order_id, $provider_oid, $layanan, $target, $jumlah, $start_count, $harga, $provider, 'WEB') > 0) {
                    $this->model('Order_model')->insertsemuapembelian($order_id, $kategori, $layanan, $harga, $target, $username, 'WEB', 'Pending');
                    $updateuser = $this->model('Order_model')->updateuser($harga);
                    $insertriwayat =  $this->model('Lainnya')->riwayatsaldo('Pengurangan Saldo', $harga, 'Mengurangi Saldo Melalui Pemesanan Sosial Media Dengan Kode Pesanan : WEB-' . $order_id, $username);

                    // 
                    $total = $top_user['total'];
                    $jumlah3 = $top_user['jumlah'];
                    if ($top_user == false) {
                        $this->model('Order_model')->inserttopuser($username, $harga);
                    } else {

                        $this->model('Order_model')->updatetopuser($total, $jumlah3, $harga);
                    }
                    if ($top_layanan == false) {
                        $this->model('Order_model')->inserttoplayanan($layanan, $harga);
                    } else {
                        $this->model('Order_model')->updatetoplayanan($total, $jumlah3, $harga, $layanan);
                    }
                    $jumlah2 = number_format($jumlah, 0, ',', '.');

                    $_SESSION['hasil'] = [
                        'alert' => 'success',
                        'pesan' => 'Sip, Pesanan Kamu Telah Kami Terima. <br> ID order : ' . $order_id . '<br> Target : ' . $target . ' <br> Layanan : ' . $layanan . '<br> Jumlah Pesan : ' . $jumlah2
                    ];
                } else {
                    $_SESSION['hasil'] = [
                        'alert' => 'danger',
                        'pesan' => 'Error 100, System mengalami gangguan, mohon infokan ini ke admin'
                    ];
                }
            }
        }
        // unset($_SESSION['token']);
        //header('Location:' . BASEURL . 'home');
    }



    public function ppob()
    {


        if ($this->token->validasi($_POST['token']) == false) {
            die('csrf vailed');
        }
        //console.log
        $username = $_SESSION['user']['username'];
        $target = filter($_POST['nohp']);
        $layanan = filter($_POST['layanan']);
        $datauser =  $data['user'] = $this->model('Home_model')->datauser($_SESSION['user']['username']);
        $data_layanan = $this->model('Order_model')->ceklayananppob($layanan);
        $harga = $data_layanan['harga'];
        $namalayanan = $data_layanan['layanan'];
        $operator = $data_layanan['operator'];
        $provider = $data_layanan['provider'];
        $order_id = acak_nomor(3) . acak_nomor(4);
        if ($datauser['saldo_top_up'] < $harga) {
            $_SESSION['hasil'] = [
                'alert' => 'danger',
                'pesan' => 'Saldo kamu tidak cukup untuk melakukan pesanan ini!'
            ];
        } else {

            $result = $this->model('Digiflazz_model')->orderppob($data_layanan['provider_id'], $target, $order_id);

            $statusasal = $result['data']['status'];
            if ($statusasal == 'Sukses') {
                $statusnya = 'Success';
            } else if ($statusasal == 'Pending') {
                $statusnya = 'Pending';
            } else if ($statusasal == 'Gagal') {
                $statusnya = 'Gagal';
            }
            if ($statusasal == "Gagal") {
                if ($result['data']['message'] == 'Saldo tidak cukup') {
                    $_SESSION['hasil'] = [
                        'alert' => 'danger',
                        'pesan' => 'Ups, Server gangguan, silahkan coba beberapa saat lagi'
                    ];
                } else {
                    $_SESSION['hasil'] = [
                        'alert' => 'danger',
                        'pesan' => 'Ups, ' . $result['data']['message']
                    ];
                }
            } else {

                $provider_oid = $order_id;
                $top_user = $this->model('Order_model')->topuser();
                $this->model('Order_model')->insertorderppob($order_id, $provider_oid, $namalayanan, $harga, $target, $provider, 'WEB', $username, $statusnya);

                $nomornya = $datauser['no_hp'];
                $msg =
                    'Pesanan kamu telah kami terima #' . $order_id . '*
Layanan ; *' . $namalayanan . '*
Harga : *' . $harga . '*
No tujuan : *' . $target . '*
Status : *' . $statusnya . '*
Tgl & waktu : ** 

Untuk cek status pesanan silahkan ketik *status.idpesanan*
';

                $this->model('Order_model')->updateuser($harga);
                $insertriwayat =  $this->model('Lainnya')->riwayatsaldo('Pengurangan Saldo', $harga, 'Mengurangi Saldo  Melalui Pemesanan PPOB Dengan Kode Pesanan : WEB-.' . $order_id, $username);
                $this->model('Order_model')->insertsemuapembelian($order_id, $operator, $namalayanan, $harga, $target, $username, 'WEB', $statusnya);
                $total = $top_user['total'];
                $jumlah3 = $top_user['jumlah'];
                if ($top_user == false) {
                    $this->model('Order_model')->inserttopuser($username, $harga);
                } else {
                    $this->model('Order_model')->updatetopuser($total, $jumlah3, $harga);
                }
                $jumlah2 = number_format($harga, 0, ',', '.');

                $_SESSION['hasil'] = [
                    'alert' => 'success',
                    'pesan' => 'Sip, Pesanan Kamu Telah Kami Terima. <br> ID order : ' . $order_id . '<br> Layanan : ' . $namalayanan . '<br> Harga : ' . $jumlah2
                ];
            }
        }
    }

    public function pascabayar()
    {
        $date = DATE;
        $time = TIME;
        $refid = $_POST['refid'];
        $username = $_SESSION['user']['username'];
        $buyerskucode = $_POST['skucode'];
        $customerno = $_POST['customerno'];
        $penerima = $_POST['customername'];
        $datauser =  $data['user'] = $this->model('Home_model')->datauser($_SESSION['user']['username']);
        $data_layanan = $this->model('Order_model')->ceklayananpascabayar($buyerskucode);
        $harga = $_POST['harga'];
        $namalayanan = $data_layanan['layanan'];
        $kategori = $data_layanan['kategori'];
        $provider = $data_layanan['provider'];
        if ($datauser['saldo_top_up'] < $harga) {
            $_SESSION['hasil'] = [
                'alert' => 'danger',
                'pesan' => 'Saldo kamu tidak cukup untuk melakukan pesanan ini!'
            ];
        } else {
            if ($provider == "MANUAL") {
                $api_postdata = "";
            } else {
                $result = $this->model('Digiflazz_model')->orderpascabayar($buyerskucode, $customerno, $refid);
            }
            // var_dump($result);
            $statusasal = $result['data']['status'];
            if ($statusasal == 'Sukses') {
                $statusnya = 'Success';
            } else if ($statusasal == 'Pending') {
                $statusnya = 'Pending';
            } else if ($statusasal == 'Gagal') {
                $statusnya = 'Gagal';
            }
            if ($statusasal == "Gagal") {
                if ($result['data']['message'] == 'Saldo tidak cukup') {
                    $_SESSION['hasil'] = [
                        'alert' => 'danger',
                        'pesan' => 'Ups, Server gangguan, silahkan coba beberapa saat lagi'
                    ];
                } else {
                    $_SESSION['hasil'] = [
                        'alert' => 'danger',
                        'pesan' => 'Ups, ' . $result['data']['message']
                    ];
                }
            } else {
                $provider_oid = $refid;
                $keterangan = $result['data']['sn'];
                $top_user = $this->model('Order_model')->topuser();
                $insert = $this->db->prepare("INSERT INTO pembelian_pascabayar VALUES('','$refid','$buyerskucode','$buyerskucode','$username','$kategori','$namalayanan','$harga','0','0','$customerno','$penerima','','','','','$keterangan','$statusnya','$date','$time','WEB','$provider','0')");
                $insert->execute();
                if ($insert->rowCount() > 0) {
                    // $wa = new Menzwa();
                    $nomornya = $datauser['no_hp'];
                    $msg =
                        'Pesanan kamu telah kami terima #' . $refid . '*
Layanan ; *' . $refid . '*
Harga : *' . $harga . '*
No tujuan : *' . $customerno . '*
Status : *' . $statusnya . '*
Tgl & waktu : ** 

Untuk cek status pesanan silahkan ketik *status.idpesanan*
';
                    // $wa->sendMessage($nomornya, $msg);
                    $this->model('Order_model')->updateuser($harga);
                    $insertriwayat =  $this->model('Lainnya')->riwayatsaldo('Pengurangan Saldo', $harga, 'Mengurangi Saldo  Melalui Pembayaran Pascabayar Dengan Kode Pesanan : WEB-.' . $refid, $username);
                    $this->model('Order_model')->insertsemuapembelian($refid, $kategori, $namalayanan, $harga, $customerno, $username, 'WEB', $statusnya);
                    $total = $top_user['total'];
                    $jumlah3 = $top_user['jumlah'];
                    if ($top_user == false) {
                        $this->model('Order_model')->inserttopuser($username, $harga);
                    } else {
                        $this->model('Order_model')->updatetopuser($total, $jumlah3, $harga);
                    }
                    $jumlah2 = number_format($harga, 0, ',', '.');

                    $_SESSION['hasil'] = [
                        'alert' => 'success',
                        'pesan' => 'Sip, Pembayaran Kamu Telah Kami Terima. <br> ID order : ' . $refid . '<br> Layanan : ' . $namalayanan . '<br> Total : ' . $jumlah2
                    ];
                } else {
                    $_SESSION['hasil'] = [
                        'alert' => 'danger',
                        'pesan' => 'Error 100, System mengalami gangguan, mohon infokan ini ke admin'
                    ];
                }
            }
        }
        header('Location:' . BASEURL . 'home');
    }
}
