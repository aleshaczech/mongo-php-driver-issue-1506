<?php

declare(strict_types=1);

use MongoDB\Client;

require_once(__DIR__ . '/vendor/autoload.php');

$connURI = getenv('APP_MONGO_CONN_URI');

while (true) {
    $client = new Client($connURI);
    $client->selectDatabase('admin')->command(['ping' => true]);
    unset($client);

    echo sprintf('[%s] OK', date(DATE_ATOM)), PHP_EOL;

    sleep(1);
}
