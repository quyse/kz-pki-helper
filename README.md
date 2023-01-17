# KZ PKI helper

## Docker

```
./build.sh
mkdir -p data
sudo chown 1000:1000 data
./run.sh
```

Go to https://127.0.0.1:13579/ and accept self-signed certificate.

Connect to VNC at `localhost:5909`, i.e.:

```bash
vncviewer :9
```

You can now use official PKI websites. When necessary, use VNC viewer for file selection, etc.

## Useful rules for uBlock Origin

uBlock Origin may block access from websites to localhost for security reasons. It is possible to selectively allow access by using custom rules.

```
egov.kz wss://127.0.0.1:13579 websocket allow
egov.kz wss://localhost:13579 websocket allow
idp.egov.kz wss://127.0.0.1:13579 websocket allow
account.idocs.kz wss://127.0.0.1:13579 websocket allow
cabinet.idocs.kz wss://127.0.0.1:13579 websocket allow
nca.pki.gov.kz wss://127.0.0.1:13579 websocket allow
cabinet.salyk.kz wss://127.0.0.1:13579 websocket allow
vmp.gov.kz wss://127.0.0.1:13579 websocket allow
```
