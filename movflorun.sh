flutter build web && \
docker build -t movflohttpdimg . && \
docker run -dit --name movflo -p 7777:80 movflohttpdimg && \

snapcraft --use-lxd && \
sudo snap install --dangerous movflo*snap




