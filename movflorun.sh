flutter clean && \
flutter build web && \
docker rm movflohttpdimg && \
docker build -t movflohttpdimg . && \
docker-compose up -d --build && \
# docker run -dit --name movflo -p 7777:80 movflohttpdimg && \

snapcraft --use-lxd && \
sudo snap install --dangerous movflo*snap




