#!/bin/bash

mkdir registry_certs
openssl req -newkey rsa:4096 -nodes -sha256 \
        -keyout registry_certs/domain.key -x509 -days 356 \
        -out registry_certs/domain.cert
ls registry_certs/

sudo docker run -d -p 5000:5000 \
                -v $(pwd)/registry_certs:/certs \
                -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.cert \
                -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
                --restart=always --name registry registry:2
                
sudo docker push localhost:5000/proxy:1.0.0


sudo docker init
