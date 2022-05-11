# KZ PKI helper

## Docker

```
./build.sh
mkdir -p data
sudo chown 1000:1000 data
./run.sh
```

Go to https://127.0.0.1:13579/ and accept self-signed certificate.

Go to http://127.0.0.1:8059/vnc.html and connect to VNC.

You can now use official PKI websites. When necessary, switch to VNC tab and do file selection, etc.
