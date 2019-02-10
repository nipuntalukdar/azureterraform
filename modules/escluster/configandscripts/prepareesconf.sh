CONFLOCATION=/home/ubuntu/configandscripts
cp $CONFLOCATION/jvm.options  /etc/elasticsearch/
sed -i "s/{{{LISTEN_ADDRESS}}}/$1/" $CONFLOCATION/elasticsearch.yml
sed -i "s/{{{SEEDS}}}/$2/" $CONFLOCATION/elasticsearch.yml
sed -i "s/{{{CLUSTER_NAME}}}/$3/" $CONFLOCATION/elasticsearch.yml
cp  $CONFLOCATION/elasticsearch.yml /etc/elasticsearch/ 
chown elasticsearch:elasticsearch /etc/elasticsearch/*
