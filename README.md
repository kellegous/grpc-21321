# gRPC PHP fork crash

To run, simply run
```
./start
```

This will build an image based on php:7.2.2-cli that includes grpc and protobuf extensions. Then it will start a container running the PHP cli server. When the server is up and running, making the following sequence of http requests:

```
curl -v http://localhost:8080/
curl -v http://localhost:8080/
```

The first request should complete with a 200, the second request should fail when the subprocess that executes `/bin/true` segfaults.

#### gRPC Issue
https://github.com/grpc/grpc/issues/21321

