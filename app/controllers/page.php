<?php
header('Access-Control-Allow-Origin: *');
class Page extends Controller
{
    protected $dbh, $db;
    public $date = DATE, $time = TIME;

    public function __construct()
    {
        $this->db = new Database;
        $this->dbh = $this->db->connect();
    }

    public function index()
    {

        header('Location:' . BASEURL);
    }
    
    //  cara topup
    public function cara()
    {
        new Session;
        $data['user'] = $this->model('Home_model')->datauser($_SESSION['user']['username']);
        $data['title'] = 'berita';
        $data['faq']  = $this->model('Halaman_model')->daftarfaq();

        $this->view('templates/header', $data);
        $this->view('page/cara', $data);
        $this->view('templates/footer');
    }
}
