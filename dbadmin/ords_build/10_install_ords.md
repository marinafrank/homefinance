Due to lisence agreement, there is not ready-to-use ords image. Build using [oracle-base ords](https://oracle-base.com/articles/linux/docker-oracle-rest-data-services-ords-on-docker)

wget https://github.com/oraclebase/dockerfiles/archive/refs/heads/master.zip
wget https://download.oracle.com/otn_software/java/ords/ords-21.4.2.062.1806.zip
wget https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.14.1%2B1/OpenJDK11U-jdk_x64_linux_hotspot_11.0.14.1_1.tar.gz
wget https://download.oracle.com/otn_software/java/sqldeveloper/sqlcl-21.4.1.17.1458.zip

todo copy Dockerfile and scripts from sw host

apache-tomcat-9.0.60.tar.gz
apex_21.2_en.zip
OpenJDK11U-jdk_x64_linux_hotspot_11.0.14.1_1.tar.gz
ords-21.4.2.062.1806.zip
sqlcl-21.4.1.17.1458.zip

```bash
docker build -t ol8_ords:latest .
mkdir -p /data/tomcat
# tomcat user from container
chown -R 501.1043 /data/tomcat

Configure reverse proxy, e.g. nginx:

```
server {
    listen       80;
    listen       4443 ssl;
    server_name  hf.kabakaev.com;
    ssl_certificate     tls/kabakaev.com.crt;
    ssl_certificate_key tls/kabakaev.com.key;
    ssl_protocols       TLSv1.1 TLSv1.2;
    ssl_ciphers         HIGH:!aNULL:!MD5;

    access_log  /var/log/nginx/hf.kabakaev.com.log  main;

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    # proxy the PHP scripts to Tomcat listening on 127.0.0.1:9080
    #
    location / {
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-Host $host;
        proxy_set_header X-Forwarded-Server $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Origin "" ;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_pass   http://127.0.0.1:9080/;
    }

}
```

systemctl enable --now ords21.service

## Test connection
 tomcat]$ /u01/sqlcl/bin/sql APEX_PUBLIC_USER/ertdfg@oracle21:1521/HF
