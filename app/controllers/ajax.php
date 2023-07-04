<?php


class Ajax extends Controller
{
    public $date = DATE, $time = TIME;

    public function __construct()
    {
        $this->db = new Database;
        $this->dbh = $this->db->connect();
    }
    public function getTipePulsaData()
    {
        $operator = $_POST['operator'];
        $jenis = $_POST['jenis'];

        $this->db->query("SELECT * FROM kategori_layanan WHERE kategori = '$jenis' AND brand = '$operator' AND server = 'Top Up' ");
        $this->db->execute();
        $data = $this->db->resultSet();
        echo '  
        <option value="0" disabled selected>Pilih Tipe</option>
    ';
        foreach ($data as $datanya) {

            echo '  
            <option value="' . $datanya['tipe'] . '">' . $datanya['tipe'] . '</option>
        ';
        }
    }

    public function layananPulsaData()
    {
        $kategori = $_POST['kategori'];
        $operator = $_POST['operator'];
        $jenis = $_POST['jenis'];

        $this->db->query("SELECT * FROM layanan_pulsa WHERE kategori = '$kategori'  AND operator = '$operator' AND tipe = '$jenis' ORDER BY harga ASC");
        $this->db->execute();
        $data = $this->db->resultSet();

        foreach ($data as $datanya) {
            echo '<button type="button" class="btn btn-outline-info btn-block mb-1 mr-2 mt-3">
            <input type="radio" value="' . $datanya['service_id'] . '" name="layanan"  required>' . $datanya['layanan'] . '<span class="text-danger text-small"><br>*' . $datanya['deskripsi'] . '</span><br>
            <span class="text-dark">Harga RP : ' . $datanya['harga'] . '</span>
        </button>';
        }
    }

    public function kategoriPpob()
    {
        //$aksi = $_POST['aksi'];
        $kategori = $_POST['kategori'];


        $this->db->query("SELECT * FROM kategori_layanan WHERE kategori = '$kategori' AND server = 'Top Up' ORDER BY brand ASC");
        $this->db->execute();
        $data = $this->db->resultSet();
        echo '<option value="0" disabled selected>Pilih kategori</option>';
        foreach ($data as $datanya) {
            echo ' <option value="' . $datanya['brand'] . '#' . $datanya['tipe'] . '">' . $datanya['brand'] . ' ( ' . $datanya['tipe'] . ' )</option>';
        }
    }

    public function layananPpob()
    {

        $tipe = $_POST['tipe'];
        $kategori = $_POST['kategori'];
        $jenis = $_POST['jenis'];
        $this->db->query("SELECT * FROM layanan_pulsa WHERE tipe = '$jenis' AND operator = '$kategori' AND kategori ='$tipe' AND status = 'Normal' ORDER BY harga ASC");
        $this->db->execute();
        $data = $this->db->resultSet();

        echo ' <option value="0" disabled selected>Pilih Layanan</option>';
        foreach ($data as $datanya) {

            echo ' <option value="' . $datanya['service_id'] . '">' . $datanya['layanan'] . '</option>';
        }
    }

    public function deskripsippob()
    {
        $id = $_POST['id'];
        $this->db->query("SELECT * FROM layanan_pulsa WHERE service_id = '$id'");
        $this->db->execute();
        $data = $this->db->resultSet();

        echo json_encode($data);
    }

    public function cekpin()
    {
        $pin = $_POST['pin'];
        $datauser =  $data['user'] = $this->model('Home_model')->datauser($_SESSION['user']['username']);
        $pin == $datauser['pin'] ? $h = true : $h = false;
        echo json_encode($h);
    }
}
