<?php

class Riwayat_model extends Controller
{

    protected $dbh, $db;

    public function __construct()
    {
        $this->dbh = new Database;
        $this->db = $this->dbh->connect();
    }

    //riwayat semua pembelian
    public function riwayatsemuapembelian($username)
    {

        $this->dbh->query("SELECT * FROM semua_pembelian WHERE user ='$username' ORDER BY date DESC");
        $this->dbh->execute();
        return $this->dbh->resultSet();
    }
    public function riwayatpembelianppob($username)
    {

        $this->dbh->query("SELECT * FROM pembelian_pulsa WHERE user ='$username' ORDER BY id ASC");
        $this->dbh->execute();
        return $this->dbh->resultSet();
    }
    public function riwayatpembeliansosmed($username)
    {

        $this->dbh->query("SELECT * FROM pembelian_sosmed WHERE user ='$username' ORDER BY date DESC");
        $this->dbh->execute();
        return $this->dbh->resultSet();
    }
    public function riwayatpembelianpascabayar($username)
    {

        $this->dbh->query("SELECT * FROM pembelian_pascabayar WHERE user ='$username' ORDER BY date DESC");
        $this->dbh->execute();
        return $this->dbh->resultSet();
    }
}
