<?php

class Digiflazz_model
{

    protected $dbh, $db;
    public $date = DATE, $time = TIME;
    private $data;

    private $_head;
    public function __construct()
    {
        $this->dbh = new Database;
        $this->db = $this->dbh->connect();

        $this->dbh->query("SELECT * FROM provider_pulsa WHERE code = 'DG-PULSA'");
        $data = $this->dbh->single();
        $this->data = $data;
        $this->_head = ['Content-Type:application/json'];
    }

    private function request($url, $data, $head = null)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $head);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        // curl_setopt($ch, CURLOPT_HEADER, 1);
        // curl_setopt($ch, CURLINFO_HEADER_OUT, true);
        $result = curl_exec($ch);

        return $result;
    }

    public function ceksaldo()
    {
        $sign = md5($this->data['api_id'] . $this->data['api_key'] . 'depo');
        $data = [
            'cmd' => 'deposit',
            'username' => $this->data['api_id'],
            'sign' => $sign
        ];
        return json_decode($this->request('https://api.digiflazz.com/v1/cek-saldo', json_encode($data), $this->_head), true);
    }

    public function ceklayanan()
    {

        $sign = md5($this->data['api_id'] . $this->data['api_key'] . 'pricelist');
        $data = array(
            'username' => $this->data['api_id'],
            'sign' => $sign
        );
        return json_decode($this->request($this->data['link_service'], json_encode($data), $this->_head));
    }
    public function orderppob($skucode, $target, $order_id)
    {

        $sign = md5($this->data['api_id'] . $this->data['api_key'] . $order_id);
        $data = [
            'username' => $this->data['api_id'],
            'buyer_sku_code' => $skucode,
            'customer_no' => $target,
            'ref_id' => $order_id,
            'sign' => $sign,
            // 'testing' => true
        ];

        return json_decode($this->request($this->data['link'], json_encode($data), $this->_head), true);
    }
    public function orderpascabayar($skucode, $target, $order_id)
    {

        $sign = md5($this->data['api_id'] . $this->data['api_key'] . $order_id);
        $data = [
            'commands' => 'pay-pasca',
            'username' => $this->data['api_id'],
            'buyer_sku_code' => $skucode,
            'customer_no' => $target,
            'ref_id' => $order_id,
            'sign' => $sign,
            // 'testing' => true
        ];

        return json_decode($this->request($this->data['link'], json_encode($data), $this->_head), true);
    }


    public function cektagihan($nomor, $sku)
    {

        $order_id = acak_nomor(3) . acak_nomor(4);
        $sign = md5($this->data['api_id'] . $this->data['api_key'] . $order_id);
        $api_postdata = array(
            'commands' => "inq-pasca",
            'username' => $this->data['api_id'],
            'buyer_sku_code' => $sku,
            'customer_no' => $nomor,
            'ref_id' => $order_id,
            // 'testing' => true,
            'sign' => $sign
        );
        return json_decode($this->request($this->data['link'], json_encode($api_postdata), $this->_head), true);
    }
}
