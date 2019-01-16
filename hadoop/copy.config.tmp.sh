FILEPATH=./hadoop/etc/hadoop
echo "Copy configs"

scp $FILEPATH/core-site.xml    hadoop@hadoopslave1:$FILEPATH/
scp $FILEPATH/core-site.xml    hadoop@hadoopslave2:$FILEPATH/

scp $FILEPATH/hdfs-site.xml    hadoop@hadoopslave1:$FILEPATH/
scp $FILEPATH/hdfs-site.xml    hadoop@hadoopslave2:$FILEPATH/

scp $FILEPATH/yarn-site.xml    hadoop@hadoopslave1:$FILEPATH/
scp $FILEPATH/yarn-site.xml    hadoop@hadoopslave2:$FILEPATH/

scp $FILEPATH/mapred-site.xml  hadoop@hadoopslave1:$FILEPATH/
scp $FILEPATH/mapred-site.xml  hadoop@hadoopslave2:$FILEPATH/
