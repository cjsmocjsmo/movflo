rm -rf /home/teresa/movfloDeploy;

mkdir /home/teresa/movfloDeploy;

mkdir /home/teresa/movfloDeploy/movflo;

flutter clean && flutter build web;

cp -pvr /home/teresa/movflo/webDeploy/docker-compose.yml /home/teresa/movfloDeploy/;

cp -pvr /home/teresa/movflo/webDeploy/Dockerfile /home/teresa/movfloDeploy/;

cp -pvr /home/teresa/movflo/build/web/* /home/teresa/movfloDeploy/movflo/;




