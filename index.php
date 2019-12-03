<?php

use Helloworld\GreeterClient;
use Helloworld\HelloRequest;

require_once __DIR__ . '/vendor/autoload.php';

$client = new GreeterClient(
    'mailchimp.com', // does not matter that no server is running.
    [
        'credentials' => \Grpc\ChannelCredentials::createSsl()
    ]
);

$client->SayHello(
    (new HelloRequest())->setName('Freddie')
)->wait();

$status = 0;
system('/bin/true', $status);
if ($status !== 0) {
    throw new \Exception("subprocess failed: {$status}");
}
