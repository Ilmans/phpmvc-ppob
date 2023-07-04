<?php

class Mutasi extends Controller
{

    public $date = DATE,
        $time = TIME;
    public function __construct()
    {
        $this->dbh = new Database;
        $this->db = $this->dbh->connect();
    }

    public function ovo()
    {
        $data_ovo = $this->model('Admin_model')->accountovo();
        $ovo = new OVO($data_ovo['auth_token']);
        $acc = json_decode($ovo->transactionHistory(), true);

        if ($acc['status'] != 200) {
            echo 'Ada kesalahan, login ulang akun ovo mu';
        } else {

            foreach ($acc['data'][0]['complete'] as $data) {
                $invoice = $data['merchant_name'] . '/' . $data['merchant_invoice'];
                $account = $data['name'];
                $amount = $data['transaction_amount'];
                echo $amount;
                $desc = $data['desc1'];
                $sender = $data['desc3'];
                $datetime = $data['transaction_date'] . ' ' . $data['transaction_time'];

                $mutasiovo = $this->model('Ambildata_model')->cekmutasi('mutasi_ovo', 'invoice', $invoice);
                if ($mutasiovo > 0) {
                    echo '<br> Data sudah ada di database <br>';
                } else {
                    $cekdepo = $this->model('Ambildata_model')->cekdepositmutasi($amount);

                    if ($cekdepo == 1) {
                        $insertmutasi = $this->db->prepare("INSERT INTO mutasi_ovo VALUES ('','DEV','$invoice','$invoice','$account','$amount','$desc','$sender','$datetime')");
                        $insertmutasi->execute();
                        $updatemutasidepopsit = $this->model('Ambildata_model')->updatemutasi($amount, 'OVO');
                        if ($updatemutasidepopsit > 0 && $insertmutasi->rowCount() > 0) {
                            echo '' . $desc . ' RP ' . $amount . ' =>> berhasil di update <br>';
                        } else {
                            echo 'Kesalahan system (105), mohon infokan error ini ke dev';
                        }
                    } else {
                        echo '<br>Data mutasi OVO yang terdeteksi tidak ada yang sesuai dengan data deposit user<br>';
                    }
                }
            }
        }
    }

    public function gopay()
    {
        $data_gopay = $this->model('Admin_model')->accountgopay();
        $gopay = new GojekPay($data_gopay['token']);
        $hasil = json_decode($gopay->getTransactionHistory(), true);

        if (isset($hasil['data']['success'])) {
            foreach ($hasil['data']['success'] as $data) {

                $amount = $data['amount']['value'];

                $desc = $data['description'];
                $date = $data['transacted_at'];
                $invoice = $data['transaction_ref'];


                $mutasiovo = $this->model('Ambildata_model')->cekmutasi('mutasi_gopay', 'invoice', $invoice);
                if ($mutasiovo > 0) {
                    echo '<br> Data sudah ada di database <br>';
                } else {
                    $cekdepo = $this->model('Ambildata_model')->cekdepositmutasi($amount);

                    if ($cekdepo == 1) {
                        $insertmutasi = $this->db->prepare("INSERT INTO mutasi_gopay VALUES ('','$invoice','$amount','$desc','$date')");
                        $insertmutasi->execute();
                        $updatemutasidepopsit = $this->model('Ambildata_model')->updatemutasi($amount, 'GOPAY');
                        if ($updatemutasidepopsit > 0 && $insertmutasi->rowCount() > 0) {
                            echo '' . $desc . ' RP ' . $amount . ' =>> berhasil di update <br>';
                        } else {
                            echo 'Kesalahan system (105), mohon infokan error ini ke dev';
                        }
                    } else {
                        echo 'data transfer masuk tidak ada yang sesuai dengan deposit user';
                        echo '<br>';
                    }
                }
            }
        }
    }
}
