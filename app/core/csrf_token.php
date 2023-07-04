<?php


class Token
{
    public $token;
    public function get()
    {
        if (!isset($_SESSION['token'])) {
            $_SESSION['token'] = bin2hex(random_bytes(32));
        }
        return $_SESSION['token'];
    }

    public function validasi($token)
    {

        // var_dump($_SESSION['token']);
        // echo '<br>';
        // var_dump($token);
        if (isset($_SESSION['token']) && hash_equals($_SESSION['token'], $token)) {
            $hasil = true;
        } else {
            $hasil = false;
        }
        unset($_SESSION['token']);
        return $hasil;
    }
}
