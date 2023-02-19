docker build -t java17 -f ./Docker/java17ubuntu22.04.dockerfile .
docker build -t yali/ofbiz -f Docker/ofbiz.dockerfile .
docker build -t bizter .

Debug : 
docker run -it docker.io/library/bizter /bin/bash

Run : 
docker run -p 443:8443 docker.io/library/bizter

