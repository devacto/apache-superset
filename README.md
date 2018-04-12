# apache-superset 
Docker image of Superset 

![Superset logo](https://superset.incubator.apache.org/_images/s.png "Superset")
# dockerfile-apache-superset

### Apache Superset Dockerfile

Provides a Dockerfile and associated scripts for configuring an instance of [Apache Superset](https://superset.incubator.apache.org)

1. Build the image:
    ```
    docker build . -t superset:latest
    ```
    
2. Run the image:
   ```
   docker run -it -d --name superset \
     -p 8088:8088 \
     -v superset:/etc/superset \
     superset:latest
   ```
