sudo docker run -it --rm \
  -v $PWD/data:/home/runner/data \
  -p 127.0.0.1:8059:8059 \
  -p 127.0.0.1:13579:13580 \
  ncalayer
