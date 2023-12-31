<?php

class Ambildata extends Controller
{
    public $date = DATE,
        $time = TIME;
    public function __construct()
    {
        $this->dbh = new Database;
        $this->db = $this->dbh->connect();
    }

    public function index()
    {
        header('Location:' . BASEURL . 'home');
    }

    public function kategorisosmed($code)
    {

        $data_provider = $this->model('Ambildata_model')->providersosmed($code);
        $api_id = $data_provider['api_id'];
        $api_key = $data_provider['api_key'];
        $link = $data_provider['link_service'];

        $postdata = [
            'api_id' => $api_id,
            'api_key' => $api_key
        ];

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $link);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postdata);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $chresult = curl_exec($ch);
        $result = json_decode($chresult, true);
        if ($result['status'] == false) {
            echo $result['data'];
            die;
        } else {
            $jumlah = 1;
            foreach ($result['data'] as $data) {
                $cek_kategori = $this->model('Ambildata_model')->cekkategori($data['category']);
                if ($cek_kategori > 0) {
                    echo $data['category'] . ' ==>  sudah ada di database';
                    echo '<br>';
                } else {
                    $input_kategori = $this->model('Ambildata_model')->inputkategori($data['category']);
                    if ($input_kategori > 0) {
                        echo '.' . $data['category'] . ' ==>  Berhasil di tambahkan';
                        echo '<br>';
                    } else {
                        echo 'gagal menambahkan';
                        echo '<br>';
                    }
                }
            }
        }
    }

    public function layanansosmed($code)
    {
        $data_provider = $this->model('Ambildata_model')->providersosmed($code);
        $api_id = $data_provider['api_id'];
        $api_key = $data_provider['api_key'];
        $link = $data_provider['link_service'];

        $postdata = [
            'api_id' => $api_id,
            'api_key' => $api_key
        ];

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $link);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postdata);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $chresult = curl_exec($ch);
        $result = json_decode($chresult, true);


        $jumlah = 0;
        echo '<table><th>Nama kategori</th><th>Ketarangan</th></table>';
        foreach ($result['data'] as $data) {
            $name = $data['name'];
            $name = strtr($data['name'], array(
                ' MEDANPEDIA' => WEB_NAME,
                ' Medanpedia' => WEB_NAME,
                ' medanpedia' => WEB_NAME,
                ' MP' =>  WEB_NAME,
                ' mp' => WEB_NAME,
                ' MP' => WEB_NAME,
            ));
            if (isset($data['description'])) {
                $deskripsi = $data['description'];
            } else {
                $deskripsi = $data['note'];
            }
            $cek_layanan = $this->model('Ambildata_model')->ceklayanansosmed($data['id']);
            if ($cek_layanan > 0) {
                echo $data['name'] . '  Sudah ada di database';
            } else {
                $input_kategori = $this->model('Ambildata_model')->inputlayanansosmed($data['id'], $data['category'], $name, $data['price'], $data['min'], $data['max'], $deskripsi, $code);
                if ($input_kategori > 0) {
                    echo '.' . $data['name'] . ' Berhasil di tambahkan';
                    echo '<br>';
                    $jumlah++;
                } else {
                    echo 'gagal menambahkan';
                    echo '<br>';
                }
            }
        }
        echo '<div style="position:fixed; left:500px; top:10px;">Total data yang masuk ke database :' . $jumlah . '</div>';
    }

    public function kategorippob()
    {
        $result = $this->model('Digiflazz_model')->ceklayanan();
        $tambah = 0;
        foreach ($result->data as $data) {
            $brand = $data->brand;
            $tipe = $data->type;
            $kategori = $data->category;
            $kategori2 = strtr($kategori, array(
                'Paket SMS & Telpon' => 'Paket SMS Telpon',
                'China TOPUP' => 'Pulsa Internasional',
                'Malaysia TOPUP' => 'Pulsa Internasional',
                'Philippines TOPUP' => 'Pulsa Internasional',
                'Singapore TOPUP' => 'Pulsa Internasional',
                'Thailand TOPUP' => 'Pulsa Internasional',
                'Vietnam TOPUP' => 'Pulsa Internasional',
            ));


            $cekkategori = $this->model('Ambildata_model')->cekkategorippob($kategori2, $tipe);
            if ($cekkategori > 0) {

                echo '.' . $kategori . ' Sudah ada di database';
                echo '<br>';
            } else {

                $input = $this->model('Ambildata_model')->inputkategorippob($kategori2, $brand,  $tipe);

                if ($input  > 0) {
                    echo '.' . $kategori . ' Berhasil diinput ke database database';
                    echo '<br>';
                    $tambah++;
                } else {
                    echo 'gagal input';
                    echo '<br>';
                }
            }
        }
        echo '<div style="position:fixed; left:500px; top:10px;">Total data yang masuk ke database :' . $tambah . '</div>';
    }
    public function layananppob()
    {

        $result = $this->model('Digiflazz_model')->ceklayanan();
        $tambah = 0;
        foreach ($result->data as $data) {
            $sid = $data->buyer_sku_code;
            $category = $data->brand;
            $kategori = $data->type;
            $type = $data->category;
            $service = $data->product_name;
            $description = $data->desc;
            $price = $data->price;
            $ht_status = $data->buyer_product_status;
            $type2 = strtr($type, array(
                'Paket SMS & Telpon' => 'Paket SMS Telpon',
                'China TOPUP' => 'Pulsa Internasional',
                'Malaysia TOPUP' => 'Pulsa Internasional',
                'Philippines TOPUP' => 'Pulsa Internasional',
                'Singapore TOPUP' => 'Pulsa Internasional',
                'Thailand TOPUP' => 'Pulsa Internasional',
                'Vietnam TOPUP' => 'Pulsa Internasional',
                'TV' => 'Streaming',
            ));

            $ceklayanan = $this->model('Ambildata_model')->ceklayananppob($sid);
            if ($ceklayanan > 0) {

                echo "<br>Layanan Sudah Ada Di Database => $service | $sid \n <br />";
            } else {
                $input = $this->model('Ambildata_model')->inputlayananppob($sid, $category, $service, $description, $price, $ht_status, $type2, $kategori);
                if ($input  > 0) {
                    echo "===============<br>Layanan Top Up Berhasil Di Tambahkan<br><br>ID Layanan : $sid<br>Operator : $category<br>Nama Layanan : $service<br>Tipe : $type<br>Deskripsi : $description<br>Status : $ht_status<br>===============<br>";
                    $tambah++;
                } else {
                    echo 'gagal input';
                    echo '<br>';
                }
            }
        }
        echo '<div style="position:fixed; left:500px; top:10px;">Total data yang masuk ke database :' . $tambah . '</div>';
    }

    public function kategoripascabayar()
    {

        $response = $this->model('Ambildata_model')->curldigiflaz($url, $data, $header);

        $result = json_decode($response, true);
        foreach ($result['data'] as $data) {
            $category = $data['brand'];
            $type2 = $data['category'];
            $tambah = 0;

            $cekkategori = $this->model('Ambildata_model')->cekkategorippob($category, $type2);
            if ($cekkategori > 0) {

                echo '.' . $category . ' Sudah ada di database';
                echo '<br>';
            } else {
                $input = $this->model('Ambildata_model')->inputkategorippob($category, $type2);
                if ($input  > 0) {
                    echo '.' . $category . ' Berhasil diinput ke database database';
                    echo '<br>';
                    $tambah++;
                } else {
                    echo 'gagal input';
                    echo '<br>';
                }
            }

            echo '<div style="position:fixed; left:500px; top:10px;">Total data yang masuk ke database :' . $tambah . '</div>';
        }
    }
    public function layananpascabayar()
    {
        $data_provider = $this->model('Ambildata_model')->providerppob('DG-PULSA');
        $p_apiid = $data_provider['api_id'];
        $p_apikey = $data_provider['api_key'];

        $url = "https://api.digiflazz.com/v1/price-list";
        $sign = md5("$p_apiid+$p_apikey+pricelist");

        $data = array(
            'cmd' => "pasca",
            'username' => $p_apiid,
            'sign' => $sign
        );
        $header = array(
            'Content-Type: application/json',
        );
        $response = $this->model('Ambildata_model')->curldigiflaz($url, $data, $header);

        $result = json_decode($response);

        foreach ($result->data as $data) {

            $sid = $data->buyer_sku_code;
            $category = $data->brand;
            $type = $data->category;
            $service = $data->product_name;
            $ht_status = $data->buyer_product_status;

            // end get data service 

            if ($ht_status == true) {
                $status = "Normal";
            } else if ($ht_status == false) {
                $status = "Gangguan";
            }

            $ceklayanan = $this->model('Ambildata_model')->ceklayananpascabayar($sid);
            if ($ceklayanan > 0) {
                echo "<br>Layanan Sudah Ada Di Database => $service | $sid \n <br />";
            } else {
                $input = $this->model('Ambildata_model')->inputlayananpascabayar($sid, $category, $service, $type,  $ht_status);
                if ($input  > 0) {
                    echo "===============<br>Layanan Pascabayar Berhasil Di Tambahkan<br><br>ID Layanan : $sid<br>Kategori : $category<br>Nama Layanan : $service<br>Tipe : $type<br>Status : $status<br>===============<br>";
                } else {
                    echo 'gagal input';
                    echo '<br>';
                }
            }
        }
    }

    public function cektagihan()
    {
        $data_provider = $this->model('Ambildata_model')->providerppob('DG-PULSA');
        $order_id = acak_nomor(3) . acak_nomor(4);
        $api_key = $data_provider['api_key'];
        $api_id = $data_provider['api_id'];

        $url = "https://api.digiflazz.com/v1/transaction";
        $sign = md5($api_id . $api_key . $order_id);

        $api_postdata = array(
            'commands' => "inq-pasca",
            'username' => $api_id,
            'buyer_sku_code' => 'pln',
            'customer_no' => "530000000001",
            'ref_id' => $order_id,
            'testing' => true,
            'sign' => $sign
        );
        $header = array(
            'Content-Type: application/json',
        );
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($api_postdata));
        $chresult = curl_exec($ch);
        curl_close($ch);
        $json_result = json_decode($chresult, true);
        $result = json_decode($chresult);
        var_dump($result);
    }








    public function statussosmed($provider)
    {

        if ($provider == 'MEDANPEDIA') {
            $url = "https://medanpedia.co.id/api/status";
        } else if ($provider == 'IRVANKEDE') {
            $url = "https://api.irvankede-smm.co.id/status";
        }

        $check_order = $this->model('Ambildata_model')->cekordersosmed($provider);

        if ($check_order == false) {
            die("Pesanan Berstatus Pending Tidak Ditemukan.");
        } else {
            foreach ($check_order as $data_order) {
                $o_oid = $data_order['oid'];
                $o_poid = $data_order['provider_oid'];
                $o_provider = $data_order['provider'];
                $username = $data_order['user'];
                $layanan = $data_order['layanan'];
                $tujuan = $data_order['target'];

                $data_user = $this->model('Home_model')->datauser($username);
                $nohp = $data_user['no_hp'];

                if ($o_provider == "MANUAL") {
                    echo "Pesanan Manual<br />";
                } else {

                    $getService = $this->db->prepare("SELECT * FROM layanan_sosmed WHERE layanan = '$layanan' AND provider = '$provider'");
                    $getService->execute();
                    $getDataService = $getService->fetchAll();

                    $data_provider = $this->model('Ambildata_model')->providersosmed($provider);

                    $p_apikey = $data_provider['api_key'];
                    $p_api_id = $data_provider['api_id'];



                    $postdata = array(
                        'api_id' => $p_api_id,
                        'api_key' => $p_apikey,
                        'id' => $o_poid,
                    );
                    // echo json_encode($data); 
                    $ch = curl_init();
                    curl_setopt($ch, CURLOPT_URL, $url);
                    curl_setopt($ch, CURLOPT_POST, 1);
                    curl_setopt($ch, CURLOPT_POSTFIELDS, $postdata);
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                    $chresult = curl_exec($ch);
                    $result = json_decode($chresult, true);

                    // echo $result;
                    $sn = $result['data']['status'];
                    if (isset($result['status']) and $result['status'] == true) {
                        if ($sn == 'Success') {
                            $status = 'Success';
                        } elseif ($sn == 'Error') {
                            $status = 'Error';
                        } elseif ($sn == 'Partial') {
                            $status = 'Partial';
                        } elseif ($sn == 'Processing') {
                            $status = 'Processing';
                        } else {
                            $status = 'Pending';
                        }


                        $start_count = (isset($result['data']['start_count'])) ? $result['data']['start_count'] : 0;
                        $remains = (isset($result['data']['remains'])) ? $result['data']['remains'] : 0;
                        $update_order2 = $this->db->prepare("UPDATE semua_pembelian SET status = '$status' WHERE id_pesan = '$o_oid'");
                        $update_order2->execute();
                        $update_order = $this->db->prepare("UPDATE pembelian_sosmed SET status = '" . $status . "', remains = '" . $remains . "', start_count = '" . $start_count . "',  date = '" . date('Y-m-d') . "' WHERE oid = '$o_oid'");
                        $update_order->execute();
                        if ($update_order->rowCount() > 0) {

                            // kirim notif wa jika status sukses
                            if ($status == 'Success') {
                                $sendwa = new MPWA();

                                $msg =
                                    '
*Pesanan anda dengan layanan ' . $layanan . ', Id #' . $o_oid . ' Telah sukses.*
Tujuan :  ' . $tujuan . '
Jumlah : ' . $data_order['jumlah'] . '
';
                                $sendwa->sendMessage($nohp, $msg);
                            }
                            ///
                            echo "===============<br>Berhasil Menampilkan Data Status Sosmed<br><br>ID Pesanan : $o_oid<br>Remains : $remains<br>Status : $status<br>===============<br>";
                        } else {
                            echo "Gagal Menampilkan Data Status Sosmed.<br />";
                        }
                    }
                }
            }
        }
    }

    public function statusppob()
    {
        $sendwa = new Menzwa();
        $check_order = $this->model('Ambildata_model')->cekorderppob('DG-PULSA');

        if ($check_order == false) {
            die("Pesanan Berstatus Pending Tidak Ditemukan.");
        } else {
            foreach ($check_order as $data_order) {
                $o_oid = $data_order['oid'];
                $o_poid = $data_order['provider_oid'];
                $o_provider = $data_order['provider'];
                $username = $data_order['user'];
                $layanan = $data_order['layanan'];
                $provider = $data_order['provider'];

                $getService = $this->db->prepare("SELECT * FROM layanan_pulsa WHERE layanan = '$layanan' AND provider = 'DG-PULSA'");
                $getService->execute();
                $getDataService = $getService->fetch();
                $data_provider = $this->model('Ambildata_model')->providerppob('DG-PULSA');

                $p_apikey = $data_provider['api_key'];
                $p_api_id = $data_provider['api_id'];

                $url = "https://api.digiflazz.com/v1/transaction";
                $sign = md5("$p_api_id" . "$p_apikey" . $o_oid);

                $header = array(
                    'Content-Type: application/json',
                );

                $data = array(
                    'command' => 'status-pasca',
                    'username' => $p_api_id,
                    'buyer_sku_code' => $getDataService['service_id'],
                    'customer_no' => $data_order['target'],
                    'ref_id' => $o_oid,
                    'sign' => $sign
                );
                // echo json_encode($data);
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
                curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
                $result = curl_exec($ch);
                $result = json_decode($result, true);
                // echo $result;

                $sn = $result['data']['sn'];
                $ht_status = $result['data']['status'];

                if ($ht_status == "Pending") {
                    $status = "Pending";
                } else if ($ht_status == "Gagal") {
                    $status = "Error";
                } else if ($ht_status == "Sukses") {
                    $status = "Success";
                }

                $datauser = $this->model('Home_model')->datauser($username);
                $nohp = $datauser['no_hp'];
                if ($ht_status == "Sukses") {
                    $msg =
                        '
    *PESANAN ANDA TELAH SUKSES*
    ---------------------------
    id order : *' . $o_oid . '*
    Layanan : *' . $layanan . '*
    Status : *' . $status . '*
    No sn/keterangan : *' . $sn . '*
    ';
                    $sendwa->sendMessage($nohp, $msg);
                } else if ($ht_status == "Gagal") {
                    $msg =
                        '
*Yah Pesananmu gagal:(*
---------------------------
id order : *' . $o_oid . '*
Layanan : *' . $layanan . '*
Status : *' . $status . '*
keterangan : *' . $sn . '*
';
                    $sendwa->sendMessage($nohp, $msg);
                }
                $update11 = $this->db->prepare("UPDATE semua_pembelian SET status = '$status' WHERE id_pesan = '$o_oid'");
                $update11->execute();
                $update22 = $this->db->prepare("UPDATE pembelian_pulsa SET status = '$status', keterangan = '$sn' WHERE oid = '$o_oid'");
                $update22->execute();
                if ($update11->rowCount() > 0 and $update22->rowCount() > 0) {
                    echo "===============<br>Berhasil Menampilkan Data Status Top Up<br><br>ID Pesanan : $o_oid<br>Keterangan : $sn<br>Status : $status<br>===============<br>";
                } else {
                    echo "Gagal Menampilkan Data Status Top Up.<br />";
                }
            }
        }
    }


    //CALLBACK DIGIFLAZ
    public function callbackdigiflaz()
    {
        $sendwa = new MPWA();

        $get = file_get_contents('php://input');
        $header = getallheaders();

        function DFStatus($x)
        {
            if ($x == 'Transaksi Pending') $str = 'Pending';
            if ($x == 'Transaksi Gagal') $str = 'Error';
            if ($x == 'Transaksi Sukses') $str = 'Success';
            return (!$str) ? 'Pending' : $str;
        }

        if (isset($header['x-digiflazz-event']) && isset($header['x-digiflazz-delivery']) && isset($header['x-hub-signature']) && in_array($header['User-Agent'], ['Digiflazz-Hookshot', 'DigiFlazz-Pasca-Hookshot'])) {
            $array = json_decode($get, true)['data'];
            $json = json_encode($array);

            $status = DFStatus($array['message']);
            $trxid = $array['trx_id']; // ID Transaksi DigiFlazz
            $refid = $array['ref_id']; // ID Transaksi dari Panel
            $note = $array['sn'];
            $last = $array['buyer_last_saldo'];

            $format = $refid . ' -> ' . $array['message'] . '<br>' . $note;
            print $format;


            $this->dbh->query("SELECT count(*) FROM pembelian_pulsa WHERE oid = '$refid' AND status = 'Pending'");
            $this->dbh->execute();
            if ($this->dbh->hitungBaris2() == 1) {
                // menampilkan data pesanan (array)
                $data_orderr =   $this->db->prepare("SELECT * FROM pembelian_pulsa WHERE oid = '$refid'");
                $data_orderr->execute();
                $data_order = $data_orderr->fetch();
                $o_oid = $data_order['oid'];
                $username = $data_order['user'];
                $layanan = $data_order['layanan'];

                //
                // data username 
                $datauser = $this->model('Home_model')->datauser($username);
                $nohp = $datauser['no_hp'];
                //
                // kirim wa
                if ($status == 'Success') {
                    $msg =
                        '
*PESANAN ANDA TELAH SUKSES*
---------------------------
id order : *' . $o_oid . '*
Layanan : *' . $layanan . '*
Status : *' . $status . '*
No sn/keterangan : *' . $note . '*
';
                    $sendwa->sendMessage($nohp, $msg);
                } else if ($status == 'Error') {
                    $msg =
                        '
*Yah Pesananmu gagal:(*
---------------------------
id order : *' . $o_oid . '*
Layanan : *' . $layanan . '*
Status : *' . $status . '*
keterangan : *' . $note . '*
';
                    $sendwa->sendMessage($nohp, $msg);
                }
                //
                $update = $this->db->prepare("UPDATE semua_pembelian SET status = '$status' WHERE id_pesan = '$refid'");
                $update->execute();
                $updatejuga = $this->db->prepare("UPDATE pembelian_pulsa SET status = '$status', keterangan = '$note' WHERE oid = '$refid'");
                $updatejuga->execute();
            }
        } else {
            print 'Access Denied!';
        }
    }




    // mutasiiiii 


    public function mutasibca()
    {
        $date = DATE;
        $data_bca = $this->model('Admin_model')->accountbank();
        $usernamebca = $data_bca['user_id'];
        $passwordbca = $data_bca['password'];

        $bca = new IbParser();
        $datamutasi =     $bca->getTransactions('BCA', $usernamebca, $passwordbca);
        foreach ($datamutasi as $data) {
            $keterangan = $data[1];
            $tipe = $data[2];
            $amount = $data[3];
            var_dump($amount);
            if ($tipe == 'DB') {
                $type = 'Uang Keluar';
            } else {
                $type = 'Uang masuk';
            }
            $mutasibca = $this->model('Ambildata_model')->cekmutasi('mutasi_bank', 'keterangan', $keterangan);
            if ($mutasibca > 0) {
                echo '<br> Data sudah ada di database <br>';
            } else {
                $cekdepo = $this->model('Ambildata_model')->cekdepositmutasi($amount);
                if ($cekdepo == 1) {
                    $insertmutasi = $this->db->prepare("INSERT INTO mutasi_bank VALUES ('','$type','$keterangan','$amount','$date','BCA')");
                    $insertmutasi->execute();
                    $updatemutasidepopsit = $this->model('Ambildata_model')->updatemutasi($amount, 'BCA');
                    if ($updatemutasidepopsit > 0 && $insertmutasi->rowCount() > 0) {
                        echo '' . $keterangan . ' RP ' . $amount . ' =>> berhasil di update <br>';
                    } else {
                        echo 'Kesalahan system (105), mohon infokan error ini ke dev';
                    }
                } else {
                    echo '<br>Data mutasi BCA yang terdeteksi tidak ada yang sesuai dengan data deposit user<br>';
                }
            }
        }
    }
    //mutasi ovo




    public function getidalfamart()
    {
        $date = $this->date;
        $data_gopay = $this->model('Admin_model')->accountgopay();
        $gopay = new GojekPay($data_gopay['token']);
        $hasil = json_decode($gopay->getTransactionHistory(), true);
        if (isset($hasil['data']['success'])) {
            foreach ($hasil['data']['success'] as $data) {
                $desc = $data['description'];
                $carialfa = strpos($desc, "#Alfamart");
                if (is_int($carialfa)) {
                    $id = substr($desc, 18, 15);
                    $amount = $data['amount'];
                    $cekvoucher = $this->model('Ambildata_model')->cekvoucher($id);
                    if ($cekvoucher > 0) {
                        echo $id . ' ==> Kode tersebut sudah ada di database dan masih aktif<br>';
                    } else {
                        $insertvoucher =  $this->db->prepare("INSERT INTO kode_voucher VALUES ('','$id','$amount','Aktif','','$date','')");
                        $insertvoucher->execute();
                        if ($insertvoucher->rowCount() > 0) {
                            echo $id . ' ==> Sudah dimasukan kedalam voucher dan bisa digunakan<br>';
                        } else {
                            echo 'Error (108), mohon infokan error ini ke developer';
                        }
                    }
                }
            }
        }
    }
}
