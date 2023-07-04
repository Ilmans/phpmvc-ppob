<?php

class Pascabayar extends Controller
{

    private $db;
    private $dbh;
    //protected $sendwa;
    protected $date = DATE, $time = TIME;

    public function __construct()
    {
        $this->dbh = new Database;
        $this->db = $this->dbh->connect();
        $this->sendwa = new Menzwa();
        $this->token = new Token;
    }

    public function cekpln()
    {
        $data['user'] = $this->model('Home_model')->datauser($_SESSION['user']['username']);
        $data['title'] = 'PLN Pascabayar';

        $this->dbh->query("SELECT * FROM layanan_pascabayar WHERE kategori = 'PLN PASCABAYAR' ");
        $this->dbh->execute();
        $data['pln'] = $this->dbh->resultSet();
        // var_dump($data['namabank']);
        // die;
        $this->view('templates/header', $data);
        $this->view('pascabayar/pln', $data);
        $this->view('templates/footer');
    }
    public function bpjs()
    {
        $data['user'] = $this->model('Home_model')->datauser($_SESSION['user']['username']);
        $data['title'] = 'BPJS Pascabayar';

        $this->dbh->query("SELECT * FROM layanan_pascabayar WHERE kategori = 'BPJS KESEHATAN' ");
        $this->dbh->execute();
        $data['bpjs'] = $this->dbh->resultSet();
        // var_dump($data['namabank']);
        // die;
        $this->view('templates/header', $data);
        $this->view('pascabayar/bpjs', $data);
        $this->view('templates/footer');
    }
    public function hp()
    {
        $data['user'] = $this->model('Home_model')->datauser($_SESSION['user']['username']);
        $data['title'] = 'BPJS Pascabayar';

        $this->dbh->query("SELECT * FROM layanan_pascabayar WHERE kategori = 'HP PASCABAYAR' ");
        $this->dbh->execute();
        $data['hp'] = $this->dbh->resultSet();
        // var_dump($data['namabank']);
        // die;
        $this->view('templates/header', $data);
        $this->view('pascabayar/hp', $data);
        $this->view('templates/footer');
    }
    public function internet()
    {
        $data['user'] = $this->model('Home_model')->datauser($_SESSION['user']['username']);
        $data['title'] = 'Internet Pascabayar';

        $this->dbh->query("SELECT * FROM layanan_pascabayar WHERE kategori = 'INTERNET PASCABAYAR' ");
        $this->dbh->execute();
        $data['internet'] = $this->dbh->resultSet();
        // var_dump($data['namabank']);
        // die;
        $this->view('templates/header', $data);
        $this->view('pascabayar/internet', $data);
        $this->view('templates/footer');
    }


    public function cektagihanpln()
    {

        $nomor = $_POST['nopelanggan'];
        $sku = $_POST['skucode'];
        $data = $this->model('Digiflazz_model')->cektagihan($nomor, 'pln');
        $keuntungan = $this->model('Lainnya')->keuntunganpascabayar();

        if ($data['data']['message'] == 'Nomor tujuan salah') {
            echo '<h1 class="text-danger"> Nomor tujuan salah! Mohon periksa kembali</h1>';
        } else if ($data['data']['message'] == 'Transaksi Gagal') {
            echo 'Gagal cek tagihan';
        } else {
            if ($data['data']['status'] == 'Gagal') {
                echo $data['data']['message'];
            } else {

                $datanya = $data['data'];
                $biayaadmin = $datanya['desc']['detail'][0]['admin'] + $keuntungan;
                $jumlahtotal = $datanya['desc']['detail'][0]['denda'] + $biayaadmin + $datanya['desc']['detail'][0]['nilai_tagihan'];
                echo '
            <div class="text-center">
            <h1 class="text-center">Nama Customer : <br>' . $datanya['customer_name'] . '</h1>
            </div><br>
            <form method="POST" action="' . BASEURL . 'order/pascabayar">
          
            <div class="form-group">
                <label for="tujuanppob">Periode</label>
                <input type="text" class="form-control" name="periode" value="' . $datanya['desc']['detail'][0]['periode'] . '"  readonly>
            </div>
            <div class="form-group">
            <input type="text" class="form-control" name="token" value="' . $this->token->get() . '"  readonly>
                <input type="hidden" class="form-control" name="refid" value="' . $datanya['ref_id'] . '"  readonly>
                <input type="hidden" class="form-control" name="skucode" value="' . $datanya['buyer_sku_code'] . '"  readonly>
                <input type="hidden" class="form-control" name="customerno" value="' . $datanya['customer_no'] . '"  readonly>
                <input type="hidden" class="form-control" name="harga" value="' . $datanya['selling_price'] . '"  readonly>
                <input type="hidden" class="form-control" name="customername" value="' . $datanya['customer_name'] . '"  readonly>
            </div>
            <div class="form-group">
                <label >Jumlah tagihan</label>
                <input type="text" class="form-control" name="jumlahtagihan" value="' . $datanya['desc']['detail'][0]['nilai_tagihan'] . '"  readonly>
            </div>
            <div class="form-group">
                <label >biaya admin</label>
                <input type="text" class="form-control" name="biayaadmin" value="' . $biayaadmin . '"  readonly>
            </div>
            <div class="form-group">
                <label >Denda</label>
                <input type="text" class="form-control" name="denda" value="' . $datanya['desc']['detail'][0]['denda'] . '"  readonly>
            </div>
            <p class="alert alert-secondary deskripsippob" style="display:none"></p>
            <div class="form-group">
                <label for="tujuanppob">JUMLAH</label>
                <input type="number" class="form-control" name="jumlah" id="pinppob" placeholder="123456" value="' . $datanya['selling_price'] . '"  readonly>
            </div>
          
            </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-outline-info" data-dismiss="modal">Kembali</button>
            <button type="submit" class="btn btn-info" id="buttonpesanppob">Lanjutkan</button>
        </div>
        </form>
    ';
            }
        }
    }
    public function cektagihanbpjs()
    {

        $data_provider = $this->model('Ambildata_model')->providerppob('DG-PULSA');
        $api_key = $data_provider['api_key'];
        $api_id = $data_provider['api_id'];
        $nomor = $_POST['nopelanggan'];
        $sku = $_POST['sku'];
        $data = $this->model('Digiflazz_model')->cektagihan($nomor, 'bpjs');
        $keuntungan = $this->model('Lainnya')->keuntunganpascabayar();

        if ($data['data']['message'] == 'Nomor tujuan salah') {
            echo '<h1 class="text-danger"> Nomor tujuan salah! Mohon periksa kembali</h1>';
        } else if ($data['data']['message'] == 'Transaksi Gagal') {
            echo 'Gagal cek tagihan';
        } else {
            //  var_dump($data['data']);
            if ($data['data']['status'] == 'Gagal') {
                echo $data['data']['message'];
            } else {


                $datanya = $data['data'];

                echo '
            <div class="text-center">
            </div><br>
            <form method="POST" action="' . BASEURL . 'order/pascabayar">
            <input type="hidden" class="form-control" name="token" value="' . $this->token->get() . '"  readonly>
            <div class="form-group">
                <label for="tujuanppob">Nama Customer</label>
                <input type="text" class="form-control" name="customername" value="' . $datanya['customer_name'] . '"  readonly>
            </div>
            <div class="form-group">
                <input type="hidden" class="form-control" name="refid" value="' . $datanya['ref_id'] . '">
                <input type="hidden" class="form-control" name="skucode" value="' . $datanya['buyer_sku_code'] . '">
                <input type="hidden" class="form-control" name="customerno" value="' . $datanya['customer_no'] . '">
                <input type="hidden" class="form-control" name="customerno" value="' . $datanya['customer_no'] . '">
                <input type="hidden" class="form-control" name="harga" value="' . $datanya['selling_price'] . '">
            </div>
            <div class="form-group">
            <label for="deskripsi">Detail</label>
            <textarea class="form-control" id="deskripsi" rows="5" readonly>
Jumlah peserta : ' . $datanya['desc']['jumlah_peserta'] . '
Lembar Tagihan : ' . $datanya['desc']['lembar_tagihan'] . '
Alamat         : ' . $datanya['desc']['alamat'] . '
Total          : ' . $datanya['selling_price'] . '
            </textarea>
          </div>
           
            </div>
          
            </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-outline-info" data-dismiss="modal">Kembali</button>
            <button type="submit" class="btn btn-info" id="buttonpesanppob">Lanjutkan</button>
        </div>
        </form>
    ';
            }
        }
    }
    public function cektagihaninternet()
    {

        $data_provider = $this->model('Ambildata_model')->providerppob('DG-PULSA');
        $api_key = $data_provider['api_key'];
        $api_id = $data_provider['api_id'];
        $nomor = $_POST['nopelanggan'];
        $sku = $_POST['skucode'];
        $data = $this->model('Digiflazz_model')->cektagihan($nomor, 'internet');
        //var_dump($data);

        if ($data['data']['message'] == 'Nomor tujuan salah') {
            echo '<h1 class="text-danger"> Nomor tujuan salah! Mohon periksa kembali</h1>';
        } else if ($data['data']['message'] == 'Transaksi Gagal') {
            echo 'Gagal cek tagihan';
        } else {
            //  var_dump($data['data']);
            if ($data['data']['status'] == 'Gagal') {
                echo $data['data']['message'];
            } else {


                $datanya = $data['data'];


                echo '
            <div class="text-center">
            </div><br>
            <form method="POST" action="' . BASEURL . 'order/pascabayar/">
            <input type="hidden" class="form-control" name="token" value="' . $this->token->get() . '"  readonly>
            <div class="form-group">
                <label for="tujuanppob">Nama Customer</label>
                <input type="text" class="form-control" name="customername" value="' . $datanya['customer_name'] . '"  readonly>
            </div>
            <div class="form-group">
                <input type="hidden" class="form-control" name="refid" value="' . $datanya['ref_id'] . '">
                <input type="hidden" class="form-control" name="skucode" value="' . $datanya['buyer_sku_code'] . '">
                <input type="hidden" class="form-control" name="customerno" value="' . $datanya['customer_no'] . '">
               
                <input type="hidden" class="form-control" name="harga" value="' . $datanya['selling_price'] . '">
            </div>
            <div class="form-group">
            <label for="deskripsi">Detail</label>
            <textarea class="form-control" id="deskripsi" rows="5" readonly>
Lembar tagihan : ' . $datanya['desc']['lembar_tagihan'] . '';
                foreach ($datanya['desc']['detail'] as $detail) {
                    echo
                    '
Periode        : ' . $detail['periode'] . '
Nilai tagihan  : ' . $detail['nilai_tagihan'] . '
Admin          : ' . $datanya['admin'] . '
                ';
                }
                echo '</textarea>
          </div>
           
            </div>
          
            </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-outline-info" data-dismiss="modal">Kembali</button>
            <button type="submit" class="btn btn-info" id="buttonpesanppob">Lanjutkan</button>
        </div>
        </form>
    ';
            }
        }
    }
    public function cektagihanhp()
    {



        $nomor = $_POST['nopelanggan'];
        $sku = $_POST['sku'];
        $data = $this->model('Digiflazz_model')->cektagihan($nomor, 'hp');
        //var_dump($data);

        if ($data['data']['message'] == 'Nomor tujuan salah') {
            echo '<h1 class="text-danger"> Nomor tujuan salah! Mohon periksa kembali</h1>';
        } else if ($data['data']['message'] == 'Transaksi Gagal') {
            echo 'Gagal cek tagihan';
        } else {
            //  var_dump($data['data']);
            if ($data['data']['status'] == 'Gagal') {
                echo $data['data']['message'];
            } else {


                $datanya = $data['data'];


                echo '
            <div class="text-center">
            </div><br>
            <form method="POST" action="' . BASEURL . 'order/pascabayar/">
          
            <div class="form-group">
                <label for="tujuanppob">Nama Customer</label>
                <input type="text" class="form-control" name="customername" value="' . $datanya['customer_name'] . '"  readonly>
            </div>
            <div class="form-group">
                <input type="hidden" class="form-control" name="refid" value="' . $datanya['ref_id'] . '">
                <input type="hidden" class="form-control" name="skucode" value="' . $datanya['buyer_sku_code'] . '">
                <input type="hidden" class="form-control" name="customerno" value="' . $datanya['customer_no'] . '">
               
                <input type="hidden" class="form-control" name="harga" value="' . $datanya['selling_price'] . '">
            </div>
            <div class="form-group">
            <label for="deskripsi">Detail</label>
            <textarea class="form-control" id="deskripsi" rows="5" readonly>
Lembar tagihan : ' . $datanya['desc']['lembar_tagihan'] . '
Admin        :   ' . $datanya['admin'] . '
</textarea>
          </div>
           
            </div>
          
            </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-outline-info" data-dismiss="modal">Kembali</button>
            <button type="submit" class="btn btn-info" id="buttonpesanppob">Lanjutkan</button>
        </div>
        </form>
    ';
            }
        }
    }
}
