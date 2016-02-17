dockerip=`docker inspect mongodb0|jq -r .[0].NetworkSettings.IPAddress`
echo $dockerip 
#docker run -e host=$dockerip -v /home/zhuanghua:/backup mongo /bin/bash -c "cd /backup;ls;env;gunzip stylemaster-2016-02-17.tar.gz;gunzip test_database-2016-02-17.tar.gz"
#docker run -e host=$dockerip -v /home/zhuanghua:/backup mongo /bin/bash -c "cd /backup;ls;env;tar -xvf stylemaster-2016-02-17.tar;tar -xvf test_database-2016-02-17.tar"

#docker run -e host=$dockerip -v /home/zhuanghua:/backup mongo /bin/bash -c "cd /backup;ls;env;mongorestore -h $dockerip -d stylemaster --drop /backup/stylemaster-2016-02-17/stylemaster"

docker run -e host=$dockerip -v /home/zhuanghua:/backup mongo /bin/bash -c "cd /backup;ls;env;mongorestore -h $dockerip -d test_database --drop /backup/test_database-2016-02-17/test_database"

