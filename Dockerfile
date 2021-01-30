# FROM ibmcom/websphere-liberty:kernel-java8-openj9-ubi
FROM ibmcom/websphere-liberty:kernel-java8-ibmjava-ubi

# Add my app and config
COPY --chown=1001:0  ccm.war.zip /config/apps/
COPY --chown=1001:0  jts.war.zip /config/apps/
COPY --chown=1001:0  rm.war.zip /config/apps/
COPY --chown=1001:0  qm.war.zip /config/apps/
COPY --chown=1001:0  server.xml /config/

# Default setting for the verbose option
ARG VERBOSE=true

# This script will add the requested XML snippets, grow image to be fit-for-purpose and apply interim fixes
RUN configure.sh

#copy / decompress war archives

COPY --chown=1001:0  jts.war.tar.gz /config/apps/jts.war/
COPY --chown=1001:0  ccm.war.tar.gz /config/apps/ccm.war/
COPY --chown=1001:0  rm.war.tar.gz /config/apps/rm.war/
COPY --chown=1001:0  qm.war.tar.gz /config/apps/qm.war/
