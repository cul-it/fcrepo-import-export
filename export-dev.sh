#!/bin/sh
LOGLEVEL=-Dfcrepo.log.importexport=WARN
JAR=target/fcrepo-import-export-1.1.0-SNAPSHOT.jar
time java $LOGLEVEL -jar $JAR --mode export \
  --resource http://localhost:8984/rest \
  --dir /cul/src/fcrepo-import-export/esmis-dev \
  --user fedoraAdmin:fedoraAdmin \
  -w ./export-dev.yml
