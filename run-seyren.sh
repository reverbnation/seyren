#!/bin/bash
set -o errexit

if [ -z ${GRAPHITE_URL} ]
   then
       if [ $# -ne 1 ]
       then
           echo "Usage: run-seyren.sh GRAPHITE_URL"
       fi
       export GRAPHITE_URL=$1
fi

export MONGO_URL=mongodb://$MONGODB_PORT_27017_TCP_ADDR:$MONGODB_PORT_27017_TCP_PORT/seyren
export MAVEN_OPTS=$CATALINA_OPTS

echo "Graphite URL $GRAPHITE_URL"
echo "Mongo URL $MONGO_URL"
echo "Maven Opts $MAVEN_OPTS"

ln -sf /dev/stdout /var/log/seyren.log

mvn -B -pl seyren-web tomcat7:run-war
