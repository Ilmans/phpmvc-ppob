<?php


class Snap extends Controller
{
    protected $dbh, $db;
    public $date = DATE, $time = TIME;


    public function __construct()
    {
        $this->db = new Database;
        $this->dbh = $this->db->connect();
        new Session;
    }
    public function index()
    {
        $username = $_SESSION['user']['username'];
        if ($id = $_GET['order_id']) {

            $server_key = 'Mid-server-Tf6UMg5WJ6nXhxM0q4WTLccL';
            $url        = 'https://api.midtrans.com/v2/' . $id . '/status';
            $ch         = curl_init();
            $curl_options = array(
                CURLOPT_URL => $url,
                CURLOPT_HTTPHEADER => array(
                    'Content-Type: application/json',
                    'Accept: application/json',
                    'Authorization: Basic ' . base64_encode($server_key . ':')
                ),
                CURLOPT_RETURNTRANSFER => 1,
                // CURLOPT_CAINFO => dirname(__FILE__) . "/veritrans/cacert.pem"
            );
            curl_setopt_array($ch, $curl_options);

            $result = curl_exec($ch);
            curl_close($ch);

            $hasil =  json_decode($result, true);

            if ($hasil['transaction_status'] == 'settlement') {
                $this->db->query("UPDATE deposit set status = 'Success' where kode_deposit = '$id' ");
                $this->db->execute();
                //cek saldo user
                $data_metod = $this->dbh->prepare("SELECT * FROM users WHERE username = '$username' ");
                $data_metod->execute();
                $res        = $data_metod->fetch();

                $saldoakhir = $hasil['gross_amount'] + $res['saldo_top_up'];
                $this->db->query("UPDATE users set saldo_top_up = '$saldoakhir' where username = '$username' ");
                $this->db->execute();
                $_SESSION['hasil'] = [
                    'alert' => 'success',
                    'pesan' => 'Top Up Saldo Deposit Berhasil'
                ];
            } else {
                $this->db->query("DELETE FROM deposit WHERE kode_deposit = '$id' ");
                $this->db->execute();
                $_SESSION['hasil'] = [
                    'alert' => 'danger',
                    'pesan' => 'Top Up Saldo Deposit Gagal'
                ];
            }

            header('Location:' . BASEURL);
        } else {

            $rand               = rand(1, 200);
            $kode_nn            = acak_nomor(3) . acak_nomor(3);
            $data['kode']       = "19$kode_nn";
            $data['nominal']    = $_POST['nominal'];
            $nominal            = $data['nominal'];
            $kode               = $data['kode'];

            $date               = date('Y-m-d');
            $time               = date('H:i:s');
            $this->db->query("INSERT INTO deposit (id,kode_deposit,username,tipe,provider,pengirim,penerima,catatan,jumlah_transfer,get_saldo,metode_isi_saldo,status,date,time)
            VALUES ('','$kode','$username','-','-','-','-','-','$nominal','$nominal','saldo_top_up','Pending','$date','$time')");
            $this->db->execute();
            $this->view('home/checkout', $data);
        }
    }
}
