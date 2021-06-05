flutter build web && \
snapcraft --use-lxd && \



docker build -t movflohttpdimg . && \
docker run -dit --name movflo -p 7777:80 movflohttpdimg && \
