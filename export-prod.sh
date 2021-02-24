#!/bin/sh
LOGLEVEL=-Dfcrepo.log.importexport=WARN
JAR=target/fcrepo-import-export-1.1.0-SNAPSHOT.jar
DEV=http://localhost:8984/rest
INT=http://aws-110-007.internal.library.cornell.edu:8080/fedora/rest
STG=http://aws-110-026.internal.library.cornell.edu:8080/fedora/rest
PROD=http://aws-110-124.internal.library.cornell.edu:8080/fedora/rest

time java $LOGLEVEL -jar $JAR \
  --mode export \
  --resource $PROD \
  --dir /cul/src/fcrepo-import-export/esmis-prod \
  --user fedoraAdmin:fedoraAdmin \
  -w ./export-prod.yml
