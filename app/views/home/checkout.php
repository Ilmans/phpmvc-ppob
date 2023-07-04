<title>Checkout</title>
<?php

require __DIR__ . '/../../../vendor/autoload.php'; // composer autoload

use Lowsprofile\Midtrans\Methods\Midtrans;

// Set Your server key
Midtrans::$server_key = 'Mid-server-Tf6UMg5WJ6nXhxM0q4WTLccL';
Midtrans::$is_production = true;

// Required
$transaction_details = [
    'order_id' => $data['kode'],
    'gross_amount' => $data['nominal'], // no decimal allowed for creditcard
];

// Optional
$item_details = [
    [
        'id'        => '1',
        'price'     => $data['nominal'],
        'quantity'  => 1,
        'name'      => "Deposit Saldo"
    ]
];

// Optional
$customer_details = array(
		  'first_name'    => $_SESSION['user']['nama'],
		  'email'         => $_SESSION['user']['email'],
		  'phone'         => $_SESSION['user']['no_hp'],
		  
		);


// Fill transaction details
$transaction = [
    'enabled_payments' => $enable_payments,
    'transaction_details' => $transaction_details,
    'customer_details' => $customer_details,
    'item_details' => $item_details,
];

$snapToken = Midtrans::snapToken($transaction);
// echo $snapToken;
?>

<!DOCTYPE html>
<html>
    <body>
        <div id="result-json"></div>

        <!-- TODO: Remove ".sandbox" from script src URL for production environment.
             Also input your client key in "data-client-key" -->
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://app.midtrans.com/snap/snap.js" data-client-key="Mid-client-Ez65Gi3qvDMk3285"></script>
        <script>
        
        $(document).ready(function() {
            // SnapToken acquired from previous step
            snap.pay('<?= $snapToken ?>');
        });
        </script>
    </body>
</html>