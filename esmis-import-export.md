Import / Export for USDA ESMIS Fedora repositories
=========================

Overview
-----------------------------------------------------------------------------------------------------
The fcrepo-import-export project contains directories for storing an export of a fedora repository for
each environment (dev, integration, staging, production).  the directories are:
* esmis-dev
* esmis-int
* esmis-stg
* esmis-prod
The addition to the fcrepo-import-export project also include export and import scripts which the java
class with the appropriate parameters.  Each script contains variables which define the location of 
a repository for each environment and a OPTS variable that can be used to set the log level and memory
allocation.
-----------------------------------------------------------------------------------------------------

**_Exporting_**

The following is an example of an export script for exporting the int environment instance of a fedora
repository
```
#!/bin/bash

OPTS="-Dfcrepo.log.importexport=WARN -Xms2048M -Xmx2048M"
JAR=target/fcrepo-import-export-1.1.0-SNAPSHOT.jar
DEV=http://localhost:8984/rest
INT=http://aws-110-007.internal.library.cornell.edu:8080/fedora/rest
STG=http://aws-110-026.internal.library.cornell.edu:8080/fedora/rest
PROD=http://aws-110-124.internal.library.cornell.edu:8080/fedora/rest

time java $OPTS  -jar $JAR \
  --mode export \
  --resource $INT \
  --dir /cul/src/fcrepo-import-export/esmis-int \
  --user CHANGEME:CHANGEME \
  -w ./export-int.yml
```
After defining a few variables the java jar file is executed, using the following parameters
* mode: export
* resource: the URL for the fedora resource to export
* dir: the directory to store the output
* user:  login credentials for the repository
* -w: write out the configuration to a yml file

**_Importing_**

The import scripts are similar to the export scripts but define paramaters as follows:
* mode: import
* resource: the URL for the fedora resource used for an import
* dir: the directory to read contents of a previous export
* map:  URL prefixes used to map one repository location to another
* user:  login credentials for the repository
* -w: write out the configuration to a yml file
