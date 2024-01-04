FROM ubuntu:22.04

RUN set -ex; \
  apt update; \
  apt install -y x11vnc xvfb socat python3 unzip curl

RUN useradd -m -s /bin/bash runner

USER runner

RUN set -ex; \
  mkdir -p /home/runner/ncalayer; \
  cd /home/runner/ncalayer; \
  curl -JOL https://ncl.pki.gov.kz/images/NCALayer/ncalayer.zip; \
  unzip ncalayer.zip; \
  rm ncalayer.zip

# prepare custom certs
RUN set -ex; \
  mkdir /home/runner/certs; \
  cd /home/runner/ncalayer/additions/cert; \
  for i in $(ls *.crt); \
  do \
    openssl x509 -inform DER -in $i -outform PEM -out /home/runner/certs/$i; \
  done; \
  c_rehash /home/runner/certs

# crl.pki.gov.kz/updates/ncalayer.der

RUN set -ex; \
  mkdir -p /home/runner/.config/NCALayer/bundles; \
  cd /home/runner/.config/NCALayer/bundles; \
  curl -JOL https://cabinet.kgd.gov.kz/knp/ncalayer/sono_knp_ncalayer_module-1.2.0.jar ; \
  true

CMD socat tcp-listen:13580,fork,reuseaddr tcp:127.0.0.1:13579 & \
  cd /home/runner/ncalayer && \
  xvfb-run bash -c './additions/jre8/bin/java -jar ./ncalayer.sh & x11vnc -display $DISPLAY'
