sudo docker run -it --rm \
  -v $PWD/data:/home/runner/data \
  -p 127.0.0.1:5909:5900 \
  -p 127.0.0.1:13579:13580 \
  ncalayer
