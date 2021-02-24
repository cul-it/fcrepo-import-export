#!/bin/bash
LOGLEVEL=-Dfcrepo.log.importexport=WARN
JAR=target/fcrepo-import-export-1.1.0-SNAPSHOT.jar
time java $LOGLEVEL  -jar $JAR \
  --mode export \
  --resource http://aws-110-007.internal.library.cornell.edu:8080/fedora/rest \
  --dir /cul/src/fcrepo-import-export/esmis-int \
  --user fedoraAdmin:fedoraAdmin \
  -w ./export-int.yml
