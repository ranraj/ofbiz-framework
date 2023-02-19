docker build -t java17 -f ./Docker/java17ubuntu22.04.dockerfile .
docker build -t yali/ofbiz -f Docker/ofbiz.dockerfile .
docker build -t bizter .

Debug : 
docker run -it docker.io/library/bizter /bin/bash

Run : 
docker run -p 443:8443 docker.io/library/bizter

git remote add yali git@github.com:ranraj/ofbiz-framework.git
git branch --set-upstream-to yali/trunk
git pull yali --rebase

aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 310830433577.dkr.ecr.ap-south-1.amazonaws.com
docker tag bizter:latest 310830433577.dkr.ecr.ap-south-1.amazonaws.com/bizter:latest
docker push 310830433577.dkr.ecr.ap-south-1.amazonaws.com/bizter:latest

docker save bizter:latest -o bizter_19_3.tar
docker load -i bizter_19_3.tar