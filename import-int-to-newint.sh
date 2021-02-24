#!/bin/sh
OPTS="-Dfcrepo.log.importexport=INFO -Xms2048M -Xmx2048M"
JAR=target/fcrepo-import-export-1.1.0-SNAPSHOT.jar
DEV=http://localhost:8984/rest
INT=http://aws-110-007.internal.library.cornell.edu:8080/fedora/rest
NEWINT=http://aws-108-191.internal.library.cornell.edu:8080/fedora/rest

STG=http://aws-110-026.internal.library.cornell.edu:8080/fedora/rest
NEWSTG=http://aws-108-233.internal.library.cornell.edu:8080/fedora/rest

PROD=http://aws-110-124.internal.library.cornell.edu:8080/fedora/rest

time java $OPTS -jar $JAR \
--mode import \
--resource $NEWINT \
--dir /cul/src/fcrepo-import-export/esmis-int \
--legacyMode \
--map $INT,$NEWINT \
--user fedoraAdmin:fedoraAdmin
