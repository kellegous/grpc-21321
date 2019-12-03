FROM php:7.2.2-cli

RUN apt-get update \
    && apt-get install -y build-essential \
        curl \
        zlib1g-dev \
    && curl -LO https://pecl.php.net/get/grpc-1.25.0.tgz \
    && tar zxvf grpc-1.25.0.tgz \
    && cd /grpc-1.25.0 \
    && phpize && ./configure && make && make install \
    && cd / \
    && rm -rf grpc-1.25.0.tgz \
    && curl -LO https://pecl.php.net/get/protobuf-3.11.0.tgz \
    && tar zxvf protobuf-3.11.0.tgz \
    && cd /protobuf-3.11.0 \
    && phpize && ./configure && make && make install \
    && cd / \
    && rm -rf protobuf-3.11.0.tgz

COPY php.ini $PHP_INI_DIR/