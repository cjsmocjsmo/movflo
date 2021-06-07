flutter clean && \
flutter build web && \
# docker stop movflo && \
# docker rm movflo && \
docker build -t movflohttpdimg . && \
docker-compose up -d --build && \
# docker run -dit --name movflo -p 7777:80 movflohttpdimg && \

snapcraft --use-lxd && \
sudo snap install --dangerous movflo*snap

