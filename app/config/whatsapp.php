<?php
/*
.---------------------------------------------------------------------------.
|    Script: Menzpedia whatsapp    // Hapus copyright ini jika anda bukan manusia. ///                                      |
|   Version: 1.2.8 - API v1                                                 |
|                               |
|    Release: January 16, 2021 (19:01 WIB)                                   |
|                                                                           |
|                     Pasal 57 ayat (1) UU 28 Tahun 2014                    |
|      Copyright © 2019, Afdhalul Ichsan Yourdan. All Rights Reserved.      |
| ------------------------------------------------------------------------- |
| Hubungi Saya:                                                             |
| - Facebook    - Ilman S                          
| - Instagram   - ilman.sn                    | 
| - Telegram    - ilman.sn                         |
| - Twitter     - ilman.s                                                       |
| - WhatsApp    - 0822 9885 9671                            |
'---------------------------------------------------------------------------'
*/
class MPWA
{

    public $base_url = 'https://demowa.m-pedia.id/';


    private function connect($x, $n = '')
    {
        $curl = curl_init();
        curl_setopt_array(
            $curl,
            array(
                CURLOPT_URL => $this->base_url . $n,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "POST",
                CURLOPT_POSTFIELDS => json_encode($x)
            )
        );
        $response = curl_exec($curl);

        curl_close($curl);
        return $response;
    }

    public function sendMessage($phone, $msg)
    {
        return $this->connect([
            'api_key' => 'OOIJASpojHihIOHiOHU987kJGuigUyi',
            'number' => $phone,
            'message' => $msg
        ], 'api/send-message.php');
    }

    public function sendMedia($phone, $caption, $url)
    {
        return $this->connect([

            'number' => $phone,
            'caption' => $caption,
            'url' => $url
        ], 'v2/send-media');
    }
}

//$install = new Menzwa();

// to send message = 
//  $install->sendMessage('089522811620', 'tes wa via php');
// to send media =
//  $install->sendMedia('089522811620', 'caption','link foto/gambar');

// result
// array(2) {
//     ["status"]=>
//     bool(true)
//     ["response"]=>
//     array(4) {
//       ["key"]=>
//       array(3) {
//         ["remoteJid"]=>
//         string(28) "6289522811620@s.whatsapp.net"
//         ["fromMe"]=>
//         bool(true)
//         ["id"]=>
//         string(12) "3EB037A030D7"
//       }
//       ["message"]=>
//       array(1) {
//         ["extendedTextMessage"]=>
//         array(1) {
//           ["text"]=>
//           string(14) "tes wa via php"
//         }
//       }
//       ["messageTimestamp"]=>
//       string(10) "1610885761"
//       ["status"]=>
//       string(10) "SERVER_ACK"
//     }
//   }
