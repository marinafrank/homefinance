# -slim does not have perl, needed for apex
# no instance startup
docker pull gvenzl/oracle-xe:21

# initial run with create custom database
docker run -ti --name oracle21 \
  -p 127.0.0.1:1522:1521 \
  -p 127.0.0.1:9081:8080 \
  -e ORACLE_PASSWORD=Berg40 \
  -e ORACLE_DATABASE=HF \
  -v /data/oracle/oradata21:/opt/oracle/oradata \
  gvenzl/oracle-xe:21

docker run -ti --name oracle21 \
  -p 127.0.0.1:1521:1521 \
  -p 127.0.0.1:9080:8080 \
  -e ORACLE_PASSWORD=Berg40 \
  -v /data/oracle/oradata21:/opt/oracle/oradata \
  --entrypoint /bin/bash \
  gvenzl/oracle-xe:21

# 11g image with old database, be aware of resetting shared_servers parameter
/usr/bin/docker run -ti --name oracle \
    --shm-size=1300m \
    -p 127.0.0.1:1521:1521 \
    -p 127.0.0.1:9080:8080 \
    -e ORACLE_PASSWORD=Berg40 \
    -v /data/oracle/oradata:/u01/app/oracle/oradata \
    --entrypoint /bin/bash \
    gvenzl/oracle-xe:11
