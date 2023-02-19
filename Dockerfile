#java -jar /build/libs/ofbiz.jar
FROM docker.io/yali/ofbiz as build

#Expose port 
EXPOSE 8443

ENTRYPOINT java -jar build/libs/ofbiz.jar