FROM ubuntu:22.04

RUN set -ex; \
  apt update; \
  apt install -y x11vnc xvfb socat python3 unzip curl

RUN useradd -m -s /bin/bash runner

USER runner

RUN set -ex; \
  mkdir -p /home/runner/noVNC /home/runner/websockify /home/runner/ncalayer; \
  cd /home/runner/noVNC; \
  curl -L https://github.com/novnc/noVNC/archive/refs/heads/master.tar.gz | tar xzf - --strip-components=1; \
  cd /home/runner/websockify; \
  curl -L https://github.com/novnc/websockify/archive/refs/heads/master.tar.gz | tar xzf - --strip-components=1; \
  cd /home/runner/ncalayer; \
  curl -JOL https://ncl.pki.gov.kz/images/NCALayer/ncalayer.zip; \
  unzip ncalayer.zip; \
  rm ncalayer.zip

CMD /home/runner/websockify/run --web /home/runner/noVNC 8059 127.0.0.1:5900 & \
  socat tcp-listen:13580,fork,reuseaddr tcp:127.0.0.1:13579 & \
  cd /home/runner/ncalayer && \
  xvfb-run bash -c './additions/jre8/bin/java -jar ./ncalayer.sh & x11vnc -display $DISPLAY'
