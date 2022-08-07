rm -rf /media/charliepi/HD/movfloWebDeploy;

mkdir /media/charliepi/HD/movfloWebDeploy;

mkdir /media/charliepi/HD/movfloWebDeploy/movflo;

cp -pvr /media/charliepi/HD/mediacenter/movflo/webDeploy/docker-compose.yml /media/charliepi/HD/movfloWebDeploy;

cp -pvr /media/charliepi/HD/mediacenter/movflo/webDeploy/Dockerfile /media/charliepi/HD/movfloWebDeploy;

flutter clean && flutter build web;

cp -pvr /media/charliepi/HD/mediacenter/movflo/build/web/* /media/charliepi/HD/movfloWebDeploy/movflo/;




