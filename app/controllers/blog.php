<?php

class Blog extends Controller
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

        $data['catsosmed'] = $this->model("Home_model")->categorysosmed();
        $data['user'] = $this->model('Home_model')->datauser($_SESSION['user']['username']);
        $data['title'] = 'Dashboard';
        $data['pembelian'] = $this->model('Home_model')->pesananTerakhir($_SESSION['user']['username']);
        $data['metodedeposit'] = $this->model('Home_model')->metodedeposit();
        $this->view('templates/header', $data);
        $this->view('blog/index', $data);
        $this->view('templates/footer');
    }


}
